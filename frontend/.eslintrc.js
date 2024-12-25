module.exports = {
    env: {
      browser: true,
      node: true, // Add this line
      es2021: true
    },
    extends: [
      'eslint:recommended',
      'plugin:vue/vue3-recommended' // Use 'plugin:vue/recommended' for Vue 2
    ],
    parserOptions: {
      ecmaVersion: 12,
      sourceType: 'module'
    },
    rules: {
      // Add custom rules here if needed
    }
  };
  