<script setup lang="ts">
import { onMounted } from 'vue'
import { storeToRefs } from 'pinia'
import { useDomainsStore } from '@/stores/domains'
import DomainCard from '@/components/DomainCard.vue'

const store = useDomainsStore()
const { list, loading } = storeToRefs(store)

onMounted(() => store.fetchAll())
</script>

<template>
  <section>
    <div class="mb-8">
      <h1 class="text-3xl font-bold text-slate-800">حوزه‌های علوم اجتماعی</h1>
      <p class="mt-2 text-slate-600">
        یکی از حوزه‌ها را انتخاب کنید تا نقشه مفاهیم آن را از ساده‌ترین تا پیشرفته‌ترین دنبال کنید.
      </p>
    </div>

    <div v-if="loading && list.length === 0" class="text-slate-500">در حال بارگذاری…</div>

    <div v-else class="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
      <DomainCard v-for="d in list" :key="d.id" :domain="d" />
    </div>

    <div v-if="!loading && list.length === 0" class="rounded-xl border border-dashed border-slate-300 p-8 text-center text-slate-500">
      هنوز حوزه‌ای ثبت نشده است.
    </div>
  </section>
</template>
