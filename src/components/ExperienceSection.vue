<script setup>
import { ref, onMounted, onUnmounted, nextTick } from 'vue'
import gsap from 'gsap'
import ScrollTrigger from 'gsap/ScrollTrigger'
import ShinyText from '@/components/ShinyText/ShinyText.vue'

gsap.registerPlugin(ScrollTrigger)

const timelineRef = ref(null)
const lineProgressRef = ref(null)
let scrollTriggerInstance = null

onMounted(() => {
  nextTick(() => {
    scrollTriggerInstance = ScrollTrigger.create({
      trigger: timelineRef.value,
      start: "top center",
      end: "bottom center",
      onUpdate: (self) => {
        if (lineProgressRef.value) {
          gsap.set(lineProgressRef.value, {
            height: `${self.progress * 100}%`
          })
        }
      }
    })
  })
})

onUnmounted(() => {
  if (scrollTriggerInstance) {
    scrollTriggerInstance.kill()
  }
})

const experiences = [
  {
    id: 1,
    title: 'DevOps Engineer Intern',
    company: 'PT. Wahana Prestasi Logistik',
    period: 'Dec 2025 - Jun 2026',
    description: 'I architected Kubernetes clusters from scratch to production. I managed some Linux servers, Terraform (IaC), and Docker. Deployments were automated via GitOps (GitLab CI, ArgoCD), supported by robust monitoring using Prometheus, Grafana, and Headlamp',
    tags: ['Kubernetes', 'Docker', 'CI/CD', 'Grafana', 'Headlamp', 'GitLab CI', 'ArgoCD']
  },
  {
    id: 2,
    title: 'IT staff & Coordinator',
    company: 'Gunadarma University',
    period: 'Okt 2023 - Dec 2025',
    description: 'As an IT staff at the Information Systems Lab, I managed hardware/software maintenance and network troubleshooting for seamless operations. Alongside supporting practical sessions, I accurately handled large-scale data entry for hundreds of student records to optimize administration',
    tags: ['MySQL', 'Vue.js', 'Linux', 'PHP', 'UI/UX', 'Programming Logic']
  },
  {
    id: 3,
    title: 'Forensic Digital Intern',
    company: 'Direktorat Jenderal Pajak',
    period: 'Nov 2024 - Jan 2025',
    description: 'Explored digital forensics in tax investigations to detect evidence manipulation. I utilized FTK Imager for data acquisition, applied hashing to verify data integrity, and analyzed metadata to validate file authenticity. This hands-on experience significantly deepened my understanding of compliance and investigative workflows.',
    tags: ['Tax Management', 'FTK Imager', 'Autopsy', 'Hashing', 'Metadata']
  }
]
</script>

<template>
  <section id="experience" class="experience section">
    <div class="container">
      <div class="experience__header">
        <span class="tag">// Experience</span>
        <h2 class="section-title">
          Work
          <ShinyText text="Experience" :speed="3" class="experience__shiny" />
        </h2>
        <p class="section-subtitle">
          My professional journey and career milestones.
        </p>
      </div>

      <div class="timeline" ref="timelineRef">
        
        <div
          v-for="(exp, index) in experiences"
          :key="exp.id"
          class="timeline__item"
        >
          <div class="timeline__left">
            <div class="timeline__dot-wrapper">
              <div class="timeline__dot"></div>
            </div>
            <div class="timeline__date timeline__date--desktop">{{ exp.period }}</div>
          </div>

          <div class="timeline__content">
            <div class="timeline__date timeline__date--mobile">{{ exp.period }}</div>
            <h3 class="timeline__title">{{ exp.title }}</h3>
            <h4 class="timeline__company">{{ exp.company }}</h4>
            <p class="timeline__desc">{{ exp.description }}</p>
            <div class="timeline__tags">
              <span v-for="tag in exp.tags" :key="tag" class="timeline__tag">
                {{ tag }}
              </span>
            </div>
          </div>
        </div>

        <div class="timeline__line-wrapper">
          <div class="timeline__line-progress" ref="lineProgressRef"></div>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.experience__header {
  margin-bottom: var(--space-2xl);
  text-align: center;
}

