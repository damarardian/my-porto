<template>
  <div 
    class="circular-gallery-container" 
    ref="containerRef"
    @mousedown="onPointerDown"
    @mousemove="onPointerMove"
    @mouseup="onPointerUp"
    @mouseleave="onPointerUp"
    @touchstart="onPointerDown"
    @touchmove="onPointerMove"
    @touchend="onPointerUp"
    @wheel="onWheel"
  >
    <div class="circular-gallery-scene">
      <div 
        class="circular-gallery-cylinder" 
        :style="{ transform: `translateZ(${-radius}px) rotateY(${currentRot}deg)` }"
      >
        <div 
          v-for="(item, index) in duplicatedItems" 
          :key="`${index}`"
          class="circular-gallery-item"
          :style="getItemStyle(index)"
        >
          <div class="circular-gallery-item-inner">
            <img :src="item" alt="Gallery item" crossorigin="anonymous" />
            <div class="circular-gallery-item-glow"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted, onUnmounted, watch } from 'vue'

const props = defineProps({
  items: {
    type: Array,
    required: true,
    default: () => []
  },
  itemWidth: {
    type: Number,
    default: 300
  },
  itemSpacing: {
    type: Number,
    default: 40
  }
})

// Duplicate items to ensure a full circle if there are too few
const duplicatedItems = computed(() => {
  if (props.items.length === 0) return []
  let arr = [...props.items]
  // We want at least 8 items to make a decent looking circle
  while (arr.length < 8) {
    arr = [...arr, ...props.items]
  }
  return arr
})

const containerRef = ref(null)

const radius = computed(() => {
  const count = duplicatedItems.value.length
  if (count === 0) return 0
  const itemTotalWidth = props.itemWidth + props.itemSpacing
  return Math.round((itemTotalWidth / 2) / Math.tan(Math.PI / count))
})

const theta = computed(() => {
  const count = duplicatedItems.value.length
  if (count === 0) return 0
  return 360 / count
})

const getItemStyle = (index) => {
  const rY = index * theta.value
  return {
    width: `${props.itemWidth}px`,
    transform: `rotateY(${rY}deg) translateZ(${radius.value}px)`
  }
}

// Interaction States
let targetRot = 0
const currentRot = ref(0)

let isDragging = false
let startX = 0
let lastX = 0
let velocity = 0

let rafId = null

const lerp = (start, end, factor) => {
  return start + (end - start) * factor
}

const update = () => {
  if (!isDragging) {
    // Add a tiny bit of auto-rotation or just apply friction
    targetRot += velocity
    velocity *= 0.95 // Friction
    if (Math.abs(velocity) < 0.01) velocity = 0
  }
  
  // Smoothly interpolate current rotation to target rotation
  currentRot.value = lerp(currentRot.value, targetRot, 0.1)
  
  rafId = requestAnimationFrame(update)
}

const onPointerDown = (e) => {
  isDragging = true
  const clientX = e.touches ? e.touches[0].clientX : e.clientX
  startX = clientX
  lastX = clientX
  velocity = 0
}

const onPointerMove = (e) => {
  if (!isDragging) return
  const clientX = e.touches ? e.touches[0].clientX : e.clientX
  const deltaX = clientX - lastX
  lastX = clientX
  
  // Update rotation based on delta
  targetRot += deltaX * 0.3
  velocity = deltaX * 0.3
}

const onPointerUp = () => {
  if (isDragging) {
    isDragging = false
  }
}

const onWheel = (e) => {
  // Use scroll wheel to rotate
  e.preventDefault()
  targetRot -= e.deltaY * 0.1
  targetRot -= e.deltaX * 0.1
}

onMounted(() => {
  rafId = requestAnimationFrame(update)
  
  // Prevent default image drag to not interfere with custom drag
  const imgs = containerRef.value?.querySelectorAll('img')
  imgs?.forEach(img => {
    img.ondragstart = () => false
  })
})

onUnmounted(() => {
  if (rafId) cancelAnimationFrame(rafId)
})
</script>

<style scoped>
.circular-gallery-container {
  width: 100%;
  height: 60vh;
  min-height: 500px;
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
  cursor: grab;
  user-select: none;
  touch-action: none;
}

.circular-gallery-container:active {
  cursor: grabbing;
}

.circular-gallery-scene {
  perspective: 1500px;
  perspective-origin: center center;
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
}

.circular-gallery-cylinder {
  position: relative;
  width: 0;
  height: 0;
  transform-style: preserve-3d;
  will-change: transform;
}

.circular-gallery-item {
  position: absolute;
  top: 50%;
  left: 50%;
  margin-top: -200px;
  /* Centering adjustment handled tightly */
  margin-left: calc(var(--item-width, -150px)); 
  height: 400px;
  transform-style: preserve-3d;
  /* Add slight backface hidden for performance if needed */
  backface-visibility: hidden;
}

.circular-gallery-item-inner {
  position: absolute;
  inset: 0;
  width: 100%;
  height: 100%;
  border-radius: var(--radius-xl);
  overflow: hidden;
  background: var(--color-bg-card);
  border: 1px solid rgba(255, 255, 255, 0.15);
  box-shadow: 0 20px 40px rgba(0, 0, 0, 0.4);
  transform: translateZ(5px);
  transition: border-color 0.4s ease;
}

.circular-gallery-item-inner:hover {
  border-color: rgba(0, 212, 170, 0.5);
}

.circular-gallery-item-glow {
  position: absolute;
  inset: 0;
  background: radial-gradient(circle at center, rgba(0,212,170,0.15) 0%, transparent 70%);
  opacity: 0;
  transition: opacity 0.4s ease;
  z-index: 2;
  pointer-events: none;
}

.circular-gallery-item-inner:hover .circular-gallery-item-glow {
  opacity: 1;
}

img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  pointer-events: none;
  filter: brightness(0.85);
  transition: filter 0.5s ease, transform 0.5s ease;
}

.circular-gallery-item-inner:hover img {
  filter: brightness(1.1);
  transform: scale(1.05);
}

@media (max-width: 768px) {
  .circular-gallery-item {
    margin-top: -150px;
    height: 300px;
  }
}
</style>
