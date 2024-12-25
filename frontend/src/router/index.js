import { createRouter, createWebHistory } from "vue-router";

const routes = [
  {
    path: "/signup",
    name: "Signup",
    component: () => import("../pages/UserSignup.vue"),
  },
  {
    path: "/login",
    name: "Login",
    component: () => import("../pages/UserLogin.vue"),
  },
  {
    path: "/tasks",
    name: "Tasks",
    component: () => import("../pages/Tasks.vue"), // Ensure the path is correct
  },
  {
    path: "/",
    redirect: "/signup",
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
