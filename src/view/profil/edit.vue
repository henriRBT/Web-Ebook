<template>
  <div class="container mt-5">
    <div class="row">
      <div class="col-md-12">
        <div class="card border-0 rounded shadow">
          <div class="card-body">
            <h4>UPDATE USER</h4>
            <hr />

            <form @submit.prevent="update($id)">
              <div class="form-group mb-3">
                <label class="form-label">Username</label>
                <input
                  type="text"
                  class="form-control"
                  v-model="user.username"
                  placeholder="Masukkan Username "
                />

                <!-- validation -->
                <div v-if="validation.username" class="mt-2 alert alert-danger">
                  {{ validation.username[0] }}
                </div>
              </div>

              <div class="form-group mb-3">
                <label for="content" class="form-label">Email</label>
                <input
                  type="email"
                  v-model="user.email"
                  class="form-control"
                  placeholder="Email Address"
                  style="margin-top: 5px"
                />

                <!-- validation -->
                <div v-if="validation.email" class="mt-2 alert alert-danger">
                  {{ validation.email[0] }}
                </div>
              </div>

              <div>
                <label style="margin-top: 5px">Change Password</label>
                <input
                  type="password"
                  v-model="user.password"
                  class="form-control"
                  placeholder="Change password * optional"
                  style="margin-top: 5px"
                />
                <div v-if="validation.password" class="mt-2 alert alert-danger">
                  {{ validation.password[0] }}
                </div>
              </div>

              <button
                type="submit"
                class="btn btn-primary"
                style="margin-top: 20px"
              >
                SIMPAN
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { reactive, ref } from "vue";
import { useRouter, useRoute } from "vue-router";
import axios from "axios";

export default {
  setup() {
    //inisialisasi vue router on Composition API
    const router = useRouter();

    const route = useRoute();

    const user = reactive({
      username: "",
      email: "",
      password: "",
    });

    //state validation
    const validation = ref([]);

    //method register
    function update($id) {
      //define variable
      let username = user.username;
      let email = user.email;
      let password = user.password;
      let id = user.id;
      //send server with axios
      axios
        .put(`http://127.0.0.1:8000/api/user/${route.params.id}`, {
          username,
          email,
          password,
        })
        .then(() => {
          //redirect ke halaman login
          return router.push({
            name: "profile",
          });
        })
        .catch((error) => {
          //set validation dari error response
          console.log(error);
          //validation.value = error.response.data;
        });
    }

    return {
      user, // <-- state user
      validation, // <-- state validation
      update, // <-- method register
    };
  },
};
</script>

<style></style>