:deep(.experience__shiny) {
  background: var(--color-accent-gradient);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.experience__header .tag {
  margin-bottom: var(--space-md);
}

.experience__header .section-subtitle {
  margin: 0 auto;
}

/* Timeline */
.timeline {
  position: relative;
  max-width: 1000px;
  margin: 0 auto;
  padding: var(--space-xl) 0;
  padding-bottom: var(--space-4xl);
}

.timeline__line-wrapper {
  position: absolute;
  left: 35px;
  top: var(--space-xl);
  bottom: var(--space-4xl);
  width: 2px;
  transform: translateX(-50%);
  background: linear-gradient(to bottom, transparent, var(--color-border) 5%, var(--color-border) 95%, transparent);
  overflow: hidden;
  z-index: 1;
}

.timeline__line-progress {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 0%;
  background: linear-gradient(to bottom, transparent, var(--color-accent-primary));
  box-shadow: 0 0 10px rgba(0, 212, 170, 0.5);
  border-radius: 2px;
}

.timeline__item {
  display: flex;
  justify-content: flex-start;
  padding-top: var(--space-4xl);
  gap: var(--space-2xl);
  position: relative;
}

.timeline__item:first-child {
  padding-top: 0;
}

/* Left Section */
.timeline__left {
  position: sticky;
  top: 150px;
  display: flex;
  align-items: center;
  align-self: flex-start;
  flex-shrink: 0;
  width: 300px;
  z-index: 10;
}

.timeline__dot-wrapper {
  position: absolute;
  left: 35px;
  width: 40px;
  height: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: var(--color-bg);
  border-radius: 50%;
  transform: translateX(-50%);
  z-index: 2;
}

.timeline__dot {
  width: 14px;
  height: 14px;
  border-radius: 50%;
  background: var(--color-bg-card);
  border: 3px solid var(--color-border);
  transition: all var(--transition-base);
}

.timeline__item:hover .timeline__dot {
  border-color: var(--color-accent-primary);
  background: var(--color-accent-primary);
  box-shadow: 0 0 15px rgba(0, 212, 170, 0.6);
}

.timeline__date {
  font-family: var(--font-mono);
  color: var(--color-accent-primary);
  font-weight: 700;
}

.timeline__date--desktop {
  padding-left: 80px;
  font-size: clamp(1.2rem, 3vw, 1.8rem);
  opacity: 0.8;
}

.timeline__date--mobile {
  display: none;
}

/* Right Section */
.timeline__content {
  position: relative;
  width: 100%;
  background: var(--color-bg-card);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-xl);
  padding: var(--space-xl);
  transition: all var(--transition-base);
}

.timeline__item:hover .timeline__content {
  border-color: var(--color-border-hover);
  box-shadow: var(--shadow-glow);
  transform: translateY(-5px);
}

.timeline__title {
  font-size: var(--font-size-xl);
  font-weight: 700;
  color: var(--color-text-primary);
  margin-bottom: var(--space-xs);
}

.timeline__company {
  font-size: var(--font-size-base);
  color: var(--color-text-secondary);
  font-weight: 500;
  margin-bottom: var(--space-md);
}

.timeline__desc {
  font-size: var(--font-size-sm);
  color: var(--color-text-secondary);
  line-height: 1.7;
  margin-bottom: var(--space-md);
}

.timeline__tags {
  display: flex;
  flex-wrap: wrap;
  gap: var(--space-xs);
}

.timeline__tag {
  padding: 3px 12px;
  background: rgba(0, 212, 170, 0.08);
  border: 1px solid rgba(0, 212, 170, 0.15);
  border-radius: var(--radius-full);
  font-size: var(--font-size-xs);
  color: var(--color-accent-primary);
  font-family: var(--font-mono);
}

/* Responsive */
@media (max-width: 768px) {
  .timeline__line-wrapper {
    left: 20px;
  }

  .timeline__dot-wrapper {
    left: 20px;
  }

  .timeline__item {
    flex-direction: column;
    padding-top: var(--space-3xl);
    gap: var(--space-md);
  }

  .timeline__left {
    position: relative;
    top: 0;
    width: 100%;
    max-width: 100%;
  }

  .timeline__date--desktop {
    display: none;
  }

  .timeline__date--mobile {
    display: block;
    font-size: var(--font-size-lg);
    margin-bottom: var(--space-sm);
    opacity: 0.9;
  }

  .timeline__content {
    /* Instead of margin, we can just leave it full width, and maybe smaller padding */
    padding: var(--space-lg);
    margin-left: 50px;
    width: calc(100% - 50px);
  }
}

</style>
