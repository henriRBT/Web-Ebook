<template>
  <div class="container mt-5">
      <div class="row">
          <div class="col-md-12">
              <div class="card border-0 rounded shadow">
                  <div class="card-body">
                      <h4>EDIT NOVEL</h4>
                      <hr>
                      <form @submit.prevent="update">
                          <div class="form-group mb-3">
                          <label class="form-label" style="float:left">Judul Novel</label>
                          <input type="text" class="form-control" v-model="novel.judul_novel" placeholder="Masukkan nama majalah">
                          
                          <div v-if="validation.judul_novel" class="mt-2 alert alert-danger">
                              {{ validation.judul_novel[0] }}
                          </div>
                      </div>
                      <div class="form-group mb-3">
                          <label for="content" class="form-label" style="float:left">Nama Penulis</label>
                          <input class="form-control" v-model="novel.penulis_novel" placeholder="Masukkan nama Penulis">
                          
                          <div v-if="validation.penulis_novel" class="mt-2 alert alert-danger">
                              {{ validation.penulis_novel[0] }}
                          </div>
                      </div>
                      <div class="form-group mb-3">
                          <label for="content" class="form-label" style="float:left">Nama Penerbit</label>
                          <input class="form-control"
                          type="text" v-model="novel.penerbit_novel"
                          placeholder="Masukkan nama penerbit">
                          
                          <div v-if="validation.penerbit_novel" class="mt-2 alert alert-danger">
                          {{
                          validation.penerbit_novel[0] }}
                          </div>
                      </div>

                      <div class="form-group mb-3">
                          <label for="content" class="form-label" style="float:left">Tahun Terbit</label>
                          <input class="form-control"
                          type="text" v-model="novel.tahun"
                          placeholder="Masukkan tahun terbit">
                          
                          <div v-if="validation.tahun" class="mt-2 alert alert-danger">
                          {{
                          validation.tahun[0] }}
                          </div>
                      </div>

                      <div class="form-group mb-3">
                          <label for="gambar" class="form-label">Gambar</label>
                          <input class="form-control" type="file" id="gambar" v-on:change="inputFile($event)">

                          <div v-if="validation.gambar" class="mt-2 alert alert-danger">
                          {{
                          validation.gambar[0] }}
                          </div>
                      </div>
                      <button type="submit" class="btn btn-primary" style="float:left">SIMPAN</button>
                      </form>
                  </div>
              </div>
          </div>
      </div>
  </div>
</template>
<script>
import { reactive, ref, onMounted } from 'vue'
import { useRouter, useRoute } from 'vue-router'
import axios from 'axios'
export default {
  setup() {
  //reactive state
  let novels = ref([])
  //state novel
  const novel = reactive({
  judul_novel: '',
  penulis_novel: '',
  penerbit_novel: '',
  tahun: '',
  gambar: ''
  })
  //state validation
  const validation = ref([])
  //vue router
  const router = useRouter()
  //vue router
  const route = useRoute()
  onMounted(() => {
  axios.get(`http://localhost:8000/api/novel/${route.params.id}`)
  .then(response => {
      novel.judul_novel = response.data.data.judul_novel
      novel.penulis_novel = response.data.data.penulis_novel
      novel.penerbit_novel = response.data.data.penerbit_novel
      novel.tahun = response.data.data.tahun
      novel.gambar = response.data.data.gambar
      }).catch(error => {
      console.log(error.response.data)
      })
  })
  //method update
  function update() {
      deleteData(route.params.id);
      var formData = new FormData();
      formData.append("judul_novel", novel.judul_novel)
      formData.append("penulis_novel", novel.penulis_novel)
      formData.append("penerbit_novel", novel.penerbit_novel)
      formData.append("tahun", novel.tahun)
      formData.append("gambar", novel.gambar)
      axios.post(`http://localhost:8000/api/novel`, formData).then(res => {
      //redirect ke post index
      console.log(res)
      router.push({
          name: 'novelAdmin.index'
          })
      }).catch(error => {
          console.log(error)
      })
  }
  //method delete
  function deleteData(id) {
          //delete data post by ID
          axios.delete(`http://localhost:8000/api/novel/${id}`)
          .then(() => {
              //splice posts 
              novels.value.splice(novels.value.indexOf(id), 1);
           }).catch(error => {
               console.log(error.response.data)
           })
  }
  function inputFile(event){
      this.novel.gambar = event.target.files[0];
  }
      //return
      return {
          novel,
          novels,
          inputFile,
          deleteData,
          validation,
          router,
          update
      }
  }
}
</script>
<style>
</style>

