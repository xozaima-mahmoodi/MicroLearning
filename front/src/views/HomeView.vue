<script setup lang="ts">
import { onMounted, ref } from 'vue'
import { storeToRefs } from 'pinia'
import { useCategoriesStore } from '@/stores/categories'
import DomainCard from '@/components/DomainCard.vue'
import { ChevronDown } from 'lucide-vue-next'

const store = useCategoriesStore()
const { list, loading } = storeToRefs(store)

const expandedSlug = ref<string | null>(null)

function toggle(slug: string) {
  expandedSlug.value = expandedSlug.value === slug ? null : slug
}

onMounted(async () => {
  await store.fetchAll()
  if (list.value.length && !expandedSlug.value) {
    expandedSlug.value = list.value[0].slug
  }
})
</script>

<template>
  <section>
    <div class="mb-10">
      <h1 class="text-4xl font-extrabold leading-tight tracking-tight text-slate-900 md:text-5xl">
        نقشه دانش
      </h1>
      <p class="mt-3 text-base leading-8 text-slate-600 md:text-lg">
        یک دسته را انتخاب کنید تا حوزه‌های آن آشکار شود و سپس از حوزه دلخواه، نقشه مفاهیم را دنبال کنید.
      </p>
    </div>

    <div v-if="loading && list.length === 0" class="text-slate-500">در حال بارگذاری…</div>

    <ul v-else class="space-y-4">
      <li
        v-for="cat in list"
        :key="cat.id"
        class="overflow-hidden rounded-2xl border border-slate-200 bg-white shadow-sm"
      >
        <button
          type="button"
          class="flex w-full items-center justify-between gap-4 px-6 py-5 text-start transition hover:bg-slate-50 focus:outline-none focus:ring-2 focus:ring-sky-400"
          :aria-expanded="expandedSlug === cat.slug"
          :aria-controls="`category-panel-${cat.slug}`"
          @click="toggle(cat.slug)"
        >
          <div class="flex flex-col">
            <h2 class="text-2xl font-extrabold tracking-tight text-slate-900">
              {{ cat.title }}
            </h2>
            <span class="mt-1 text-sm text-slate-500">
              {{ cat.domains.length }} حوزه
            </span>
          </div>
          <ChevronDown
            :class="[
              'size-6 shrink-0 text-slate-400 transition-transform duration-300 ease-out',
              expandedSlug === cat.slug ? 'rotate-180 text-sky-600' : '',
            ]"
            aria-hidden="true"
          />
        </button>

        <div
          :id="`category-panel-${cat.slug}`"
          :class="[
            'grid transition-[grid-template-rows] duration-300 ease-out',
            expandedSlug === cat.slug ? 'grid-rows-[1fr]' : 'grid-rows-[0fr]',
          ]"
        >
          <div class="min-h-0 overflow-hidden">
            <div
              :class="[
                'border-t border-slate-200 px-6 py-6 transition duration-300 ease-out',
                expandedSlug === cat.slug ? 'translate-y-0 opacity-100' : '-translate-y-1 opacity-0',
              ]"
            >
              <div
                v-if="cat.domains.length === 0"
                class="rounded-xl border border-dashed border-slate-300 p-6 text-center text-slate-500"
              >
                هنوز حوزه‌ای در این دسته ثبت نشده است.
              </div>
              <div
                v-else
                class="grid gap-5 sm:grid-cols-2 lg:grid-cols-3"
              >
                <DomainCard v-for="d in cat.domains" :key="d.id" :domain="d" />
              </div>
            </div>
          </div>
        </div>
      </li>
    </ul>

    <div
      v-if="!loading && list.length === 0"
      class="rounded-xl border border-dashed border-slate-300 p-8 text-center text-slate-500"
    >
      هنوز دسته‌ای ثبت نشده است.
    </div>
  </section>
</template>
