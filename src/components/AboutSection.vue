<script setup>
import { ref, onMounted } from 'vue'
import SplitText from '@/components/SplitText/SplitText.vue'
import Carousel from '@/components/Carousel/Carousel.vue'

const isVisible = ref(false)

const statsCarouselItems = [
  {
    id: 1,
    title: '1+',
    description: 'Years Experience',
    icon: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>'
  },
  {
    id: 2,
    title: '7+',
    description: 'Projects Completed',
    icon: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"/></svg>'
  },
  {
    id: 3,
    title: '4+',
    description: 'Happy Clients',
    icon: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>'
  }
  // {
  //   id: 4,
  //   title: '99%',
  //   description: 'Server Uptime',
  //   icon: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="2" y="2" width="20" height="8" rx="2" ry="2"/><rect x="2" y="14" width="20" height="8" rx="2" ry="2"/><line x1="6" y1="6" x2="6.01" y2="6"/><line x1="6" y1="18" x2="6.01" y2="18"/></svg>'
  // }
]

onMounted(() => {
  const observer = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          isVisible.value = true
        }
      })
    },
    { threshold: 0.2 }
  )

  const section = document.getElementById('about')
  if (section) observer.observe(section)
})
</script>

<template>
  <section id="about" class="about section">
    <div class="container">
      <div class="tag">// About Me</div>
      <div class="about__header">
        <SplitText
          :text="'Get to know me'"
          class="section-title"
          :delay="80"
          animation-from="{ opacity: 0, transform: 'translateY(20px)' }"
          animation-to="{ opacity: 1, transform: 'translateY(0)' }"
          threshold="0.2"
        />
      </div>

      <div class="about__grid">
        <div class="about__text">
          <p class="about__paragraph">
           An Information Systems graduate and DevOps Engineer who naturally bridges the gap between software engineering and system operations. My career journey—spanning from foundational IT Support at Gunadarma University to Full-Stack development using PHP/Laravel—gives me a holistic view of the entire software lifecycle. 
          </p>
          <p class="about__paragraph">
           Today, I am deeply focused on modern deployment strategies, bringing hands-on expertise in Docker and configuring multi-node Kubernetes clusters from scratch on both virtual and bare-metal environments. I am constantly driven by the challenge of optimizing pipelines to build highly resilient and scalable infrastructure.
          </p>

          <div class="about__highlights">
            <div class="about__highlight">
              <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
              <span>Infrastructure as Code (Terraform)</span>
            </div>
            <div class="about__highlight">
              <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
              <span>Container Orchestration (Docker & Kubernetes)</span>
            </div>
            <div class="about__highlight">
              <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
              <span>CI/CD Pipeline Design & Optimization</span>
            </div>
            <div class="about__highlight">
              <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
              <span>Laravel & PHP Enterprise Applications</span>
            </div>
          </div>
        </div>

        <div class="about__stats-carousel">
          <Carousel
            :items="statsCarouselItems"
            :base-width="280"
            :autoplay="true"
            :autoplay-delay="3000"
            :pause-on-hover="true"
            :loop="true"
            :round="true"
          />
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
/* .about__header {
  margin-bottom: var(--space-md);
} */

.about__grid {
  display: grid;
  grid-template-columns: 1.2fr 1fr;
  gap: var(--space-4xl);
  align-items: center;
}

.about__paragraph {
  color: var(--color-text-secondary);
  font-size: var(--font-size-base);
  line-height: 1.8;
  margin-bottom: var(--space-lg);
}

.about__paragraph strong {
  color: var(--color-accent-primary);
  font-weight: 600;
}

.about__highlights {
  display: flex;
  flex-direction: column;
  gap: var(--space-md);
  margin-top: var(--space-xl);
}

.about__highlight {
  display: flex;
  align-items: center;
  gap: var(--space-md);
  color: var(--color-text-secondary);
  font-size: var(--font-size-sm);
}

.about__highlight svg {
  color: var(--color-accent-primary);
  flex-shrink: 0;
}

.about__stats-carousel {
  width: 100%;
  display: flex;
  justify-content: center;
  overflow: hidden;
  position: relative;
  padding: 10px 0;
}

@media (max-width: 768px) {
  .about__grid {
    grid-template-columns: 1fr;
    gap: var(--space-2xl);
  }
}
</style>
