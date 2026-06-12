<script setup>
import { ref } from 'vue'
import CardSwap from '@/components/CardSwap/CardSwap.vue'
import ShinyText from '@/components/ShinyText/ShinyText.vue'
import profileImg from '@/assets/profile.png'

const activeFilter = ref('all')
const emit = defineEmits(['view-project'])

const filters = [
  { id: 'all', label: 'All Projects' },
  { id: 'devops', label: 'DevOps' },
  { id: 'php', label: 'Website Projects' },
  { id: 'cloud', label: 'CI/CD' }
]

const projects = [
  {
    title: 'On Premise Infrastructure',
    description: 'Architected and deployed scalable on-premise & VM infrastructure using Kubernetes. Configured high-availability clusters and automated environment provisioning via Terraform.',
    images: [
      '/images/projects/kubernetes_nodes.png',
      '/images/projects/External_secret.png',
      '/images/projects/locust_testingHPA.jpg'
    ],
    sections: [
      {
        title: 'Building from the Ground Up',
        content: 'I built this on-premise infrastructure project entirely from scratch using the Debian operating system. To ensure consistency, standardization, and rapid deployment, I utilized Terraform as an Infrastructure as Code (IaC) provisioning tool to automatically build the Kubernetes cluster, eliminating error-prone manual interventions.',
        image: '/images/projects/kubernetes_nodes.png',
        imagePosition: 'right'
      },
      {
        title: 'High Availability & Scaling',
        content: 'Once the cluster was successfully established, the next challenge was ensuring uninterrupted service (High Availability). I implemented HPA (Horizontal Pod Autoscaler) across every pod running within Kubernetes. With this configuration, the system can dynamically scale the number of pod replicas up or down based on real-time CPU or memory loads.',
        image: '/images/projects/locust_testingHPA.jpg',
        imagePosition: 'left'
      },
      {
        title: 'Security & Secret Management',
        content: 'Security is always a top priority when designing infrastructure. Storing environment variables directly in source code or manifests is highly risky. To mitigate this vulnerability, I set up ESO (External Secrets Operator) as a centralized vault for environment variables. With ESO, all secrets and sensitive credentials are securely managed outside the source code and synchronized directly into the cluster only when needed.',
        image: '/images/projects/External_secret.png',
        imagePosition: 'none'
      }
    ],
    tags: ['Kubernetes', 'Docker', 'Terraform', 'Debian', 'HPA', 'ESO'],
    category: 'devops',
    link: '#'
  },
  // {
  //   title: 'Personal Project',
  //   description: 'Developed a custom high-performance REST API as a personal sandbox project. Leveraged PHP 8 and Laravel alongside Redis caching to deliver fast data processing.',
  //   images: [
  //     '/images/projects/p2_1.webp',
  //     '/images/projects/p2_2.webp',
  //     '/images/projects/p2_3.webp'
  //   ],
  //   tags: ['Laravel', 'PHP 8', 'Redis', 'MySQL'],
  //   category: 'php',
  //   link: '#'
  // },
  {
    title: 'CI/CD Pipeline Automation',
    description: 'Designed and implemented robust end-to-end continuous integration and deployment workflows. Integrated Docker, GitLab Runner, and ArgoCD to reduce manual deployment errors.',
    images: [
      '/images/projects/argocd.png',
      '/images/projects/GitlabCI.png'
    ],
    sections: [
      {
        title: 'GitLab CI Integration',
        content: 'I integrated the deployment workflow with the company\'s self-hosted GitLab repository using GitLab CI. This automation streamlines the development process by eliminating the need for developers to build container images manually, significantly reducing human error and saving valuable time.',
        image: '/images/projects/GitlabCI.png',
        imagePosition: 'right'
      },
      {
        title: 'Automated Deployment with ArgoCD',
        content: 'Following the CI pipeline, I implemented ArgoCD to fully automate the image deployment process. By adopting a GitOps approach, ArgoCD continuously monitors the repository and automatically synchronizes the latest container images into the Kubernetes cluster.',
        image: '/images/projects/argocd.png',
        imagePosition: 'left'
      },
      {
        title: 'Seamless Implementation',
        content: 'Both of these tools were meticulously configured and integrated to work seamlessly together. The resulting end-to-end pipeline operates reliably, ensuring continuous delivery and a highly efficient, automated deployment lifecycle.',
        image: null,
        imagePosition: 'none'
      }
    ],
    tags: ['GitLab CI', 'ArgoCD'],
    category: 'cloud',
    link: '#'
  },
  {
    title: 'Website Projects',
    description: 'Delivered a tailored multi-tenant SaaS application for a freelance client. Executed isolated PostgreSQL database handling connected to a responsive Vue.js frontend.',
    images: [
      '/images/projects/nabung_presentation.png',
      '/images/projects/pupuk_presentation.png',
      '/images/projects/p4_3.webp'
    ],
    tags: ['Laravel', 'PostgreSQL', 'Redis', 'Vue.js'],
    category: 'php',
    link: '#'
  },
  {
    title: 'Infrastructure Monitoring',
    description: 'Established a centralized infrastructure observability and logging ecosystem. Deployed Prometheus and Grafana for real-time dashboards and proactive server alerting.',
    images: [
      '/images/projects/grafana-k8s.png',
      '/images/projects/headlamp.png',
      '/images/projects/headlamp-maps.png'
    ],
    sections: [
      {
        title: 'Resource Monitoring & Logging',
        content: 'After deploying the application to the Kubernetes cluster, I implemented a robust observability stack using Prometheus and Grafana to monitor system resources. Additionally, I integrated Loki for centralized log aggregation, ensuring comprehensive visibility across the entire infrastructure.',
        image: '/images/projects/grafana-k8s.png',
        imagePosition: 'right'
      },
      {
        title: 'Cluster Visualization with Headlamp',
        content: 'Beyond Grafana and Prometheus, I deployed Headlamp as an intuitive Kubernetes web UI. This tool provides in-depth monitoring of the Kubernetes cluster itself, allowing me to easily inspect and manage crucial resources such as secrets, Horizontal Pod Autoscalers (HPA), and network configurations.',
        image: '/images/projects/headlamp.png',
        imagePosition: 'left'
      },
      {
        title: 'Transitioning to Visual Dashboards',
        content: 'The implementation of these tools drastically reduced the reliance on manual debugging and CLI-based monitoring. By transitioning to a fully comprehensive visual dashboard ecosystem, the team can now diagnose issues faster, track performance intuitively, and maintain system health with far greater efficiency.',
        image: '/images/projects/headlamp-maps.png',
        imagePosition: 'right'
      }
    ],
    tags: ['Prometheus', 'Grafana', 'Loki', 'Headlamp'],
    category: 'devops',
    link: '#'
  },
  // {
  //   title: 'Serverless API Gateway',
  //   description: 'Designed serverless architecture using AWS Lambda and API Gateway reducing costs by 60%.',
  //   images: [
  //     'https://images.unsplash.com/photo-1544197150-b99a580bb7a8?w=500&h=350&fit=crop',
  //     'https://images.unsplash.com/photo-1558494949-ef010cbdcc31?w=500&h=350&fit=crop',
  //     'https://images.unsplash.com/photo-1451187580459-43490279c0fa?w=500&h=350&fit=crop'
  //   ],
  //   tags: ['AWS Lambda', 'API Gateway', 'DynamoDB', 'CloudFormation'],
  //   category: 'cloud',
  //   link: '#'
  // }
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
          :style="{ '--card-index': idx }"
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
              :totalCards="Math.min(project.images.length, 3)"
            >
              <template v-for="(img, i) in project.images.slice(0, 3)" :key="i" #[`card-${i}`]>
                <div class="portfolio__swap-card">
                  <img :src="img" :alt="project.title + ' preview ' + (i + 1)" loading="lazy" />
                  <div class="portfolio__swap-overlay">
                    <span class="portfolio__swap-label">Preview {{ i + 1 }}</span>
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
            <a href="#" @click.prevent="emit('view-project', project)" class="portfolio__item-link">
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
  display: flex;
  flex-direction: column;
  gap: 150px;
  padding-bottom: 200px;
}

