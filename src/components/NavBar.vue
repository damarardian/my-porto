<script setup>
import { ref, onMounted } from 'vue'

const scrolled = ref(false)
const menuOpen = ref(false)

const navItems = [
  { id: 'home', label: 'Home' },
  { id: 'about', label: 'About' },
  { id: 'skills', label: 'Skills' },
  { id: 'portfolio', label: 'Portfolio' },
  { id: 'contact', label: 'Contact' }
]

onMounted(() => {
  window.addEventListener('scroll', () => {
    scrolled.value = window.scrollY > 50
  })
})

const scrollTo = (id) => {
  menuOpen.value = false
  const el = document.getElementById(id)
  if (el) {
    el.scrollIntoView({ behavior: 'smooth' })
  }
}
</script>

<template>
  <nav id="navbar" :class="['navbar', { 'navbar--scrolled': scrolled }]">
    <div class="navbar__inner">
      <a class="navbar__logo" @click.prevent="scrollTo('home')">
        <span class="navbar__logo-symbol">&lt;/&gt;</span>
        <span class="navbar__logo-text">Portfolio</span>
      </a>

      <button class="navbar__toggle" @click="menuOpen = !menuOpen" :aria-expanded="menuOpen">
        <span :class="['navbar__hamburger', { 'navbar__hamburger--open': menuOpen }]">
          <span></span><span></span><span></span>
        </span>
      </button>

      <ul :class="['navbar__menu', { 'navbar__menu--open': menuOpen }]">
        <li v-for="item in navItems" :key="item.id">
          <a class="navbar__link" @click.prevent="scrollTo(item.id)">{{ item.label }}</a>
        </li>
      </ul>
    </div>
  </nav>
</template>

<style scoped>
.navbar {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 1000;
  padding: 1rem 0;
  transition: all var(--transition-base);
}

.navbar--scrolled {
  background: rgba(10, 10, 15, 0.85);
  backdrop-filter: blur(20px);
  -webkit-backdrop-filter: blur(20px);
  border-bottom: 1px solid var(--color-border);
  padding: 0.5rem 0;
}

.navbar__inner {
  max-width: var(--max-width);
  margin: 0 auto;
  padding: 0 var(--space-xl);
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.navbar__logo {
  display: flex;
  align-items: center;
  gap: var(--space-sm);
  cursor: pointer;
  font-weight: 700;
  font-size: var(--font-size-xl);
  color: var(--color-text-primary);
  text-decoration: none;
}

.navbar__logo-symbol {
  font-family: var(--font-mono);
  background: var(--color-accent-gradient);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.navbar__menu {
  display: flex;
  align-items: center;
  gap: var(--space-xl);
  list-style: none;
}

.navbar__link {
  color: var(--color-text-secondary);
  font-size: var(--font-size-sm);
  font-weight: 500;
  cursor: pointer;
  text-decoration: none;
  transition: color var(--transition-fast);
  position: relative;
}

.navbar__link::after {
  content: '';
  position: absolute;
  bottom: -4px;
  left: 0;
  width: 0;
  height: 2px;
  background: var(--color-accent-gradient);
  transition: width var(--transition-base);
  border-radius: var(--radius-full);
}

.navbar__link:hover {
  color: var(--color-text-primary);
}

.navbar__link:hover::after {
  width: 100%;
}

.navbar__toggle {
  display: none;
  padding: 0.5rem;
}

.navbar__hamburger {
  display: flex;
  flex-direction: column;
  gap: 5px;
  width: 24px;
}

.navbar__hamburger span {
  display: block;
  height: 2px;
  background: var(--color-text-primary);
  border-radius: 2px;
  transition: all var(--transition-base);
}

.navbar__hamburger--open span:nth-child(1) {
  transform: translateY(7px) rotate(45deg);
}
.navbar__hamburger--open span:nth-child(2) {
  opacity: 0;
}
.navbar__hamburger--open span:nth-child(3) {
  transform: translateY(-7px) rotate(-45deg);
}

@media (max-width: 768px) {
  .navbar__toggle {
    display: block;
  }

  .navbar__menu {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: rgba(10, 10, 15, 0.98);
    flex-direction: column;
    justify-content: center;
    gap: var(--space-2xl);
    transform: translateX(100%);
    transition: transform var(--transition-slow);
  }

  .navbar__menu--open {
    transform: translateX(0);
  }

  .navbar__link {
    font-size: var(--font-size-2xl);
  }
}
</style>
