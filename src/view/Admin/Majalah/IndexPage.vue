<template>
  <div
    class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom"
  >
    <h1 class="h2">Dashboard Majalah Admin</h1>
  </div>
  <div class="container mt-5">
    <div class="row">
      <div class="col-md-12">
        <div class="card border-0 rounded shadow">
          <div class="card-body">
            <router-link
              :to="{ name: 'majalahAdmin.create' }"
              class="btn btn-md btn-success"
              style="float: left; margin: 10px"
              >TAMBAH MAJALAH</router-link
            >
            <table class="table table-striped table-bordered mt-4">
              <thead class="thead-dark">
                <tr>
                  <th scope="col">NAMA MAJALAH</th>
                  <th scope="col">NAMA PENULIS</th>
                  <th scope="col">NAMA PENERBIT</th>
                  <th scope="col">TAHUN TERBIT</th>
                  <th scope="col">GAMBAR</th>
                  <th scope="col">AKSI</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(majalah, id) in majalahs" :key="id">
                  <td>{{ majalah.judul }}</td>
                  <td>{{ majalah.penulis }}</td>
                  <td>{{ majalah.penerbit }}</td>
                  <td>{{ majalah.tahun_terbit }}</td>
                  <td>
                    <img
                      :src="require(`/image/${majalah.gambar}`)"
                      width="80"
                      height="90"
                    />
                  </td>
                  <td>
                    <router-link
                      :to="{
                        name: 'majalahAdmin.edit',
                        params: { id: majalah.id },
                      }"
                      class="btn btn-sm btn-primary"
                      style="margin-right: 5px"
                      >EDIT</router-link
                    >
                    <button
                      @click.prevent="majalahDelete(majalah.id)"
                      class="btn btn-sm btn-danger ml-1"
                    >
                      DELETE
                    </button>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import axios from "axios";
import { onMounted, ref } from "vue";
// import { useRouter } from 'vue-router'
export default {
  setup() {
    //reactive state
    let majalahs = ref([]);
    //vue router
    // const router = useRouter()
    //mounted
    onMounted(() => {
      //get API from Laravel Backend
      axios
        .get("http://localhost:8000/api/majalah")
        .then((response) => {
          //assign state posts with response data
          majalahs.value = response.data.data;
        })
        .catch((error) => {
          console.log(error.response.data);
        });
    });
    //method delete
    function majalahDelete(id) {
      //delete data post by ID
      axios
        .delete(`http://localhost:8000/api/majalah/${id}`)
        .then(() => {
          //splice posts
          majalahs.value.splice(majalahs.value.indexOf(id), 1);
          window.location.reload(true);
        })
        .catch((error) => {
          console.log(error.response.data);
        });
    }

    //return
    return {
      majalahs,
      majalahDelete,
    };
  },
};
</script>
<style></style>
