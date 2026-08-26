<script setup>
import BorderGlow from '@/components/BorderGlow/BorderGlow.vue'
import ShinyText from '@/components/ShinyText/ShinyText.vue'

const skillCategories = [
  {
    title: 'DevOps',
    glowColor: '170 80 60',
    colors: ['#00d4aa', '#0099ff', '#00d4aa'],
    skills: [
      { name: 'Docker', icon: 'docker/docker-original' },
      { name: 'Kubernetes', icon: 'kubernetes/kubernetes-plain' },
      // { name: 'AWS', icon: 'amazonwebservices/amazonwebservices-original-wordmark' },
      // { name: 'GCP', icon: 'googlecloud/googlecloud-original' },
      { name: 'Terraform', icon: 'terraform/terraform-original' },
      { name: 'Linux', icon: 'linux/linux-original' }
    ]
  },
  {
    title: 'CI/CD & Monitoring',
    glowColor: '210 80 60',
    colors: ['#0099ff', '#38bdf8', '#0099ff'],
    skills: [
      // { name: 'Jenkins', icon: 'jenkins/jenkins-original' },
      { name: 'GitHub Actions', icon: 'github/github-original' },
      { name: 'GitLab CI', icon: 'gitlab/gitlab-original' },
      { name: 'Prometheus', icon: 'prometheus/prometheus-original' },
      { name: 'Grafana', icon: 'grafana/grafana-original' },
      // { name: 'ELK Stack', icon: 'elasticsearch/elasticsearch-original' }
    ]
  },
  {
    title: 'PHP & Backend',
    glowColor: '260 80 70',
    colors: ['#c084fc', '#8978ff', '#c084fc'],
    skills: [
      { name: 'PHP 8.x', icon: 'php/php-original' },
      { name: 'Laravel', icon: 'laravel/laravel-original' },
      { name: 'MySQL', icon: 'mysql/mysql-original' },
      // { name: 'PostgreSQL', icon: 'postgresql/postgresql-original' },
      // { name: 'Redis', icon: 'redis/redis-original' },
      { name: 'Postman', icon: 'postman/postman-original' }
    ]
  },
  {
    title: 'IT Operations',
    glowColor: '260 80 70',
    colors: ['#c084fc', '#8978ff', '#c084fc'],
    skills: [
      { name: 'Root Cause Analysis', customIcon: '<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><path d="M12 2v2"/><path d="M12 20v2"/><path d="M2 12h2"/><path d="M20 12h2"/></svg>' },
      { name: 'Problem Solver', customIcon: '<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M15 14c.2-1 .7-1.7 1.5-2.5 1-.9 1.5-2.2 1.5-3.5A6 6 0 0 0 6 8c0 1 .2 2.2 1.5 3.5.7.9 1.2 1.5 1.5 2.5"/><path d="M9 18h6"/><path d="M10 22h4"/></svg>' },
      { name: 'Reproduce Issue', customIcon: '<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M3 12a9 9 0 1 0 9-9 9.75 9.75 0 0 0-6.74 2.74L3 8"/><path d="M3 3v5h5"/></svg>' },
      { name: 'Monitoring', customIcon: '<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 12h-4l-3 9L9 3l-3 9H2"/></svg>' }
    ]
  },
  {
    title: 'Tools & Others',
    glowColor: '35 80 60',
    colors: ['#ffaa00', '#f472b6', '#ffaa00'],
    skills: [
      { name: 'Git', icon: 'git/git-original' },
      { name: 'Nginx', icon: 'nginx/nginx-original' },
      { name: 'Bash', icon: 'bash/bash-original' },
      { name: 'Python', icon: 'python/python-original' },
      // { name: 'Vue.js', icon: 'vuejs/vuejs-original' },
      { name: 'Debian', icon: 'debian/debian-original' }
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
          Technical
          <ShinyText text="Skills" :speed="3" class="skills__shiny" />
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
          background-color="var(--color-bg-card)"
        >
          <div class="skills__card-inner">
            <div class="skills__card-header">
              <span class="skills__card-icon">{{ category.icon }}</span>
              <h3 class="skills__card-title">{{ category.title }}</h3>
            </div>

            <div class="skills__list">
              <div
                v-for="(skill, idx) in category.skills"
                :key="idx"
                class="skills__tag"
                :title="skill.name"
              >
                <img v-if="skill.icon" :src="`https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/${skill.icon}.svg`" :alt="skill.name" class="skills__tag-icon" />
                <div v-else-if="skill.customIcon" v-html="skill.customIcon" class="skills__tag-custom-icon"></div>
                <span class="skills__tag-name">{{ skill.name }}</span>
              </div>
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

:deep(.skills__shiny) {
  background: var(--color-accent-gradient);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
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
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 8px 16px;
  background: rgba(255, 255, 255, 0.03);
  border: 1px solid rgba(255, 255, 255, 0.08);
  border-radius: var(--radius-full);
  transition: all var(--transition-fast);
  cursor: default;
}

.skills__tag-icon {
  width: 20px;
  height: 20px;
  object-fit: contain;
}

.skills__tag-custom-icon {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 20px;
  height: 20px;
  color: var(--color-text-secondary);
  transition: color var(--transition-fast);
}

.skills__tag-name {
  font-size: var(--font-size-sm);
  color: var(--color-text-secondary);
  font-family: var(--font-mono);
  font-weight: 500;
  transition: color var(--transition-fast);
}

.skills__tag:hover {
  border-color: var(--color-accent-primary);
  background: rgba(0, 212, 170, 0.05);
  box-shadow: 0 0 15px rgba(0, 212, 170, 0.1);
  transform: translateY(-2px);
}

.skills__tag:hover .skills__tag-name,
.skills__tag:hover .skills__tag-custom-icon {
  color: var(--color-accent-primary);
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
