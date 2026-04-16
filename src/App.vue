<script setup>
import NavBar from '@/components/NavBar.vue'
import HeroSection from '@/components/HeroSection.vue'
import AboutSection from '@/components/AboutSection.vue'
import SkillsSection from '@/components/SkillsSection.vue'
import PortfolioSection from '@/components/PortfolioSection.vue'
import ContactSection from '@/components/ContactSection.vue'
import FooterSection from '@/components/FooterSection.vue'
import Ribbons from '@/components/Ribbons/Ribbons.vue'
import ClickSpark from '@/components/ClickSpark/ClickSpark.vue'

const scrollTo = (id) => {
  const el = document.getElementById(id)
  if (el) {
    el.scrollIntoView({ behavior: 'smooth' })
  }
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

      <NavBar />

      <main>
        <HeroSection @scroll-to="scrollTo" />
        <AboutSection />
        <SkillsSection />
        <PortfolioSection />
        <ContactSection />
      </main>

      <FooterSection />
    </div>
  </ClickSpark>
</template>

<style scoped>
.app {
  position: relative;
  min-height: 100vh;
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
</style>
