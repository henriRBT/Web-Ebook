//import vue router
import { createRouter, createWebHistory } from "vue-router";
//define a routes
const routes = [
  {
    path: "/",
    name: "beranda",
    component: () => import("@/components/Dashboard.vue"),
  },

  {
    path: "/login",
    name: "login",
    component: () => import("@/view/Dashboard/loginPage.vue"),
  },

  {
    path: "/register",
    name: "register",
    component: () => import("@/view/Dashboard/registerPage.vue"),
  },

  {
    path: "/verification",
    name: "verifikasi",
    component: () => import("@/view/Dashboard/verificationEmail.vue"),
  },

  {
    path: "/dashboard",
    name: "layout",
    component: () => import("@/components/DashboardLayout.vue"),
    children: [
      {
        path: "/novel",
        name: "novel.index",
        component: () => import("@/view/Novel/IndexPage.vue"),
      },

      {
        path: "/comic",
        name: "comic.index",
        component: () => import("@/view/Comic/IndexPage.vue"),
      },

      {
        path: "/majalah",
        name: "majalah.index",
        component: () => import("@/view/Majalah/IndexPage.vue"),
      },

      {
        path: "/novel/baca",
        name: "novel.baca",
        component: () => import("@/view/Novel/BacaPage.vue"),
      },

      {
        path: "/majalah/baca",
        name: "majalah.baca",
        component: () => import("@/view/Majalah/BacaPage.vue"),
      },

      {
        path: "/comic/baca",
        name: "comic.baca",
        component: () => import("@/view/Comic/BacaPage.vue"),
      },

      {
        path: "/novel/isibacaan",
        name: "novel.isibacaan",
        component: () => import("@/view/Novel/IsiBacaanPage.vue"),
      },

      {
        path: "/majalah/isibacaan",
        name: "majalah.isibacaan",
        component: () => import("@/view/Majalah/IsiBacaanPage.vue"),
      },

      {
        path: "/comic/isibacaan",
        name: "comic.isibacaan",
        component: () => import("@/view/Comic/IsiBacaanPage.vue"),
      },

      {
        path: "/profile",
        name: "profile",
        component: () => import("@/view/profil/index.vue"),
      },

      {
        path: "/profile",
        name: "profileEdit",
        component: () => import("@/view/profil/edit.vue"),
      },
    ],
  },
  {
    path: "/admin",
    name: "berandaAdmin",
    component: () => import("@/components/DasboardLayoutAdmin.vue"),
    children: [
      {
        path: "/novelAdmin",
        name: "novelAdmin.index",
        component: () => import("@/view/Admin/Novel/IndexPage.vue"),
      },
      {
        path: "/novelAdminCreate",
        name: "novelAdmin.create",
        component: () => import("@/view/Admin/Novel/CreatePage.vue"),
      },
      {
        path: "/novelAdminEdit",
        name: "novelAdmin.edit",
        component: () => import("@/view/Admin/Novel/EditPage.vue"),
      },

      {
        path: "/comicAdmin",
        name: "comicAdmin.index",
        component: () => import("@/view/Admin/Comic/IndexPage.vue"),
      },
      {
        path: "/comicAdminEdit",
        name: "comicAdmin.edit",
        component: () => import("@/view/Admin/Comic/EditPage.vue"),
      },
      {
        path: "/comicAdminCreate",
        name: "comicAdmin.create",
        component: () => import("@/view/Admin/Comic/CreatePage.vue"),
      },

      {
        path: "/majalahAdmin",
        name: "majalahAdmin.index",
        component: () => import("@/view/Admin/Majalah/IndexPage.vue"),
      },
      {
        path: "/majalahAdmin",
        name: "majalahAdmin.create",
        component: () => import("@/view/Admin/Majalah/CreatePage.vue"),
      },
      {
        path: "/majalahAdminEdit",
        name: "majalahAdmin.edit",
        component: () => import("@/view/Admin/Majalah/EditPage.vue"),
      },
    ],
  },
];
//create router
const router = createRouter({
  history: createWebHistory(),
  routes, // config routes
});
export default router;
