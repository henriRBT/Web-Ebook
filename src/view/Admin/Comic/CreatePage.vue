<template>
  <div class="container mt-5">
    <div class="row">
      <div class="col-md-12">
        <div class="card border-0 rounded shadow">
          <div class="card-body">
            <h4>CREATE COMIC</h4>
            <hr />
            <form @submit.prevent="create" enctype="multipart/form-data">
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
import { reactive, ref } from "vue";
import { useRouter } from "vue-router";
import axios from "axios";
export default {
  setup() {
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
    //const route = useRoute()
    let comics = ref([]);
    //method update
    function create() {
      // let nama = comic.nama
      // let pengarang = comic.pengarang
      // let penerbit = comic.penerbit
      // let penejemah = comic.penejemah
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
            //path: '/comicAdmin'
            name: "comicAdmin.index",
          });
        })
        .catch((error) => {
          //assign state validation with error
          validation.value = error.response.data;
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
      comics,
      inputFile,
      create,
    };
  },
};
</script>
<style></style>
