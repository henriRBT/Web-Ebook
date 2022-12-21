<template>
  <div
    class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom"
  >
    <h1 class="h2">Dashboard Admin Novel</h1>
  </div>
  <div class="container mt-5">
    <div class="row">
      <div class="col-md-12">
        <div class="card border-0 rounded shadow">
          <div class="card-body">
            <router-link
              :to="{ name: 'novelAdmin.create' }"
              class="btn btn-md btn-success"
              style="float: left; margin: 10px"
              >TAMBAH NOVEL</router-link
            >
            <table class="table table-striped table-bordered mt-4">
              <thead class="thead-dark">
                <tr>
                  <th scope="col">JUDUL NOVEL</th>
                  <th scope="col">NAMA PENULIS</th>
                  <th scope="col">NAMA PENERBIT</th>
                  <th scope="col">NAMA PENERJEMAH</th>
                  <th scope="col">GAMBAR</th>
                  <th scope="col">AKSI</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(novel, id) in novels" :key="id">
                  <td>{{ novel.judul_novel }}</td>
                  <td>{{ novel.penulis_novel }}</td>
                  <td>{{ novel.penerbit_novel }}</td>
                  <td>{{ novel.tahun }}</td>
                  <td>
                    <img
                      :src="require(`/image/${novel.gambar}`)"
                      width="80"
                      height="90"
                    />
                  </td>
                  <td>
                    <router-link
                      :to="{
                        name: 'novelAdmin.edit',
                        params: { id: novel.id },
                      }"
                      class="btn btn-sm btn-primary"
                      style="margin-right: 5px"
                      >EDIT</router-link
                    >
                    <button
                      @click.prevent="novelDelete(novel.id)"
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
    let novels = ref([]);
    //vue router
    // const router = useRouter()
    //mounted
    onMounted(() => {
      //get API from Laravel Backend
      axios
        .get("http://localhost:8000/api/novel")
        .then((response) => {
          //assign state posts with response data
          novels.value = response.data.data;
        })
        .catch((error) => {
          console.log(error.response.data);
        });
    });
    //method delete
    function novelDelete(id) {
      //delete data post by ID
      axios
        .delete(`http://localhost:8000/api/novel/${id}`)
        .then(() => {
          //splice posts
          novels.value.splice(novels.value.indexOf(id), 1);
          window.location.reload(true);
        })
        .catch((error) => {
          console.log(error.response.data);
        });
    }
    //return
    return {
      novels,
      novelDelete,
    };
  },
};
</script>
<style></style>
