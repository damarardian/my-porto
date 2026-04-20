<script setup>
import { ref, onMounted } from 'vue'
import ScrollFloat from '@/components/ScrollFloat/ScrollFloat.vue'

const form = ref({
  name: '',
  email: '',
  subject: '',
  message: ''
})

const isSubmitting = ref(false)
const submitted = ref(false)
const errorMessage = ref('')

onMounted(() => {
  const siteKey = import.meta.env.VITE_RECAPTCHA_SITE_KEY
  if (siteKey && siteKey !== 'MASUKKAN_SITE_KEY_RECAPTCHA_ANDA_DISINI') {
    const script = document.createElement('script')
    script.src = `https://www.google.com/recaptcha/api.js?render=${siteKey}`
    script.async = true
    script.defer = true
    document.head.appendChild(script)
  }
})

const sendToEmailJS = async (token) => {
  const payload = {
    service_id: import.meta.env.VITE_EMAILJS_SERVICE_ID,
    template_id: import.meta.env.VITE_EMAILJS_TEMPLATE_ID,
    user_id: import.meta.env.VITE_EMAILJS_PUBLIC_KEY,
    template_params: {
      from_name: form.value.name,
      reply_to: form.value.email,
      subject: form.value.subject,
      message: form.value.message,
      'g-recaptcha-response': token
    }
  }

  const response = await fetch('https://api.emailjs.com/api/v1.0/email/send', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(payload)
  })

  if (!response.ok) {
    throw new Error('Failed to send message.')
  }
}

const handleSubmit = async () => {
  isSubmitting.value = true
  errorMessage.value = ''
  
  try {
    const siteKey = import.meta.env.VITE_RECAPTCHA_SITE_KEY
    if (window.grecaptcha && siteKey && siteKey !== 'MASUKKAN_SITE_KEY_RECAPTCHA_ANDA_DISINI') {
      window.grecaptcha.ready(() => {
        window.grecaptcha.execute(siteKey, { action: 'submit' }).then(async (token) => {
          try {
            await sendToEmailJS(token)
            handleSuccess()
          } catch (err) {
            handleError()
          }
        })
      })
    } else {
      // Fallback if reCAPTCHA is not configured
      await sendToEmailJS('no-captcha-token')
      handleSuccess()
    }
  } catch (error) {
    handleError()
  }
}

const handleSuccess = () => {
  isSubmitting.value = false
  submitted.value = true
  form.value = { name: '', email: '', subject: '', message: '' }
  setTimeout(() => { submitted.value = false }, 4000)
}

const handleError = () => {
  isSubmitting.value = false
  errorMessage.value = 'Oops, sesuatu terjadi! Pastikan API Key di file .env sudah diisi.'
  setTimeout(() => { errorMessage.value = '' }, 5000)
}

const contactInfo = [
  {
    icon: `<svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="2" y="4" width="20" height="16" rx="2"/><path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"/></svg>`,
    label: 'Email',
    value: 'damar.rizki212@gmail.com',
    link: 'mailto:damar.rizki212@gmail.com'
  },
  {
    icon: `<svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20 10c0 6-8 12-8 12s-8-6-8-12a8 8 0 0 1 16 0Z"/><circle cx="12" cy="10" r="3"/></svg>`,
    label: 'Location',
    value: 'Banten, Tangerang Selatan',
    link: null
  },
  {
    icon: `<svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"/></svg>`,
    label: 'Phone',
    value: '+62 851-7985-7083',
    link: 'tel:+6285179857083'
  }
]
</script>

<template>
  <section id="contact" class="contact section">
    <div class="container">
      <div class="contact__header">
        <span class="tag">// Get In Touch</span>
        <ScrollFloat children="Let's Work Together" class="section-title" />
        <p class="section-subtitle">
          Have a project in mind? Let's discuss how I can help bring your ideas to life.
        </p>
      </div>

      <div class="contact__grid">
        <div class="contact__info">
          <div
            v-for="(info, idx) in contactInfo"
            :key="idx"
            class="contact__info-card"
          >
            <div class="contact__info-icon" v-html="info.icon"></div>
            <div>
              <span class="contact__info-label">{{ info.label }}</span>
              <a v-if="info.link" :href="info.link" class="contact__info-value">
                {{ info.value }}
              </a>
              <span v-else class="contact__info-value">{{ info.value }}</span>
            </div>
          </div>

          <div class="contact__availability">
            <div class="contact__availability-dot"></div>
            <span>Currently available for freelance work</span>
          </div>
        </div>

        <form class="contact__form" @submit.prevent="handleSubmit">
          <div class="contact__form-row">
            <div class="contact__form-group">
              <label for="contact-name" class="contact__form-label">Name</label>
              <input
                id="contact-name"
                v-model="form.name"
                type="text"
                class="contact__form-input"
                placeholder="Your name"
                required
              />
            </div>
            <div class="contact__form-group">
              <label for="contact-email" class="contact__form-label">Email</label>
              <input
                id="contact-email"
                v-model="form.email"
                type="email"
                class="contact__form-input"
                placeholder="you@email.com"
                required
              />
            </div>
          </div>

          <div class="contact__form-group">
            <label for="contact-subject" class="contact__form-label">Subject</label>
            <input
              id="contact-subject"
              v-model="form.subject"
              type="text"
              class="contact__form-input"
              placeholder="Project discussion"
            />
          </div>

          <div class="contact__form-group">
            <label for="contact-message" class="contact__form-label">Message</label>
            <textarea
              id="contact-message"
              v-model="form.message"
              class="contact__form-textarea"
              placeholder="Tell me about your project..."
              rows="5"
              required
            ></textarea>
          </div>

          <button
            type="submit"
            class="btn btn-primary contact__form-submit"
            :disabled="isSubmitting"
          >
            <span v-if="isSubmitting">Sending...</span>
            <span v-else-if="submitted">✓ Message Sent!</span>
            <span v-else style="display: inline-flex; align-items: center; gap: 8px;">
              Send Message
              <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="22" y1="2" x2="11" y2="13"/><polygon points="22 2 15 22 11 13 2 9 22 2"/></svg>
            </span>
          </button>
          
          <div v-if="errorMessage" class="contact__form-error">
            {{ errorMessage }}
          </div>
        </form>
      </div>
    </div>
  </section>
