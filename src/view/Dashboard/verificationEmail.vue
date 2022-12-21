<template>
    <div>
      <h1>Verifying Email.....</h1>
    </div>
  </template>
  
  <script>
  /* eslint-disable */
  // import { mapActions } from "vuex";
  import axios from "axios";
  import route from "../../router";
  
  export default {
    methods: {
      verifyEmail(verifiy) {
        console.log("params", verifiy);
        axios
          .get(" http://127.0.0.1:8000/api/emailVerification", {
            params: verifiy,
          })
          .then((response) => {
            route.push({ name: "login" });
          })
          .catch((error) => {
            reject(error);
          });
      },
    },
    created() {
      console.log("Created");
      
      this.verifyEmail({ ...this.$route.query });
    
    },
  };
  </script>
  
  <style>
  </style>