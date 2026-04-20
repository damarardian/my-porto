<template>
  <div class="project-detail" ref="containerRef">
    <div class="project-detail__header">
      <button class="back-btn" @click="$emit('back')">
        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <path d="m15 18-6-6 6-6"/>
        </svg>
        Go Back
      </button>
      
      <div class="project-detail__title-wrapper">
        <span class="tag">// {{ project.category }}</span>
        <h1 class="project-detail__title">
          <ShinyText :text="project.title" :speed="3" class="portfolio__shiny" />
        </h1>
      </div>
      
      <div class="project-detail__meta">
        <p class="project-detail__desc">{{ project.description }}</p>
        <div class="project-detail__tags">
          <span v-for="tag in project.tags" :key="tag" class="tag-item">
            {{ tag }}
          </span>
        </div>
      </div>
    </div>

    <!-- 3D Interactive Gallery -->
    <div class="project-detail__gallery" @mousemove="handleMouseMove" @mouseleave="handleMouseLeave" ref="galleryRef">
      <div 
        v-for="(img, idx) in project.images" 
        :key="idx" 
        class="gallery-card"
        ref="cardRefs"
      >
        <div class="gallery-card__inner">
          <div class="gallery-card__glow"></div>
          <img :src="img" :alt="`${project.title} screenshot ${idx + 1}`" crossorigin="anonymous" />
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'
import gsap from 'gsap'
import ShinyText from '@/components/ShinyText/ShinyText.vue'

const props = defineProps({
  project: {
    type: Object,
    required: true
  }
})

defineEmits(['back'])

const containerRef = ref(null)
const galleryRef = ref(null)
const cardRefs = ref([])

let mouseX = 0
let mouseY = 0
let rafId = null

const handleMouseMove = (e) => {
  if (!galleryRef.value) return
  const rect = galleryRef.value.getBoundingClientRect()
  const centerX = rect.left + rect.width / 2
  const centerY = rect.top + rect.height / 2
  
  mouseX = ((e.clientX - centerX) / (rect.width / 2)) * 15
  mouseY = ((e.clientY - centerY) / (rect.height / 2)) * -15
}

const handleMouseLeave = () => {
  mouseX = 0
  mouseY = 0
}

const animate = () => {
  if (cardRefs.value.length > 0) {
    cardRefs.value.forEach((card, idx) => {
      if (!card) return
      
      const depth = (idx % 2 === 0 ? 1 : -1) * 2;
      
      gsap.to(card, {
        rotateY: mouseX * 0.8,
        rotateX: mouseY * 0.8,
        x: mouseX * depth,
        y: mouseY * depth,
        duration: 1.2,
        ease: 'power3.out',
        overwrite: 'auto'
      })
    })
  }
  rafId = requestAnimationFrame(animate)
}

onMounted(() => {
  window.scrollTo({ top: 0, behavior: 'instant' })
  
  gsap.fromTo(containerRef.value, 
    { opacity: 0, y: 50 }, 
    { opacity: 1, y: 0, duration: 0.8, ease: 'power3.out' }
  )
  
  gsap.fromTo(cardRefs.value,
    { opacity: 0, y: 100, rotateX: 30, z: -200 },
    { opacity: 1, y: 0, rotateX: 0, z: 0, duration: 1.2, stagger: 0.15, ease: 'expo.out', delay: 0.2 }
  )
  
  rafId = requestAnimationFrame(animate)
})

onUnmounted(() => {
  if (rafId) cancelAnimationFrame(rafId)
})
</script>

<style scoped>
.project-detail {
  padding: calc(var(--nav-height) + var(--space-xl)) var(--space-xl) var(--space-4xl);
  min-height: 100vh;
  margin: 0 auto;
  position: relative;
  z-index: 10;
  background: var(--color-bg);
}

.project-detail__header {
  max-width: 900px;
  margin: 0 auto var(--space-4xl);
  text-align: center;
  position: relative;
}

