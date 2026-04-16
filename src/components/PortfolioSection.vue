<script setup>
import { ref } from 'vue'
import CardSwap from '@/components/CardSwap/CardSwap.vue'
import ShinyText from '@/components/ShinyText/ShinyText.vue'

const activeFilter = ref('all')

const filters = [
  { id: 'all', label: 'All Projects' },
  { id: 'devops', label: 'DevOps' },
  { id: 'php', label: 'PHP/Laravel' },
  { id: 'cloud', label: 'Cloud' }
]

const projects = [
  {
    title: 'Cloud Migration Platform',
    description: 'Migrated legacy infrastructure to Kubernetes with zero downtime. Implemented CI/CD pipelines and monitoring.',
    images: [
      'https://images.unsplash.com/photo-1667372393119-3d4c48d07fc9?w=500&h=350&fit=crop',
      'https://images.unsplash.com/photo-1451187580459-43490279c0fa?w=500&h=350&fit=crop',
      'https://images.unsplash.com/photo-1558494949-ef010cbdcc31?w=500&h=350&fit=crop'
    ],
    tags: ['Kubernetes', 'Docker', 'Terraform', 'AWS'],
    category: 'devops',
    link: '#'
  },
  {
    title: 'E-Commerce Backend API',
    description: 'Built a high-performance REST API with Laravel serving 100K+ requests/day with Redis caching.',
    images: [
      'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=500&h=350&fit=crop',
      'https://images.unsplash.com/photo-1563013544-824ae1b704d3?w=500&h=350&fit=crop',
      'https://images.unsplash.com/photo-1460925895917-afdab827c52f?w=500&h=350&fit=crop'
    ],
    tags: ['Laravel', 'PHP 8', 'Redis', 'MySQL'],
    category: 'php',
    link: '#'
  },
  {
    title: 'CI/CD Pipeline Automation',
    description: 'Designed end-to-end CI/CD pipelines reducing deployment time by 80% with automated testing and rollbacks.',
    images: [
      'https://images.unsplash.com/photo-1618401471353-b98afee0b2eb?w=500&h=350&fit=crop',
      'https://images.unsplash.com/photo-1555949963-ff9fe0c870eb?w=500&h=350&fit=crop',
      'https://images.unsplash.com/photo-1629654297299-c8506221ca97?w=500&h=350&fit=crop'
    ],
    tags: ['Jenkins', 'GitHub Actions', 'Docker', 'Shell'],
    category: 'devops',
    link: '#'
  },
  {
    title: 'Multi-Tenant SaaS Platform',
    description: 'Architected a multi-tenant SaaS application handling 500+ tenants with isolated databases.',
    images: [
      'https://images.unsplash.com/photo-1460925895917-afdab827c52f?w=500&h=350&fit=crop',
      'https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=500&h=350&fit=crop',
      'https://images.unsplash.com/photo-1504868584819-f8e8b4b6d7e3?w=500&h=350&fit=crop'
    ],
    tags: ['Laravel', 'PostgreSQL', 'Redis', 'Vue.js'],
    category: 'php',
    link: '#'
  },
  {
    title: 'Infrastructure Monitoring',
    description: 'Built comprehensive monitoring stack with Prometheus, Grafana, and custom alerting for 200+ servers.',
    images: [
      'https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=500&h=350&fit=crop',
      'https://images.unsplash.com/photo-1518186285589-2f7649de83e0?w=500&h=350&fit=crop',
      'https://images.unsplash.com/photo-1504868584819-f8e8b4b6d7e3?w=500&h=350&fit=crop'
    ],
    tags: ['Prometheus', 'Grafana', 'ELK', 'Python'],
    category: 'cloud',
    link: '#'
  },
  {
    title: 'Serverless API Gateway',
    description: 'Designed serverless architecture using AWS Lambda and API Gateway reducing costs by 60%.',
    images: [
      'https://images.unsplash.com/photo-1544197150-b99a580bb7a8?w=500&h=350&fit=crop',
      'https://images.unsplash.com/photo-1558494949-ef010cbdcc31?w=500&h=350&fit=crop',
      'https://images.unsplash.com/photo-1451187580459-43490279c0fa?w=500&h=350&fit=crop'
    ],
    tags: ['AWS Lambda', 'API Gateway', 'DynamoDB', 'CloudFormation'],
    category: 'cloud',
    link: '#'
  }
]

const filteredProjects = ref(projects)

const setFilter = (filterId) => {
  activeFilter.value = filterId
  if (filterId === 'all') {
    filteredProjects.value = projects
  } else {
    filteredProjects.value = projects.filter(p => p.category === filterId)
  }
}
</script>

