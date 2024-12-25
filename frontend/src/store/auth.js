import { signup, login } from "../api/auth";

export default {
  namespaced: true,
  state: {
    token: localStorage.getItem("token") || "",
    user: null,
  },
  mutations: {
    SET_TOKEN(state, token) {
      state.token = token;
      localStorage.setItem("token", token);
    },
    CLEAR_AUTH(state) {
      state.token = "";
      state.user = null;
      localStorage.removeItem("token");
    },
  },
  actions: {
    async signup({ commit }, userData) {
      const response = await signup(userData);
      commit("SET_TOKEN", response.data.token);
    },
    async login({ commit }, credentials) {
      const response = await login(credentials);
      commit("SET_TOKEN", response.data.token);
    },
    logout({ commit }) {
      commit("CLEAR_AUTH");
    },
  },
};
