<script setup>
import { ref, onMounted } from 'vue'
import SplitText from '@/components/SplitText/SplitText.vue'
import Counter from '@/components/Counter/Counter.vue'

const isVisible = ref(false)
const counterValues = ref({
  years: 0,
  projects: 0,
  clients: 0,
  uptime: 0
})

onMounted(() => {
  const observer = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          isVisible.value = true
          setTimeout(() => {
            counterValues.value = { years: 1, projects: 7, clients: 4, uptime: 99 }
          }, 500)
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
            I'm a passionate <strong>DevOps Engineer</strong> and <strong>PHP Developer</strong>
            with a focus on building reliable, scalable infrastructure and high-performance web applications.
          </p>
          <p class="about__paragraph">
            With extensive experience in cloud computing, containerization, and CI/CD pipelines,
            I help teams ship faster and more reliably. My PHP expertise spans from Laravel to
            custom framework development, always following clean code principles.
          </p>
          <p class="about__paragraph">
            I believe in the power of automation and infrastructure as code. Every line of code
            I write aims to be maintainable, testable, and production-ready.
          </p>

          <div class="about__highlights">
            <div class="about__highlight">
              <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
              <span>Infrastructure as Code (Terraform, Ansible)</span>
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

        <div class="about__stats">
          <div class="about__stat-card">
            <div class="about__stat-number">
              <Counter
                :value="counterValues.years"
                :font-size="48"
                :places="[1]"
                :padding="0"
                :gap="4"
                text-color="#00d4aa"
                font-weight="800"
                gradient-from="#0a0a0f"
                gradient-to="transparent"
              />
              <span class="about__stat-plus">+</span>
            </div>
            <span class="about__stat-label">Years Experience</span>
          </div>

          <div class="about__stat-card">
            <div class="about__stat-number">
              <Counter
                :value="counterValues.projects"
                :font-size="48"
                :places="[10, 1]"
                :padding="0"
                :gap="4"
                text-color="#00d4aa"
                font-weight="800"
                gradient-from="#0a0a0f"
                gradient-to="transparent"
              />
              <span class="about__stat-plus">+</span>
            </div>
            <span class="about__stat-label">Projects Completed</span>
          </div>

          <div class="about__stat-card">
            <div class="about__stat-number">
              <Counter
                :value="counterValues.clients"
                :font-size="48"
                :places="[10, 1]"
                :padding="0"
                :gap="4"
                text-color="#00d4aa"
                font-weight="800"
                gradient-from="#0a0a0f"
                gradient-to="transparent"
              />
              <span class="about__stat-plus">+</span>
            </div>
            <span class="about__stat-label">Happy Clients</span>
          </div>

          <div class="about__stat-card">
            <div class="about__stat-number">
              <Counter
                :value="counterValues.uptime"
                :font-size="48"
                :places="[10, 1]"
                :padding="0"
                :gap="4"
                text-color="#00d4aa"
                font-weight="800"
                gradient-from="#0a0a0f"
                gradient-to="transparent"
              />
              <span class="about__stat-percent">%</span>
            </div>
            <span class="about__stat-label">Server Uptime</span>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.about__header {
  margin-bottom: var(--space-3xl);
}

.about__grid {
  display: grid;
  grid-template-columns: 1.2fr 1fr;
  gap: var(--space-4xl);
  align-items: start;
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

.about__stats {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: var(--space-lg);
}

.about__stat-card {
  background: var(--color-bg-card);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-lg);
  padding: var(--space-xl);
  text-align: center;
  transition: all var(--transition-base);
}

.about__stat-card:hover {
  border-color: var(--color-border-hover);
  transform: translateY(-4px);
  box-shadow: var(--shadow-glow);
}

.about__stat-number {
  display: flex;
  align-items: baseline;
  justify-content: center;
  gap: 2px;
  margin-bottom: var(--space-sm);
}

.about__stat-plus,
.about__stat-percent {
  font-size: var(--font-size-2xl);
  font-weight: 800;
  color: var(--color-accent-primary);
}

.about__stat-label {
  font-size: var(--font-size-xs);
  color: var(--color-text-muted);
  font-family: var(--font-mono);
  text-transform: uppercase;
  letter-spacing: 0.1em;
}

@media (max-width: 768px) {
  .about__grid {
    grid-template-columns: 1fr;
    gap: var(--space-2xl);
  }

  .about__stats {
    grid-template-columns: 1fr 1fr;
  }
}

@media (max-width: 480px) {
  .about__stats {
    grid-template-columns: 1fr;
  }
}
</style>