.portfolio__item {
  background: var(--color-bg-card);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-xl);
  overflow: visible;
  transition: all var(--transition-base);
  display: flex;
  flex-direction: row;
  align-items: center;
  position: sticky;
  top: calc(120px + (var(--card-index) * 30px));
  box-shadow: 0 -10px 40px rgba(0, 0, 0, 0.4);
  z-index: calc(var(--card-index) + 1);
  min-height: 400px;
}

.portfolio__item:hover {
  border-color: var(--color-border-hover);
  box-shadow: var(--shadow-glow);
}

.portfolio__card-swap-wrapper {
  position: relative;
  width: 50% !important;
  height: auto !important;
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
  translate: none !important;
  scale: none !important;
  bottom: auto !important;
  right: auto !important;
  margin: 0 auto;
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
  width: 50%;
  padding: var(--space-2xl);
  border-top: none;
  border-left: 1px solid var(--color-border);
  display: flex;
  flex-direction: column;
  justify-content: center;
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
    gap: 80px;
  }
  
  .portfolio__item {
    flex-direction: column;
    top: calc(90px + (var(--card-index) * 20px));
  }
  
  .portfolio__card-swap-wrapper,
  .portfolio__item-info {
    width: 100% !important;
    border-left: none;
  }
  
  .portfolio__item-info {
    border-top: 1px solid var(--color-border);
    padding: var(--space-xl);
  }
}

@media (max-width: 768px) {
  .portfolio__card-swap-wrapper {
    height: auto !important;
    width: auto !important;
    transform: scale(0.85);
    transform-origin: center center;
  }
}

@media (max-width: 480px) {
  .portfolio__card-swap-wrapper {
    transform: scale(0.7);
  }
}
</style>
