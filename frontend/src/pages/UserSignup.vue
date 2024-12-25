<template>
  <div class="signup">
    <h1>Signup</h1>
    <form @submit.prevent="signup">
      <input v-model="username" placeholder="Username" />
      <input v-model="email" placeholder="Email" type="email" />
      <input v-model="password" placeholder="Password" type="password" />
      <button type="submit">Signup</button>
    </form>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "UserSignup",
  data() {
    return {
      username: "",
      email: "",
      password: "",
    };
  },
  methods: {
    async signup() {
      try {
        await axios.post("http://localhost:3000/signup", {
          username: this.username,
          email: this.email,
          password: this.password,
        });
        alert("Signup successful!");
        this.$router.push("/login"); // Redirect to login page
      } catch (error) {
        alert("Signup failed: " + (error.response?.data?.errors?.join(", ") || "Unknown error"));
      }
    },
  },
};
</script>



<style scoped>
.signup {
  max-width: 400px;
  margin: 50px auto;
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
input {
  display: block;
  width: 100%;
  margin-bottom: 10px;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
}
button {
  padding: 10px 15px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}
button:hover {
  background-color: #0056b3;
}
</style>