<template>
  <section id="portfolio" class="portfolio section">
    <div class="container">
      <div class="portfolio__header">
        <span class="tag">// Portfolio</span>
        <h2 class="section-title">
          Featured
          <ShinyText text="Projects" :speed="3" class="portfolio__shiny" />
        </h2>
        <p class="section-subtitle">
          A selection of projects that showcase my expertise in DevOps and PHP development.
        </p>
      </div>

      <div class="portfolio__filters">
        <button
          v-for="filter in filters"
          :key="filter.id"
          :class="['portfolio__filter-btn', { 'portfolio__filter-btn--active': activeFilter === filter.id }]"
          @click="setFilter(filter.id)"
        >
          {{ filter.label }}
        </button>
      </div>

      <div class="portfolio__grid">
        <div
          v-for="(project, idx) in filteredProjects"
          :key="project.title"
          class="portfolio__item"
        >
          <div class="portfolio__card-swap-wrapper">
            <CardSwap
              :width="340"
              :height="240"
              :card-distance="35"
              :vertical-distance="40"
              :delay="4000 + idx * 800"
              :pause-on-hover="true"
              :skew-amount="4"
              easing="elastic"
            >
              <template #card-0>
                <div class="portfolio__swap-card">
                  <img :src="project.images[0]" :alt="project.title + ' preview 1'" />
                  <div class="portfolio__swap-overlay">
                    <span class="portfolio__swap-label">Preview 1</span>
                  </div>
                </div>
              </template>
              <template #card-1>
                <div class="portfolio__swap-card">
                  <img :src="project.images[1]" :alt="project.title + ' preview 2'" />
                  <div class="portfolio__swap-overlay">
                    <span class="portfolio__swap-label">Preview 2</span>
                  </div>
                </div>
              </template>
              <template #card-2>
                <div class="portfolio__swap-card">
                  <img :src="project.images[2]" :alt="project.title + ' preview 3'" />
                  <div class="portfolio__swap-overlay">
                    <span class="portfolio__swap-label">Preview 3</span>
                  </div>
                </div>
              </template>
            </CardSwap>
          </div>

          <div class="portfolio__item-info">
            <h3 class="portfolio__item-title">{{ project.title }}</h3>
            <p class="portfolio__item-desc">{{ project.description }}</p>
            <div class="portfolio__item-tags">
              <span v-for="tag in project.tags" :key="tag" class="portfolio__item-tag">
                {{ tag }}
              </span>
            </div>
            <a :href="project.link" class="portfolio__item-link">
              View Project
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M5 12h14"/><path d="m12 5 7 7-7 7"/>
              </svg>
            </a>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.portfolio__header {
  margin-bottom: var(--space-2xl);
}

:deep(.portfolio__shiny) {
  background: var(--color-accent-gradient);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.portfolio__filters {
  display: flex;
  gap: var(--space-sm);
  margin-bottom: var(--space-3xl);
  flex-wrap: wrap;
}

.portfolio__filter-btn {
  padding: 0.5rem 1.25rem;
  border-radius: var(--radius-full);
  font-size: var(--font-size-sm);
  font-weight: 500;
  color: var(--color-text-secondary);
  border: 1px solid var(--color-border);
  background: transparent;
  transition: all var(--transition-base);
  cursor: pointer;
}

.portfolio__filter-btn:hover {
  border-color: var(--color-accent-primary);
  color: var(--color-accent-primary);
}

.portfolio__filter-btn--active {
  background: var(--color-accent-gradient);
  border-color: transparent;
  color: #0a0a0f;
  font-weight: 600;
}

.portfolio__grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 80px var(--space-xl);
}

.portfolio__item {
  background: var(--color-bg-card);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-xl);
  overflow: visible;
  transition: all var(--transition-base);
  display: flex;
  flex-direction: column;
}

.portfolio__item:hover {
  border-color: var(--color-border-hover);
  box-shadow: var(--shadow-glow);
}

.portfolio__card-swap-wrapper {
  position: relative;
  width: 100%;
  height: 320px;
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: visible;
  padding: var(--space-xl);
}

/* Override CardSwap's default positioning to center inside our wrapper */
:deep(.card-swap-container) {
  position: relative !important;
  transform: none !important;
  bottom: auto !important;
  right: auto !important;
}

.portfolio__swap-card {
  width: 100%;
  height: 100%;
  border-radius: 12px;
  overflow: hidden;
  position: relative;
}

.portfolio__swap-card img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  display: block;
}

.portfolio__swap-overlay {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  padding: 10px 14px;
  background: linear-gradient(transparent, rgba(0,0,0,0.7));
  pointer-events: none;
}

.portfolio__swap-label {
  font-size: var(--font-size-xs);
  color: rgba(255,255,255, 0.7);
  font-family: var(--font-mono);
}

.portfolio__item-info {
  padding: var(--space-lg) var(--space-xl) var(--space-xl);
  border-top: 1px solid var(--color-border);
}

.portfolio__item-title {
  font-size: var(--font-size-xl);
  font-weight: 700;
  margin-bottom: var(--space-sm);
  color: var(--color-text-primary);
}

.portfolio__item-desc {
  font-size: var(--font-size-sm);
  color: var(--color-text-secondary);
  line-height: 1.7;
  margin-bottom: var(--space-lg);
}

.portfolio__item-tags {
  display: flex;
  flex-wrap: wrap;
  gap: var(--space-xs);
  margin-bottom: var(--space-lg);
}

.portfolio__item-tag {
  padding: 3px 12px;
  background: rgba(0, 212, 170, 0.08);
  border: 1px solid rgba(0, 212, 170, 0.15);
  border-radius: var(--radius-full);
  font-size: var(--font-size-xs);
  color: var(--color-accent-primary);
  font-family: var(--font-mono);
}

.portfolio__item-link {
  display: inline-flex;
  align-items: center;
  gap: var(--space-sm);
  font-size: var(--font-size-sm);
  font-weight: 600;
  color: var(--color-accent-primary);
  transition: all var(--transition-base);
}

.portfolio__item-link:hover {
  gap: var(--space-md);
}

.portfolio__item-link svg {
  transition: transform var(--transition-base);
}

.portfolio__item-link:hover svg {
  transform: translateX(4px);
}

@media (max-width: 1024px) {
  .portfolio__grid {
    grid-template-columns: 1fr;
    gap: 60px;
  }
}

@media (max-width: 640px) {
  .portfolio__card-swap-wrapper {
    height: 280px;
  }

  :deep(.card-swap-card) {
    max-width: 280px !important;
    max-height: 200px !important;
  }
}
</style>
