<template>
  <section class="vh-100">
    <div class="container py-5 ">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-md-12 col-xl-4">
          <div class="card" style="border-radius: 15px">
            <div class="card-body text-center">
              <div class="mt-3 mb-4">
                <img
                  src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava2-bg.webp"
                  class="rounded-circle img-fluid"
                  style="width: 100px"
                />
              </div>
              <h4 class="mb-2">Username: {{ user.username }}</h4>
              <p class="text-muted mb-4">Email: {{ user.email }}</p>

              <button type="button" class="btn btn-primary btn-rounded btn-lg">
                <router-link
                  :to="{ name: 'profileEdit' , params: { id: user.id }}"
                  class="list-group-item list-group-item-action py-2 ripple"
                  >UPDATE</router-link
                >
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
<script>
import { onMounted, ref } from "vue";
import { useRouter } from "vue-router";
import axios from "axios";

export default {
  setup() {
    //state token
    const token = localStorage.getItem("token");

    //inisialisasi vue router on Composition API
    const router = useRouter();

    //state user
    const user = ref('')

    //mounted properti
    onMounted(() => {
        //check Token exist
        if(!token) {
            return router.push({
                name: 'login'
            })
        }
        axios.defaults.headers.common.Authorization = `Bearer ${token}`
        axios.get("http://127.0.0.1:8000/api/user")
        .then((response) => {
        //   console.log(response.data.username);
          user.value = response.data;
        }).catch((error) => {
          console.log(error);
        });
    });

    //return
    return {
      token, // <-- state token
      user, // <-- state user
    };
  },
};
</script>
<style></style>
