<template>
  <div class="container mt-5">
    <div class="row">
      <div class="col-md-12">
        <div class="card border-0 rounded shadow">
          <div class="card-body">
            <h4>CREATE MAJALAH</h4>
            <hr />
            <form @submit.prevent="create">
              <div class="form-group mb-3">
                <label class="form-label" style="float: left"
                  >Judul Majalah</label
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
                  {{ validation.penerbit[0] }}
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
import { reactive, ref } from "vue";
import { useRouter } from "vue-router";
import axios from "axios";
export default {
  setup() {
    //state majalah
    const majalah = reactive({
      judul: "",
      penulis: "",
      penerbit: "",
      tahun_terbit: "",
      gambar: "",
    });
    //state validation
    const validation = ref([]);
    //vue router
    const router = useRouter();
    //vue router
    //const route = useRoute()
    let majalahs = ref([]);
    //method update
    function create() {
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
            //path: '/majalahAdmin'
            name: "majalahAdmin.index",
          });
        })
        .catch((error) => {
          //assign state validation with error
          validation.value = error.response.data;
        });
    }
    function inputFile(event) {
      this.majalah.gambar = event.target.files[0];
    }
    //return
    return {
      majalah,
      validation,
      router,
      majalahs,
      create,
      inputFile,
    };
  },
};
</script>
<style></style>