.back-btn {
  position: absolute;
  top: 0;
  left: 0;
  display: inline-flex;
  align-items: center;
  gap: var(--space-sm);
  padding: 10px 20px;
  background: rgba(255, 255, 255, 0.05);
  border: 1px solid rgba(255, 255, 255, 0.1);
  border-radius: var(--radius-full);
  color: var(--color-text-secondary);
  font-family: var(--font-mono);
  font-size: var(--font-size-sm);
  transition: all var(--transition-base);
  cursor: pointer;
  z-index: 10;
}

.back-btn:hover {
  background: rgba(0, 212, 170, 0.1);
  border-color: rgba(0, 212, 170, 0.3);
  color: var(--color-accent-primary);
  transform: translateX(-5px);
}

.project-detail__title-wrapper {
  margin-bottom: var(--space-xl);
  padding-top: var(--space-xl);
}

.project-detail__title {
  font-size: clamp(2.5rem, 6vw, 4.5rem);
  font-weight: 800;
  line-height: 1.1;
  margin-top: var(--space-sm);
}

:deep(.portfolio__shiny) {
  background: var(--color-accent-gradient);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.project-detail__desc {
  font-size: var(--font-size-lg);
  color: var(--color-text-secondary);
  line-height: 1.8;
  margin-bottom: var(--space-2xl);
  max-width: 700px;
  margin-left: auto;
  margin-right: auto;
}

.project-detail__tags {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: var(--space-sm);
}

.tag-item {
  padding: 6px 16px;
  background: rgba(0, 212, 170, 0.05);
  border: 1px solid rgba(0, 212, 170, 0.2);
  border-radius: var(--radius-full);
  font-size: var(--font-size-sm);
  color: var(--color-accent-primary);
  font-family: var(--font-mono);
}

/* 3D Gallery */
.project-detail__gallery {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
  gap: var(--space-2xl);
  max-width: 1200px;
  margin: 0 auto;
  perspective: 1500px;
  padding: 20px;
}

.gallery-card {
  transform-style: preserve-3d;
  will-change: transform;
  z-index: 1;
}

.gallery-card:nth-child(1) { 
  grid-column: 1 / -1; 
}
.gallery-card:nth-child(1) .gallery-card__inner { 
  height: 60vh; 
  min-height: 400px;
}

.gallery-card__inner {
  position: relative;
  width: 100%;
  height: 400px;
  border-radius: var(--radius-2xl);
  overflow: hidden;
  border: 1px solid rgba(255, 255, 255, 0.1);
  box-shadow: 0 30px 60px rgba(0, 0, 0, 0.5);
  transform: translateZ(30px);
  transition: border-color 0.4s ease;
  background: var(--color-bg-card);
}

.gallery-card__glow {
  position: absolute;
  inset: 0;
  background: radial-gradient(circle at center, rgba(0,212,170,0.15) 0%, transparent 70%);
  opacity: 0;
  transition: opacity 0.4s ease;
  z-index: 2;
  pointer-events: none;
}

.gallery-card__inner:hover {
  border-color: rgba(0, 212, 170, 0.5);
}

.gallery-card__inner:hover .gallery-card__glow {
  opacity: 1;
}

.gallery-card__inner img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.7s cubic-bezier(0.16, 1, 0.3, 1);
  filter: brightness(0.9);
}

.gallery-card__inner:hover img {
  transform: scale(1.03);
  filter: brightness(1.1);
}

@media (max-width: 1024px) {
  .project-detail__header {
    text-align: left;
    display: flex;
    flex-direction: column;
  }
  
  .back-btn {
    position: relative;
    align-self: flex-start;
    margin-bottom: var(--space-xl);
  }
  
  .project-detail__title-wrapper {
    padding-top: 0;
  }
  
  .project-detail__desc {
    margin-left: 0;
    margin-right: 0;
  }
  
  .project-detail__tags {
    justify-content: flex-start;
  }
}

@media (max-width: 768px) {
  .project-detail__gallery {
    grid-template-columns: 1fr;
    gap: var(--space-xl);
    padding: 0;
  }

  .gallery-card:nth-child(1) .gallery-card__inner {
    height: 350px;
    min-height: auto;
  }
  
  .gallery-card__inner {
    height: 280px;
  }
}
</style>
