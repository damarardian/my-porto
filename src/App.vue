<script setup>
import { ref, defineAsyncComponent } from 'vue'
import NavBar from '@/components/NavBar.vue'
import HeroSection from '@/components/HeroSection.vue'
import Ribbons from '@/components/Ribbons/Ribbons.vue'
import ClickSpark from '@/components/ClickSpark/ClickSpark.vue'

// Lazy-loaded components below the fold to speed up initial First Contentful Paint
const AboutSection = defineAsyncComponent(() => import('@/components/AboutSection.vue'))
const SkillsSection = defineAsyncComponent(() => import('@/components/SkillsSection.vue'))
const PortfolioSection = defineAsyncComponent(() => import('@/components/PortfolioSection.vue'))
const ContactSection = defineAsyncComponent(() => import('@/components/ContactSection.vue'))
const FooterSection = defineAsyncComponent(() => import('@/components/FooterSection.vue'))
const ProjectDetail = defineAsyncComponent(() => import('@/components/ProjectDetail.vue'))

const activeProject = ref(null)

const scrollTo = (id) => {
  const el = document.getElementById(id)
  if (el) {
    el.scrollIntoView({ behavior: 'smooth' })
  }
}

const openProject = (project) => {
  activeProject.value = project
  window.scrollTo({ top: 0, behavior: 'smooth' })
}

const closeProject = () => {
  activeProject.value = null
  setTimeout(() => scrollTo('portfolio'), 100)
}
</script>

<template>
  <ClickSpark
    spark-color="#00d4aa"
    :spark-size="12"
    :spark-radius="20"
    :spark-count="10"
    :duration="500"
    easing="ease-out"
    :extra-scale="1.2"
  >
    <div class="app">
      <!-- Background Ribbons -->
      <div class="app__bg-ribbons">
        <Ribbons
          :colors="['#00443a', '#003355', '#002244']"
          :base-spring="0.02"
          :base-friction="0.92"
          :base-thickness="20"
          :speed-multiplier="0.3"
          :max-age="600"
          :point-count="40"
          :enable-fade="true"
        />
      </div>

      <transition name="fade" mode="out-in">
        <ProjectDetail 
          v-if="activeProject" 
          :project="activeProject" 
          @back="closeProject" 
        />
        
        <div v-else class="page-wrapper">
          <NavBar />

          <main>
            <HeroSection @scroll-to="scrollTo" />
            <AboutSection />
            <SkillsSection />
            <PortfolioSection @view-project="openProject" />
            <ContactSection />
          </main>

          <FooterSection />
        </div>
      </transition>
    </div>
  </ClickSpark>
</template>

<style scoped>
.app {
  position: relative;
  min-height: 100vh;
  overflow-x: hidden;
  max-width: 100vw;
}

.app__bg-ribbons {
  position: fixed;
  inset: 0;
  z-index: 0;
  opacity: 0.15;
  pointer-events: none;
}

main {
  position: relative;
  z-index: 1;
}

.page-wrapper {
  width: 100%;
  overflow-x: hidden;
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.4s ease, transform 0.4s ease;
}

.fade-enter-from {
  opacity: 0;
  transform: translateY(10px);
}

.fade-leave-to {
  opacity: 0;
  transform: translateY(-10px);
}
</style>