</template>

<style scoped>
.contact__header {
  margin-bottom: var(--space-3xl);
}

.contact__grid {
  display: grid;
  grid-template-columns: 1fr 1.5fr;
  gap: var(--space-4xl);
  align-items: start;
}

.contact__info {
  display: flex;
  flex-direction: column;
  gap: var(--space-lg);
}

.contact__info-card {
  display: flex;
  align-items: center;
  gap: var(--space-lg);
  padding: var(--space-lg);
  background: var(--color-bg-card);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-lg);
  transition: all var(--transition-base);
}

.contact__info-card:hover {
  border-color: var(--color-border-hover);
  transform: translateX(4px);
}

.contact__info-icon {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 48px;
  height: 48px;
  border-radius: var(--radius-md);
  background: rgba(0, 212, 170, 0.1);
  color: var(--color-accent-primary);
  flex-shrink: 0;
}

.contact__info-label {
  display: block;
  font-size: var(--font-size-xs);
  color: var(--color-text-muted);
  font-family: var(--font-mono);
  text-transform: uppercase;
  letter-spacing: 0.1em;
  margin-bottom: 2px;
}

.contact__info-value {
  font-size: var(--font-size-base);
  color: var(--color-text-primary);
  font-weight: 500;
}

a.contact__info-value:hover {
  color: var(--color-accent-primary);
}

.contact__availability {
  display: flex;
  align-items: center;
  gap: var(--space-sm);
  padding: var(--space-md) var(--space-lg);
  background: rgba(0, 212, 170, 0.05);
  border: 1px solid rgba(0, 212, 170, 0.15);
  border-radius: var(--radius-md);
  font-size: var(--font-size-sm);
  color: var(--color-accent-primary);
  margin-top: var(--space-md);
}

.contact__availability-dot {
  width: 8px;
  height: 8px;
  border-radius: 50%;
  background: var(--color-accent-primary);
  animation: pulse-glow 2s ease-in-out infinite;
  flex-shrink: 0;
}

.contact__form {
  display: flex;
  flex-direction: column;
  gap: var(--space-lg);
}

.contact__form-row {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: var(--space-lg);
}

.contact__form-label {
  display: block;
  font-size: var(--font-size-sm);
  color: var(--color-text-secondary);
  font-weight: 500;
  margin-bottom: var(--space-sm);
}

.contact__form-input,
.contact__form-textarea {
  width: 100%;
  padding: 0.85rem 1rem;
  background: var(--color-bg-card);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-md);
  color: var(--color-text-primary);
  font-size: var(--font-size-base);
  transition: all var(--transition-fast);
  outline: none;
}

.contact__form-input:focus,
.contact__form-textarea:focus {
  border-color: var(--color-accent-primary);
  box-shadow: 0 0 0 3px rgba(0, 212, 170, 0.1);
}

.contact__form-input::placeholder,
.contact__form-textarea::placeholder {
  color: var(--color-text-muted);
}

.contact__form-textarea {
  resize: vertical;
  min-height: 120px;
}

.contact__form-submit {
  align-self: flex-start;
  min-width: 200px;
  justify-content: center;
}

.contact__form-submit:disabled {
  opacity: 0.7;
  cursor: not-allowed;
}

.contact__form-error {
  margin-top: var(--space-md);
  color: #ff4a4a;
  font-size: var(--font-size-sm);
  text-align: center;
  font-weight: 500;
}

@media (max-width: 768px) {
  .contact__grid {
    grid-template-columns: 1fr;
    gap: var(--space-2xl);
  }

  .contact__form-row {
    grid-template-columns: 1fr;
  }

  .contact__form-submit {
    width: 100%;
  }
}
</style>
