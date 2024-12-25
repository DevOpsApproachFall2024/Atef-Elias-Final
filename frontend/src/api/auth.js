import axios from "axios";

const API_URL = "http://localhost:3000";

export const signup = (userData) => axios.post(`${API_URL}/signup`, userData);
export const login = (credentials) => axios.post(`${API_URL}/login`, credentials);
