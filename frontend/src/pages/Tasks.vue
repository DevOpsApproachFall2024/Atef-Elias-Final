<template>
  <div class="tasks">
    <h1>Task Management</h1>

    <!-- Button to embed video -->
    <button @click="showVideo = !showVideo">
      Tony Sam
    </button>

    <!-- Embed video -->
    <div v-if="showVideo" class="video-container">
    <iframe 
  width="560" 
  height="315" 
  src="https://www.youtube.com/embed/3PgNPc-iFW8" 
  title="Jingle Bells Instrumental" 
  frameborder="0" 
  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
  allowfullscreen>
</iframe>


    </div>

    <!-- Existing Task Management Code -->
    <form @submit.prevent="createTask">
      <input v-model="newTask.title" placeholder="Task Title" />
      <textarea v-model="newTask.description" placeholder="Task Description"></textarea>
      <select v-model="newTask.status">
        <option value="Pending">Pending</option>
        <option value="InProgress">In Progress</option>
        <option value="Completed">Completed</option>
      </select>
      <button type="submit">Add Task</button>
    </form>

    <h2>Tasks List</h2>
    <ul>
      <li v-for="task in tasks" :key="task.id">
        <h3>{{ task.title }}</h3>
        <p>{{ task.description }}</p>
        <p>Status: {{ task.status }}</p>
        <button @click="editTask(task)">Edit</button>
        <button @click="deleteTask(task.id)">Delete</button>
      </li>
    </ul>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "TaskPage",
  data() {
    return {
      tasks: [],
      newTask: {
        title: "",
        description: "",
        status: "Pending",
      },
      showVideo: false, // Controls visibility of the video embed
    };
  },
  methods: {
    async fetchTasks() {
      try {
        const response = await axios.get("http://localhost:3000/tasks", {
          headers: {
            Authorization: `Bearer ${localStorage.getItem("token")}`,
          },
        });
        this.tasks = response.data;
      } catch (error) {
        alert("Failed to fetch tasks: " + (error.response?.data?.error || "Unknown error"));
      }
    },
    async createTask() {
      try {
        const response = await axios.post(
          "http://localhost:3000/tasks",
          this.newTask,
          {
            headers: {
              Authorization: `Bearer ${localStorage.getItem("token")}`,
            },
          }
        );
        this.tasks.push(response.data);
        this.newTask = { title: "", description: "", status: "Pending" };
      } catch (error) {
        alert("Failed to create task: " + (error.response?.data?.errors?.join(", ") || "Unknown error"));
      }
    },
    async editTask(task) {
      const updatedTitle = prompt("Update Task Title", task.title) || task.title;
      const updatedDescription =
        prompt("Update Task Description", task.description) || task.description;
      const updatedStatus = prompt(
        "Update Task Status (Pending/InProgress/Completed)",
        task.status
      ) || task.status;

      try {
        const response = await axios.put(
          `http://localhost:3000/tasks/${task.id}`,
          {
            title: updatedTitle,
            description: updatedDescription,
            status: updatedStatus,
          },
          {
            headers: {
              Authorization: `Bearer ${localStorage.getItem("token")}`,
            },
          }
        );
        Object.assign(task, response.data);
      } catch (error) {
        alert("Failed to update task: " + (error.response?.data?.errors?.join(", ") || "Unknown error"));
      }
    },
    async deleteTask(taskId) {
      if (!confirm("Are you sure you want to delete this task?")) return;

      try {
        await axios.delete(`http://localhost:3000/tasks/${taskId}`, {
          headers: {
            Authorization: `Bearer ${localStorage.getItem("token")}`,
          },
        });
        this.tasks = this.tasks.filter((task) => task.id !== taskId);
      } catch (error) {
        alert("Failed to delete task: " + (error.response?.data?.error || "Unknown error"));
      }
    },
  },
  mounted() {
    this.fetchTasks();
  },
};
</script>

<style scoped>
.tasks {
  max-width: 600px;
  margin: 50px auto;
  text-align: left;
}

.video-container {
  margin: 20px 0;
  text-align: center;
}

iframe {
  width: 100%;
  max-width: 560px;
  height: 315px;
}

form {
  margin-bottom: 20px;
}

input,
textarea,
select {
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

ul {
  list-style-type: none;
  padding: 0;
}

li {
  margin-bottom: 20px;
  border: 1px solid #ddd;
  padding: 10px;
  border-radius: 5px;
}
</style>
