<script setup>
import ShinyText from '@/components/ShinyText/ShinyText.vue'

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
    tags: ['Docker', 'Terraform', 'MySQL', 'Vue.js']
  },
  {
    id: 3,
    title: 'Forensic Digital',
    company: 'Direktorat Jenderal Pajak',
    period: 'Nov 2024 - Jan 2020',
    description: 'Maintained Linux servers, managed backups, and provided technical support for enterprise clients. Configured monitoring tools to ensure 99.9% uptime.',
    tags: ['Linux', 'Bash', 'Networking', 'Monitoring']
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

      <div class="timeline">
        <div class="timeline__line"></div>
        
        <div
          v-for="(exp, index) in experiences"
          :key="exp.id"
          :class="['timeline__item', index % 2 === 0 ? 'timeline__item--left' : 'timeline__item--right']"
        >
          <div class="timeline__dot"></div>
          <div class="timeline__content">
            <div class="timeline__date">{{ exp.period }}</div>
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
}

.timeline__line {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 50%;
  width: 2px;
  background: var(--color-border);
  transform: translateX(-50%);
}

.timeline__item {
  position: relative;
  margin-bottom: var(--space-3xl);
  width: 100%;
  display: flex;
  justify-content: space-between;
}

.timeline__item:last-child {
  margin-bottom: 0;
}

.timeline__item--left {
  flex-direction: row-reverse;
}

.timeline__dot {
  position: absolute;
  left: 50%;
  top: 0;
  width: 16px;
  height: 16px;
  border-radius: 50%;
  background: var(--color-bg-primary);
  border: 3px solid var(--color-accent-primary);
  transform: translateX(-50%);
  z-index: 2;
  box-shadow: 0 0 10px rgba(0, 212, 170, 0.5);
  transition: all var(--transition-base);
}

.timeline__item:hover .timeline__dot {
  box-shadow: 0 0 20px rgba(0, 212, 170, 0.8);
  background: var(--color-accent-primary);
}

.timeline__content {
  width: calc(50% - 40px);
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

.timeline__item--left .timeline__content {
  text-align: right;
}

.timeline__item--left .timeline__tags {
  justify-content: flex-end;
}

.timeline__date {
  display: inline-block;
  font-family: var(--font-mono);
  font-size: var(--font-size-sm);
  color: var(--color-accent-primary);
  margin-bottom: var(--space-sm);
  font-weight: 600;
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
  .timeline__line {
    left: 20px;
    transform: none;
  }

  .timeline__dot {
    left: 20px;
    transform: translateX(-50%);
  }

  .timeline__item,
  .timeline__item--left {
    flex-direction: column;
    align-items: flex-end;
  }

  .timeline__content {
    width: calc(100% - 50px);
  }

  .timeline__item--left .timeline__content {
    text-align: left;
  }

  .timeline__item--left .timeline__tags {
    justify-content: flex-start;
  }
}
</style>
