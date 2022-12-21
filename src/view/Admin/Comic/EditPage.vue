<template>
  <div class="container mt-5">
    <div class="row">
      <div class="col-md-12">
        <div class="card border-0 rounded shadow">
          <div class="card-body">
            <h4>EDIT COMIC</h4>
            <hr />
            <form @submit.prevent="update" enctype="multipart/form-data">
              <div class="form-group mb-3">
                <label class="form-label" style="float: left">Nama Comic</label>
                <input
                  type="text"
                  class="form-control"
                  v-model="comic.nama"
                  placeholder="Masukkan nama comic"
                />

                <div v-if="validation.nama" class="mt-2 alert alert-danger">
                  {{ validation.nama[0] }}
                </div>
              </div>
              <div class="form-group mb-3">
                <label for="content" class="form-label" style="float: left"
                  >Nama Pengarang</label
                >
                <input
                  class="form-control"
                  v-model="comic.pengarang"
                  placeholder="Masukkan nama pengarang"
                />

                <div
                  v-if="validation.pengarang"
                  class="mt-2 alert alert-danger"
                >
                  {{ validation.pengarang[0] }}
                </div>
              </div>
              <div class="form-group mb-3">
                <label for="content" class="form-label" style="float: left"
                  >Nama Penerbit</label
                >
                <input
                  class="form-control"
                  type="text"
                  v-model="comic.penerbit"
                  placeholder="Masukkan nama penerbit"
                />

                <div v-if="validation.penerbit" class="mt-2 alert alert-danger">
                  {{ validation.penerbit[0] }}
                </div>
              </div>

              <div class="form-group mb-3">
                <label for="content" class="form-label" style="float: left"
                  >Nama Penerjemah</label
                >
                <input
                  class="form-control"
                  type="text"
                  v-model="comic.penejemah"
                  placeholder="Masukkan nama penerjemah"
                />

                <div
                  v-if="validation.penejemah"
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
import { reactive, ref, onMounted } from "vue";
import { useRouter, useRoute } from "vue-router";
import axios from "axios";
export default {
  setup() {
    //reactive state
    let comics = ref([]);
    //state comic
    const comic = reactive({
      nama: "",
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
        .get(`http://localhost:8000/api/comics/${route.params.id}`)
        .then((response) => {
          comic.nama = response.data.data.nama;
          comic.pengarang = response.data.data.pengarang;
          comic.penerbit = response.data.data.penerbit;
          comic.penejemah = response.data.data.penejemah;
          comic.gambar = response.data.data.gambar;
        })
        .catch((error) => {
          console.log(error.response.data);
        });
    });
    //method update
    function update() {
      deleteData(route.params.id);
      var formData = new FormData();
      formData.append("nama", comic.nama);
      formData.append("pengarang", comic.pengarang);
      formData.append("penerbit", comic.penerbit);
      formData.append("penejemah", comic.penejemah);
      formData.append("gambar", comic.gambar);
      axios
        .post(`http://localhost:8000/api/comics`, formData)
        .then((res) => {
          //redirect ke post index
          console.log(res);
          router.push({
            name: "comicAdmin.index",
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
        .delete(`http://localhost:8000/api/comics/${id}`)
        .then(() => {
          //splice posts
          comics.value.splice(comics.value.indexOf(id), 1);
        })
        .catch((error) => {
          console.log(error.response.data);
        });
    }
    function inputFile(event) {
      this.comic.gambar = event.target.files[0];
    }
    //return
    return {
      comic,
      validation,
      router,
      inputFile,
      update,
      deleteData,
    };
  },
};
</script>
<style></style>
