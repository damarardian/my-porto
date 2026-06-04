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

    <!-- WebGL-Style Circular Gallery -->
    <div class="project-detail__gallery-wrapper">
      <CircularGallery :items="project.images" />
    </div>

    <!-- Rich Content Sections -->
    <div v-if="project.sections && project.sections.length > 0" class="project-detail__content">
      <div 
        v-for="(section, idx) in project.sections" 
        :key="idx"
        :class="['content-section', `content-section--img-${section.imagePosition}`]"
      >
        <div class="content-section__text">
          <h2>{{ section.title }}</h2>
          <p>{{ section.content }}</p>
        </div>
        <div v-if="section.image" class="content-section__image">
          <img :src="section.image" :alt="section.title" loading="lazy" />
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import gsap from 'gsap'
import ShinyText from '@/components/ShinyText/ShinyText.vue'
import CircularGallery from '@/components/CircularGallery.vue'

const props = defineProps({
  project: {
    type: Object,
    required: true
  }
})

defineEmits(['back'])

const containerRef = ref(null)

onMounted(() => {
  window.scrollTo({ top: 0, behavior: 'instant' })
  
  gsap.fromTo(containerRef.value, 
    { opacity: 0, y: 50 }, 
    { opacity: 1, y: 0, duration: 0.8, ease: 'power3.out' }
  )
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

/* 3D Gallery Wrapper */
.project-detail__gallery-wrapper {
  margin: 0 auto;
  max-width: 100vw;
  overflow: hidden;
  position: relative;
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

/* Rich Content Styles */
.project-detail__content {
  max-width: 1000px;
  margin: var(--space-4xl) auto;
  padding: 0 var(--space-xl);
  display: flex;
  flex-direction: column;
  gap: var(--space-4xl);
}

.content-section {
  display: flex;
  align-items: center;
  gap: var(--space-3xl);
}

.content-section--img-left {
  flex-direction: row-reverse;
}

.content-section--img-none .content-section__text {
  max-width: 800px;
  margin: 0 auto;
  text-align: center;
}

.content-section__text {
  flex: 1;
}

.content-section__text h2 {
  font-size: var(--font-size-2xl);
  color: var(--color-text-primary);
  margin-bottom: var(--space-md);
  font-weight: 700;
}

.content-section__text p {
  font-size: var(--font-size-base);
  color: var(--color-text-secondary);
  line-height: 1.8;
}

.content-section__image {
  flex: 1;
  border-radius: var(--radius-xl);
  overflow: hidden;
  border: 1px solid var(--color-border);
  box-shadow: var(--shadow-lg);
  max-height: 400px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.content-section__image img {
  width: 100%;
  height: auto;
  object-fit: cover;
  display: block;
}

@media (max-width: 768px) {
  .project-detail__content {
    gap: var(--space-3xl);
  }
  
  .content-section,
  .content-section--img-left {
    flex-direction: column;
    text-align: center;
    gap: var(--space-xl);
  }
  
  .content-section__image {
    width: 100%;
    max-height: none;
  }
}
</style>
