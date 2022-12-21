<template>
  <section>
    <div class="container-fluid h-custom">
      <div
        class="row d-flex justify-content-center align-items-center"
        style="height: 680px"
      >
        <div class="col-md-9 col-lg-6 col-xl-5">
          <img
            src="https://thebookcoverdesigner.com/wp-content/uploads/2019/07/Book-Cover-14-full.jpg"
            class="img-fluid"
            alt="Sample image"
          />
        </div>

        <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
          <form @submit.prevent="login">
            <div v-if="loginFailed" class="alert alert-danger">
              Email atau Password Anda salah.
            </div>
            <!-- Email input -->
            <div>
              <input
                type="email"
                v-model="user.email"
                id="form3Example3"
                class="form-control form-control-lg"
                placeholder="Enter a valid email address"
              />

              <div v-if="validation.email" class="mt-2 alert alert-danger">
                {{ validation.email[0] }}
              </div>
              <label class="form-label" for="form3Example3"
                >Email address</label
              >
            </div>

            <!-- Password input -->
            <div>
              <input
                type="password"
                v-model="user.password"
                id="form3Example4"
                class="form-control form-control-lg"
                placeholder="Enter password"
              />
              <div v-if="validation.password" class="mt-2 alert alert-danger">
                {{ validation.password[0] }}
              </div>
              <label class="form-label" for="form3Example4">Password</label>
            </div>

            <div class="text-center text-lg-start mt-4 pt-2">
              <button
                type="submit"
                class="btn"
                style="
                  padding-left: 2.5rem;
                  padding-right: 2.5rem;
                  background-color: #8fc4b7;
                  color: white;
                "
              >
                Login
              </button>
              <!-- <p class="small fw-bold mt-2 pt-1 mb-0">Don't have an account? <a href="#!"
                                class="link-danger">Register</a></p> -->
            </div>
          </form>
        </div>
      </div>
    </div>

    <div
      class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-4 px-4 px-xl-5"
      style="background-color: #8fc4b7"
    >
      <!-- Copyright -->
      <div class="text-white mb-3 mb-md-0">
        Copyright © 2020. All rights reserved.
      </div>
      <!-- Copyright -->

      <!-- Right -->
    </div>
  </section>
</template>

<script>
import { reactive, ref } from "vue";
import { useRouter } from "vue-router";
import axios from "axios";

export default {
  setup() {
    //inisialisasi vue router on Composition API
    const router = useRouter();

    //state user
    const user = reactive({
      email: "",
      password: "",
    });

    //state validation
    const validation = ref([]);

    //state loginFailed
    const loginFailed = ref(null);

    //method login
    function login() {
      //define variable
      let email = user.email;
      let password = user.password;

      //send server with axios
      axios
        .post("http://127.0.0.1:8000/api/login", {
          email,
          password,
        })
        .then((response) => {
          if (response.data.success) {
            //set token
            localStorage.setItem("token", response.data.token);
            if (email == "admin@gmail.com" && password == "admin123") {
              //redirect ke halaman dashboard novelAdmin.index
              return router.push({
                name: "berandaAdmin",
              });
            }
            //redirect ke halaman dashboard
            return router.push({
              name: "novel.index",
            });
          }

          //set state loggedIn to true
          loginFailed.value = true;
        })
        .catch((error) => {
          //set validation dari error response
          validation.value = error.response.data;
        });
    }

    return {
      user, // <-- state user
      validation, // <-- state validation
      loginFailed, // <-- state loggedIn
      login, // <-- method login
    };
  },
};
</script>
