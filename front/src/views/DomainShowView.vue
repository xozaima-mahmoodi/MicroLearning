<script setup lang="ts">
import { computed, onMounted, ref, watch } from 'vue'
import { useRoute, useRouter, RouterLink } from 'vue-router'
import { useI18n } from 'vue-i18n'
import { useDomainsStore } from '@/stores/domains'
import { useConceptsStore } from '@/stores/concepts'
import type { Concept, ConceptSummary, Domain } from '@/types'
import ConceptListItem from '@/components/ConceptListItem.vue'
import ConceptModal from '@/components/ConceptModal.vue'
import LoadingState from '@/components/LoadingState.vue'

const props = defineProps<{ slug: string }>()

const { t } = useI18n()
const route = useRoute()
const router = useRouter()
const domainsStore = useDomainsStore()
const conceptsStore = useConceptsStore()

const domain = ref<Domain | null>(null)
const concepts = ref<ConceptSummary[]>([])
const activeConcept = ref<Concept | null>(null)
const modalLoading = ref(false)
const domainLoading = ref(false)

async function loadDomain() {
  domainLoading.value = true
  try {
    domain.value = await domainsStore.fetchBySlug(props.slug)
    concepts.value = await domainsStore.fetchConcepts(props.slug)
  } finally {
    domainLoading.value = false
  }
}

async function loadConcept(slug: string) {
  modalLoading.value = true
  try {
    activeConcept.value = await conceptsStore.fetchBySlug(slug)
  } finally {
    modalLoading.value = false
  }
}

function openConcept(slug: string) {
  router.push({ query: { ...route.query, concept: slug } })
}

function closeConcept() {
  const { concept: _omit, ...rest } = route.query
  router.replace({ query: rest })
}

function navigateConcept(slug: string) {
  router.replace({ query: { ...route.query, concept: slug } })
}

const activeSlug = computed(() => (typeof route.query.concept === 'string' ? route.query.concept : null))

watch(activeSlug, async (slug) => {
  if (slug) await loadConcept(slug)
  else activeConcept.value = null
}, { immediate: false })

onMounted(async () => {
  await loadDomain()
  if (activeSlug.value) await loadConcept(activeSlug.value)
})

watch(() => props.slug, async () => {
  activeConcept.value = null
  await loadDomain()
})
</script>

<template>
  <section>
    <nav class="mb-4 text-sm text-slate-500 dark:text-slate-400">
      <RouterLink to="/" class="hover:text-sky-700 dark:hover:text-sky-300">{{ t('nav.home') }}</RouterLink>
      <span class="mx-2">/</span>
      <span class="dark:text-slate-300">{{ domain?.name ?? slug }}</span>
    </nav>

    <header v-if="domain" class="mb-6 sm:mb-8">
      <h1 class="text-2xl font-bold text-slate-800 dark:text-slate-100 sm:text-3xl md:text-4xl">{{ domain.name }}</h1>
      <p v-if="domain.description" class="mt-2 text-sm leading-7 text-slate-600 dark:text-slate-400 sm:text-base sm:leading-8">{{ domain.description }}</p>
    </header>

    <LoadingState v-if="domainLoading && !domain" />

    <ol v-else-if="concepts.length" class="relative">
      <!-- Rail centerline matches the timeline-node column: 1rem (size-8/2)
           on mobile, 1.25rem (size-10/2) on sm+. Logical-property `start`
           anchors the rail correctly in both LTR and RTL. -->
      <div
        class="absolute top-8 bottom-8 w-0.5 bg-gradient-to-b from-slate-200 via-slate-300 to-slate-200 start-[calc(1rem-1px)] dark:from-white/10 dark:via-white/15 dark:to-white/10 sm:top-10 sm:bottom-10 sm:start-[calc(1.25rem-1px)]"
        aria-hidden="true"
      />
      <ConceptListItem
        v-for="(c, i) in concepts"
        :key="c.id"
        :concept="c"
        :index="i"
        :domain-slug="domain?.slug ?? slug"
        :domain-name="domain?.name ?? slug"
        @open="openConcept"
      />
    </ol>

    <div v-else class="rounded-xl border border-dashed border-slate-300 p-8 text-center text-slate-500 dark:border-white/15 dark:bg-white/5 dark:text-slate-400">
      {{ t('domain.empty_concepts') }}
    </div>

    <ConceptModal
      v-if="activeConcept && !modalLoading"
      :concept="activeConcept"
      :domain-slug="domain?.slug ?? slug"
      :domain-name="domain?.name ?? slug"
      @close="closeConcept"
      @navigate="navigateConcept"
    />
  </section>
</template>
