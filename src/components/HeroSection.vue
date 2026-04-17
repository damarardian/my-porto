<script setup>
import LetterGlitch from '@/components/LetterGlitch/LetterGlitch.vue'
import DecryptedText from '@/components/DecryptedText/DecryptedText.vue'
import BlurText from '@/components/BlurText/BlurText.vue'
import ProfileCard from '@/components/ProfileCard/ProfileCard.vue'
import profileImg from '@/assets/profile.png'
</script>

<template>
  <section id="home" class="hero">
    <div class="hero__bg">
      <LetterGlitch
        :glitch-colors="['#0a2f2f', '#00d4aa', '#0099ff']"
        :glitch-speed="60"
        :center-vignette="true"
        :outer-vignette="true"
        :smooth="true"
      />
    </div>

    <div class="hero__overlay"></div>

    <div class="hero__content container">
      <div class="hero__profile">
        <div class="hero__card-wrapper">
          <ProfileCard
            :avatar-url="profileImg"
            :mini-avatar-url="profileImg"
            name="Damar ardian alfirisky"
            title="DevOps Engineer & PHP Developer"
            handle="damarardian"
            status="Available for work"
            contact-text="Hire Me"
            :show-user-info="true"
            :enable-tilt="true"
            :show-behind-gradient="false"
            inner-gradient="linear-gradient(145deg, rgba(20,20,30,0.9) 0%, rgba(15,15,25,0.95) 100%)"
            behind-gradient="none"
          />
        </div>

        <div class="hero__info">
          <div class="hero__tag">
            <span class="hero__tag-dot"></span>
            Available for work
          </div>

          <h1 class="hero__name">
            <DecryptedText
              text="Damar ardian alfirisky"
              :speed="80"
              :max-iterations="15"
              :sequential="true"
              reveal-direction="start"
              animate-on="view"
              class-name="hero__char"
              encrypted-class-name="hero__char--encrypted"
            />
          </h1>

          <BlurText
            text="DevOps Engineer & PHP Developer"
            :delay="100"
            animate-by="words"
            direction="top"
            class="hero__tagline"
          />

          <p class="hero__desc">
            Building scalable infrastructure and crafting robust web applications.
            Specialized in Docker, Kubernetes, CI/CD, Laravel, and cloud-native solutions.
          </p>

          <div class="hero__actions">
            <a href="#portfolio" class="btn btn-primary" @click.prevent="$emit('scrollTo', 'portfolio')">
              <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/>
                <path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/>
              </svg>
              View Portfolio
            </a>
            <a href="#contact" class="btn btn-outline" @click.prevent="$emit('scrollTo', 'contact')">
              <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72"/>
              </svg>
              Contact Me
            </a>
          </div>

          <div class="hero__socials">
            <a href="https://github.com" target="_blank" rel="noopener" class="hero__social" aria-label="GitHub">
              <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor"><path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"/></svg>
            </a>
            <a href="https://linkedin.com" target="_blank" rel="noopener" class="hero__social" aria-label="LinkedIn">
              <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor"><path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"/></svg>
            </a>
            <a href="mailto:hello@example.com" class="hero__social" aria-label="Email">
              <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="2" y="4" width="20" height="16" rx="2"/><path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"/></svg>
            </a>
          </div>
        </div>
      </div>
    </div>

    <div class="hero__scroll-indicator">
      <span>Scroll down</span>
      <div class="hero__scroll-line"></div>
    </div>
  </section>
</template>

<style scoped>
.hero {
  position: relative;
  min-height: 100vh;
  display: flex;
  align-items: center;
  overflow: hidden;
}

.hero__bg {
  position: absolute;
  inset: 0;
  z-index: 0;
  opacity: 0.4;
}

.hero__overlay {
  position: absolute;
  inset: 0;
  background: linear-gradient(180deg, rgba(10,10,15,0.3) 0%, rgba(10,10,15,0.8) 70%, rgba(10,10,15,1) 100%);
  z-index: 1;
}

.hero__content {
  position: relative;
  z-index: 2;
  padding-top: calc(var(--nav-height) + var(--space-2xl));
  padding-bottom: 140px; /* Provides safe space for absolute scroll indicator */
}

.hero__profile {
  display: flex;
  align-items: center;
  gap: var(--space-3xl);
}

.hero__card-wrapper {
  flex-shrink: 0;
  width: 320px;
}

/* Scale down the ProfileCard for hero section */
:deep(.pc-card-wrapper) {
  width: 100% !important;
}

:deep(.pc-card) {
  height: 420px !important;
  max-height: 420px !important;
  /* Remove colorful background, keep dark with subtle border */
  background-image: none !important;
  background-color: #0d0d18 !important;
  border: 1px solid rgba(255, 255, 255, 0.08) !important;
}

