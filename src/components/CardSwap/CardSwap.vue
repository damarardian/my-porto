<template>
  <div
    ref="containerRef"
    class="card-swap-container perspective-[900px] overflow-visible"
    :style="{
      width: typeof width === 'number' ? `${width}px` : width,
      height: typeof height === 'number' ? `${height}px` : height
    }"
  >
    <div
      v-for="(_, index) in props.totalCards"
      :key="index"
      ref="cardRefs"
      class="card-swap-card absolute top-1/2 left-1/2 rounded-xl border border-white bg-black [transform-style:preserve-3d] [will-change:transform] [backface-visibility:hidden]"
      :style="{
        width: typeof width === 'number' ? `${width}px` : width,
        height: typeof height === 'number' ? `${height}px` : height
      }"
      @click="handleCardClick(index)"
    >
      <slot :name="`card-${index}`" :index="index" />
    </div>
  </div>
</template>

<script lang="ts">
import gsap from 'gsap';

export interface CardSwapProps {
  width?: number | string;
  height?: number | string;
  cardDistance?: number;
  verticalDistance?: number;
  delay?: number;
  pauseOnHover?: boolean;
  onCardClick?: (idx: number) => void;
  skewAmount?: number;
  easing?: 'linear' | 'elastic';
  totalCards?: number;
}

interface Slot {
  x: number;
  y: number;
  scale: number;
  zIndex: number;
}

const makeSlot = (i: number, total: number): Slot => ({
  x: 0,
  y: i * -15, // Negative Y offset so cards peek from the top
  scale: 1 - i * 0.05,
  zIndex: total - i
});

const placeNow = (el: HTMLElement, slot: Slot) => {
  gsap.set(el, {
    x: slot.x,
    y: slot.y,
    xPercent: -50,
    yPercent: -50,
    scale: slot.scale,
    transformOrigin: 'top center',
    zIndex: slot.zIndex,
    force3D: true
  });
};

export { makeSlot, placeNow };
</script>

<script setup lang="ts">
import { ref, onMounted, onUnmounted, watch, nextTick, computed, useTemplateRef } from 'vue';

const props = withDefaults(defineProps<CardSwapProps>(), {
  width: 500,
  height: 400,
  cardDistance: 60,
  verticalDistance: 70,
  delay: 5000,
  pauseOnHover: false,
  skewAmount: 6,
  easing: 'elastic',
  totalCards: 3
});

const emit = defineEmits<{
  'card-click': [index: number];
}>();

const containerRef = useTemplateRef<HTMLDivElement>('containerRef');
const cardRefs = ref<HTMLElement[]>([]);
const order = ref<number[]>(Array.from({ length: props.totalCards }, (_, i) => i));
const tlRef = ref<gsap.core.Timeline | null>(null);
const intervalRef = ref<number>();

const handleCardClick = (index: number) => {
  emit('card-click', index);
  props.onCardClick?.(index);
};

const config = computed(() => {
  return {
    ease: 'power3.out',
    durDrop: 0.6,
    durMove: 0.6,
    durReturn: 0.6,
    promoteOverlap: 0.7,
    returnDelay: 0.05
  };
});

const initializeCards = () => {
  if (!cardRefs.value.length) return;

  const total = cardRefs.value.length;

  cardRefs.value.forEach((el, i) => {
    if (el) {
      placeNow(el, makeSlot(i, total));
    }
  });
};

const updateCardPositions = () => {
  if (!cardRefs.value.length) return;

  const total = cardRefs.value.length;

  cardRefs.value.forEach((el, i) => {
    if (el) {
      const slot = makeSlot(i, total);
      gsap.set(el, {
        x: slot.x,
        y: slot.y,
        scale: slot.scale
      });
    }
  });
};

const swap = () => {
  if (order.value.length < 2) return;

  const [front, ...rest] = order.value;
  const elFront = cardRefs.value[front];
  if (!elFront) return;

  const tl = gsap.timeline();
  tlRef.value = tl;

  const dropEnd = config.value.durDrop;
  const promoteTime = dropEnd - (dropEnd * config.value.promoteOverlap);

  // 1. Drop the front card down and fade it out
  tl.to(elFront, {
    y: '+=150',
    scale: 0.85,
    opacity: 0,
    duration: config.value.durDrop,
    ease: config.value.ease
  }, 0);

  // 2. Move the remaining cards up to their new slots
  rest.forEach((idx, i) => {
    const el = cardRefs.value[idx];
    if (!el) return;

    const slot = makeSlot(i, cardRefs.value.length);
    tl.set(el, { zIndex: slot.zIndex }, promoteTime);
    tl.to(
      el,
      {
        y: slot.y,
        scale: slot.scale,
        duration: config.value.durMove,
        ease: config.value.ease
      },
      promoteTime
    );
  });

  // 3. Snap the front card to the back of the stack AFTER the drop finishes
  const backSlot = makeSlot(
    cardRefs.value.length - 1,
    cardRefs.value.length
  );
  
  tl.set(elFront, { 
    zIndex: backSlot.zIndex, 
    y: backSlot.y, 
    scale: backSlot.scale 
  }, dropEnd);
  
  // 4. Fade it back in
  tl.to(
    elFront,
    {
      opacity: 1,
      duration: config.value.durReturn,
      ease: config.value.ease
    },
    dropEnd + config.value.returnDelay
  );

  tl.call(() => {
    order.value = [...rest, front];
  });
};

const startAnimation = () => {
  stopAnimation();
  swap();
  intervalRef.value = window.setInterval(swap, props.delay);
};

const stopAnimation = () => {
  tlRef.value?.kill();
  if (intervalRef.value) {
    clearInterval(intervalRef.value);
  }
};

const resumeAnimation = () => {
  tlRef.value?.play();
  intervalRef.value = window.setInterval(swap, props.delay);
};

const setupHoverListeners = () => {
  if (props.pauseOnHover && containerRef.value) {
    containerRef.value.addEventListener('mouseenter', stopAnimation);
    containerRef.value.addEventListener('mouseleave', resumeAnimation);
  }
};

const removeHoverListeners = () => {
  if (containerRef.value) {
    containerRef.value.removeEventListener('mouseenter', stopAnimation);
    containerRef.value.removeEventListener('mouseleave', resumeAnimation);
  }
};

watch(
  () => [props.cardDistance, props.verticalDistance, props.skewAmount],
  () => {
    updateCardPositions();
  }
);

watch(
  () => props.delay,
  () => {
    if (intervalRef.value) {
      clearInterval(intervalRef.value);
      intervalRef.value = window.setInterval(swap, props.delay);
    }
  }
);

watch(
  () => props.pauseOnHover,
  () => {
    removeHoverListeners();
    setupHoverListeners();
  }
);

watch(
  () => props.easing,
  () => {}
);

onMounted(() => {
  nextTick(() => {
    initializeCards();
    startAnimation();
    setupHoverListeners();
  });
});

onUnmounted(() => {
  stopAnimation();
  removeHoverListeners();
});
</script>
