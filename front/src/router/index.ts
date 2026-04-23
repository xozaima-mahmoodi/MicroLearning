import { createRouter, createWebHistory } from "vue-router";
import HomeView from "@/views/HomeView.vue";
import DomainShowView from "@/views/DomainShowView.vue";
import MyShelfView from "@/views/MyShelfView.vue";

export const router = createRouter({
  history: createWebHistory(),
  routes: [
    { path: "/", name: "home", component: HomeView },
    { path: "/domains/:slug", name: "domain", component: DomainShowView, props: true },
    { path: "/my-shelf", name: "my-shelf", component: MyShelfView },
  ],
});