/* Remove holographic shine effect */
:deep(.pc-shine),
:deep(.pc-shine::before),
:deep(.pc-shine::after) {
  background-image: none !important;
  background: transparent !important;
  opacity: 0 !important;
}

/* Remove colored glare, keep subtle light reflection */
:deep(.pc-glare) {
  background-image: radial-gradient(
    farthest-corner circle at var(--pointer-x) var(--pointer-y),
    rgba(255, 255, 255, 0.06) 12%,
    rgba(255, 255, 255, 0.02) 90%
  ) !important;
  mix-blend-mode: normal !important;
  filter: none !important;
}

/* Clean inner background */
:deep(.pc-inside) {
  background-color: rgba(10, 10, 20, 0.95) !important;
  background-image: linear-gradient(145deg, rgba(20,20,30,0.9) 0%, rgba(12,12,22,0.95) 100%) !important;
}

/* Make avatar show normally without color blending */
:deep(.pc-avatar-content) {
  mix-blend-mode: normal !important;
}

:deep(.pc-avatar-content .avatar) {
  opacity: 1 !important;
}

/* Clean up text colors in card */
:deep(.pc-details h3) {
  background-image: linear-gradient(to bottom, #fff, rgba(255,255,255,0.7)) !important;
}

:deep(.pc-details p) {
  background-image: linear-gradient(to bottom, rgba(255,255,255,0.9), rgba(255,255,255,0.5)) !important;
}

/* Subtle border glow on hover instead of colors */
:deep(.pc-card-wrapper:hover .pc-card),
:deep(.pc-card-wrapper.active .pc-card) {
  border-color: rgba(0, 212, 170, 0.15) !important;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.4),
              0 0 60px rgba(0, 212, 170, 0.05) !important;
}

.hero__info {
  max-width: 600px;
}

.hero__tag {
  display: inline-flex;
  align-items: center;
  gap: var(--space-sm);
  padding: var(--space-xs) var(--space-md);
  background: rgba(0, 212, 170, 0.1);
  border: 1px solid rgba(0, 212, 170, 0.2);
  border-radius: var(--radius-full);
  font-size: var(--font-size-xs);
  font-weight: 500;
  color: var(--color-accent-primary);
  font-family: var(--font-mono);
  margin-bottom: var(--space-lg);
}

.hero__tag-dot {
  width: 6px;
  height: 6px;
  border-radius: 50%;
  background: var(--color-accent-primary);
  animation: pulse-glow 2s ease-in-out infinite;
}

.hero__name {
  font-size: var(--font-size-hero);
  font-weight: 900;
  letter-spacing: -0.03em;
  line-height: 1.1;
  margin-bottom: var(--space-md);
  background: var(--color-accent-gradient);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.hero__char {
  transition: color 0.2s;
}

.hero__char--encrypted {
  color: var(--color-text-muted);
}

:deep(.hero__tagline) {
  font-size: var(--font-size-2xl) !important;
  font-weight: 600 !important;
  color: var(--color-text-primary) !important;
  margin-bottom: var(--space-lg) !important;
}

.hero__desc {
  color: var(--color-text-secondary);
  font-size: var(--font-size-base);
  line-height: 1.7;
  margin-bottom: var(--space-xl);
  max-width: 500px;
}

.hero__actions {
  display: flex;
  gap: var(--space-md);
  margin-bottom: var(--space-xl);
}

.hero__socials {
  display: flex;
  gap: var(--space-md);
}

.hero__social {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 42px;
  height: 42px;
  border-radius: var(--radius-md);
  border: 1px solid var(--color-border);
  color: var(--color-text-secondary);
  transition: all var(--transition-base);
}

.hero__social:hover {
  border-color: var(--color-accent-primary);
  color: var(--color-accent-primary);
  transform: translateY(-3px);
  box-shadow: var(--shadow-glow);
}

.hero__scroll-indicator {
  position: absolute;
  bottom: 2rem;
  left: 50%;
  transform: translateX(-50%);
  z-index: 2;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: var(--space-sm);
  color: var(--color-text-muted);
  font-size: var(--font-size-xs);
  font-family: var(--font-mono);
  animation: float 3s ease-in-out infinite;
}

.hero__scroll-line {
  width: 1px;
  height: 40px;
  background: linear-gradient(to bottom, var(--color-accent-primary), transparent);
}

@media (max-width: 768px) {
  .hero__profile {
    flex-direction: column;
    text-align: center;
    align-items: center;
  }

  .hero__card-wrapper {
    width: 260px;
  }

  :deep(.pc-card) {
    height: 340px !important;
    max-height: 340px !important;
  }

  .hero__info {
    display: flex;
    flex-direction: column;
    align-items: center;
  }

  .hero__desc {
    text-align: center;
  }

  .hero__actions {
    flex-direction: column;
    width: 100%;
  }

  .btn {
    justify-content: center;
  }

  .hero__socials {
    justify-content: center;
  }
}
</style>
