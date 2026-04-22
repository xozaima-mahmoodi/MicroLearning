<script setup lang="ts">
import { computed, onMounted, ref, watch } from 'vue'
import { useRoute, useRouter, RouterLink } from 'vue-router'
import { useDomainsStore } from '@/stores/domains'
import { useConceptsStore } from '@/stores/concepts'
import type { Concept, ConceptSummary, Domain } from '@/types'
import ConceptListItem from '@/components/ConceptListItem.vue'
import ConceptModal from '@/components/ConceptModal.vue'

const props = defineProps<{ slug: string }>()

const route = useRoute()
const router = useRouter()
const domainsStore = useDomainsStore()
const conceptsStore = useConceptsStore()

const domain = ref<Domain | null>(null)
const concepts = ref<ConceptSummary[]>([])
const activeConcept = ref<Concept | null>(null)
const modalLoading = ref(false)

async function loadDomain() {
  domain.value = await domainsStore.fetchBySlug(props.slug)
  concepts.value = await domainsStore.fetchConcepts(props.slug)
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
  router.push({ query: rest })
}

function navigateConcept(slug: string) {
  openConcept(slug)
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
    <nav class="mb-4 text-sm text-slate-500">
      <RouterLink to="/" class="hover:text-sky-700">خانه</RouterLink>
      <span class="mx-2">/</span>
      <span>{{ domain?.name ?? slug }}</span>
    </nav>

    <header class="mb-8">
      <h1 class="text-3xl font-bold text-slate-800">{{ domain?.name }}</h1>
      <p v-if="domain?.description" class="mt-2 text-slate-600">{{ domain.description }}</p>
    </header>

    <ol v-if="concepts.length" class="relative">
      <div
        class="absolute top-10 bottom-10 w-0.5 bg-gradient-to-b from-slate-200 via-slate-300 to-slate-200 start-[calc(1.25rem-1px)]"
        aria-hidden="true"
      />
      <ConceptListItem
        v-for="(c, i) in concepts"
        :key="c.id"
        :concept="c"
        :index="i"
        @open="openConcept"
      />
    </ol>

    <div v-if="concepts.length === 0" class="rounded-xl border border-dashed border-slate-300 p-8 text-center text-slate-500">
      هنوز مفهومی در این حوزه ثبت نشده است.
    </div>

    <ConceptModal
      v-if="activeConcept && !modalLoading"
      :concept="activeConcept"
      @close="closeConcept"
      @navigate="navigateConcept"
    />
  </section>
</template>
