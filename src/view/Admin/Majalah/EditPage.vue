<template>
  <div class="container mt-5">
    <div class="row">
      <div class="col-md-12">
        <div class="card border-0 rounded shadow">
          <div class="card-body">
            <h4>EDIT MAJALAH</h4>
            <hr />
            <form @submit.prevent="update">
              <div class="form-group mb-3">
                <label class="form-label" style="float: left"
                  >Nama MAJALAH</label
                >
                <input
                  type="text"
                  class="form-control"
                  v-model="majalah.judul"
                  placeholder="Masukkan nama majalah"
                />

                <div v-if="validation.judul" class="mt-2 alert alert-danger">
                  {{ validation.judul[0] }}
                </div>
              </div>
              <div class="form-group mb-3">
                <label for="content" class="form-label" style="float: left"
                  >Nama Penulis</label
                >
                <input
                  class="form-control"
                  v-model="majalah.penulis"
                  placeholder="Masukkan nama Penulis"
                />

                <div v-if="validation.penulis" class="mt-2 alert alert-danger">
                  {{ validation.penulis[0] }}
                </div>
              </div>
              <div class="form-group mb-3">
                <label for="content" class="form-label" style="float: left"
                  >Nama Penerbit</label
                >
                <input
                  class="form-control"
                  type="text"
                  v-model="majalah.penerbit"
                  placeholder="Masukkan nama penerbit"
                />

                <div v-if="validation.penerbit" class="mt-2 alert alert-danger">
                  {{ validation.penerbit[0] }}
                </div>
              </div>

              <div class="form-group mb-3">
                <label for="content" class="form-label" style="float: left"
                  >Tahun Terbit</label
                >
                <input
                  class="form-control"
                  type="text"
                  v-model="majalah.tahun_terbit"
                  placeholder="Masukkan tahun terbit"
                />

                <div
                  v-if="validation.tahun_terbit"
                  class="mt-2 alert alert-danger"
                >
                  {{ validation.tahun_terbit[0] }}
                </div>
              </div>

              <div class="form-group mb-3">
                <label for="gambar" class="form-label">Gambar</label>
                <input
                  class="form-control"
                  type="file"
                  id="gambar"
                  v-on:change="inputFile($event)"
                />

                <div v-if="validation.gambar" class="mt-2 alert alert-danger">
                  {{ validation.gambar[0] }}
                </div>
              </div>
              <button type="submit" class="btn btn-primary" style="float: left">
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
import { reactive, ref, onMounted } from "vue";
import { useRouter, useRoute } from "vue-router";
import axios from "axios";
export default {
  setup() {
    //reactive state
    let majalahs = ref([]);
    //state majalah
    const majalah = reactive({
      judul: "",
      pengarang: "",
      penerbit: "",
      penejemah: "",
      gambar: "",
    });
    //state validation
    const validation = ref([]);
    //vue router
    const router = useRouter();
    //vue router
    const route = useRoute();
    onMounted(() => {
      axios
        .get(`http://localhost:8000/api/majalah/${route.params.id}`)
        .then((response) => {
          majalah.judul = response.data.data.judul;
          majalah.penulis = response.data.data.penulis;
          majalah.penerbit = response.data.data.penerbit;
          majalah.tahun_terbit = response.data.data.tahun_terbit;
          majalah.gambar = response.data.data.gambar;
        })
        .catch((error) => {
          console.log(error.response.data);
        });
    });
    //method update
    function update() {
      deleteData(route.params.id);
      var formData = new FormData();
      formData.append("judul", majalah.judul);
      formData.append("penulis", majalah.penulis);
      formData.append("penerbit", majalah.penerbit);
      formData.append("tahun_terbit", majalah.tahun_terbit);
      formData.append("gambar", majalah.gambar);
      axios
        .post(`http://localhost:8000/api/majalah`, formData)
        .then((res) => {
          //redirect ke post index
          console.log(res);
          router.push({
            name: "majalahAdmin.index",
          });
        })
        .catch((error) => {
          console.log(error);
        });
    }
    //method delete
    function deleteData(id) {
      //delete data post by ID
      axios
        .delete(`http://localhost:8000/api/majalah/${id}`)
        .then(() => {
          //splice posts
          majalahs.value.splice(majalahs.value.indexOf(id), 1);
        })
        .catch((error) => {
          console.log(error.response.data);
        });
    }
    function inputFile(event) {
      this.majalah.gambar = event.target.files[0];
    }
    //return
    return {
      majalah,
      majalahs,
      inputFile,
      deleteData,
      validation,
      router,
      update,
    };
  },
};
</script>
<style></style>
