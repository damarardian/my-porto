<script setup>
import BorderGlow from '@/components/BorderGlow/BorderGlow.vue'
import GradientText from '@/components/GradientText/GradientText.vue'

const skillCategories = [
  {
    title: 'DevOps & Cloud',
    icon: '☁️',
    glowColor: '170 80 60',
    colors: ['#00d4aa', '#0099ff', '#00d4aa'],
    skills: [
      { name: 'Docker', level: 95 },
      { name: 'Kubernetes', level: 88 },
      { name: 'AWS / GCP', level: 85 },
      { name: 'Terraform', level: 82 },
      { name: 'Ansible', level: 80 },
      { name: 'Linux Admin', level: 92 }
    ]
  },
  {
    title: 'CI/CD & Monitoring',
    icon: '🔄',
    glowColor: '210 80 60',
    colors: ['#0099ff', '#38bdf8', '#0099ff'],
    skills: [
      { name: 'Jenkins', level: 90 },
      { name: 'GitHub Actions', level: 92 },
      { name: 'GitLab CI', level: 88 },
      { name: 'Prometheus', level: 85 },
      { name: 'Grafana', level: 87 },
      { name: 'ELK Stack', level: 78 }
    ]
  },
  {
    title: 'PHP & Backend',
    icon: '🐘',
    glowColor: '260 80 70',
    colors: ['#c084fc', '#8978ff', '#c084fc'],
    skills: [
      { name: 'PHP 8.x', level: 95 },
      { name: 'Laravel', level: 93 },
      { name: 'MySQL', level: 90 },
      { name: 'PostgreSQL', level: 85 },
      { name: 'Redis', level: 88 },
      { name: 'REST API', level: 92 }
    ]
  },
  {
    title: 'Tools & Others',
    icon: '🛠️',
    glowColor: '35 80 60',
    colors: ['#ffaa00', '#f472b6', '#ffaa00'],
    skills: [
      { name: 'Git', level: 95 },
      { name: 'Nginx', level: 90 },
      { name: 'Bash Scripting', level: 88 },
      { name: 'Python', level: 75 },
      { name: 'Vue.js', level: 78 },
      { name: 'Networking', level: 82 }
    ]
  }
]
</script>

<template>
  <section id="skills" class="skills section">
    <div class="container">
      <div class="skills__header">
        <span class="tag">// Skills & Expertise</span>
        <h2 class="section-title">
          <GradientText
            :colors="['#00d4aa', '#0099ff', '#00d4aa', '#0099ff']"
            :animated-colors-direction="'horizontal'"
            :animation-speed="3"
          >
            Technical Arsenal
          </GradientText>
        </h2>
        <p class="section-subtitle">
          A comprehensive toolkit built over years of production-grade experience.
        </p>
      </div>

      <div class="skills__grid">
        <BorderGlow
          v-for="(category, catIdx) in skillCategories"
          :key="catIdx"
          :glow-color="category.glowColor"
          :colors="category.colors"
          :border-radius="20"
          :glow-radius="50"
          :glow-intensity="0.8"
          :edge-sensitivity="20"
          :cone-spread="30"
          :fill-opacity="0.3"
          background-color="#12121a"
        >
          <div class="skills__card-inner">
            <div class="skills__card-header">
              <span class="skills__card-icon">{{ category.icon }}</span>
              <h3 class="skills__card-title">{{ category.title }}</h3>
            </div>

            <div class="skills__list">
              <span
                v-for="(skill, idx) in category.skills"
                :key="idx"
                class="skills__tag"
              >
                {{ skill.name }}
              </span>
            </div>
          </div>
        </BorderGlow>
      </div>
    </div>
  </section>
</template>

<style scoped>
.skills__header {
  margin-bottom: var(--space-3xl);
}

.skills__grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: var(--space-xl);
}

.skills__card-inner {
  padding: var(--space-2xl);
  position: relative;
  z-index: 1;
}

.skills__card-header {
  display: flex;
  align-items: center;
  gap: var(--space-md);
  margin-bottom: var(--space-xl);
  padding-bottom: var(--space-lg);
  border-bottom: 1px solid var(--color-border);
}

.skills__card-icon {
  font-size: 2rem;
}

.skills__card-title {
  font-size: var(--font-size-xl);
  font-weight: 700;
  color: var(--color-text-primary);
}

.skills__list {
  display: flex;
  flex-wrap: wrap;
  gap: var(--space-sm);
}

.skills__tag {
  padding: 8px 16px;
  background: rgba(255, 255, 255, 0.03);
  border: 1px solid rgba(255, 255, 255, 0.08);
  border-radius: var(--radius-full);
  font-size: var(--font-size-sm);
  color: var(--color-text-secondary);
  font-family: var(--font-mono);
  transition: all var(--transition-fast);
  cursor: default;
}

.skills__tag:hover {
  border-color: var(--color-accent-primary);
  color: var(--color-accent-primary);
  background: rgba(0, 212, 170, 0.05);
  box-shadow: 0 0 15px rgba(0, 212, 170, 0.1);
  transform: translateY(-2px);
}

@media (max-width: 768px) {
  .skills__grid {
    grid-template-columns: 1fr;
  }

  .skills__card-inner {
    padding: var(--space-xl);
  }
}
</style>
