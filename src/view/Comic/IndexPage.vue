<template>
    <div
        class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Comic Page</h1>
    </div>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-12">
                <div class="card border-0 rounded shadow">
                    <div class="card-body">
                        <!-- <router-link :to="{name: 'departemen.create'}" class="btn btn-md btn-success" style="float:left; margin:10px">TAMBAH COMIC</router-link> -->
                        <table class="table table-striped table-bordered mt-4">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">NAMA COMIC</th>
                                    <th scope="col">NAMA PENGARANG</th>
                                    <th scope="col">NAMA PENERBIT</th>
                                    <th scope="col">NAMA PENERJEMAH</th>
                                    <th scope="col">GAMBAR</th>
                                    <th scope="col">BACA COMIC</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(comic, id) in comics" :key="id">
                                    <td>{{ comic.nama }}</td>
                                    <td>{{ comic.pengarang }}</td>
                                    <td>{{ comic.penerbit }}</td>
                                    <td>{{ comic.penejemah }}</td>
                                    <td> <img :src="require(`/image/${comic.gambar}` ) " width="80" height="90" /></td>
                                    <td class="text-center">
                                        <router-link :to="{ name: 'comic.baca', params: { id: comic.id } }" class="btn btn-sm btn-primary" style="margin-right: 5px;">Baca Comic</router-link>
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
import axios from 'axios'
import { onMounted, ref } from 'vue'
// import { useRouter } from 'vue-router'
export default {
    setup() {
        //reactive state
        let comics = ref([])
        //vue router
        // const router = useRouter()
        //mounted
        onMounted(() => {
            //get API from Laravel Backend
            axios.get('http://localhost:8000/api/comics')
                .then(response => {
                    //assign state posts with response data
                    comics.value = response.data.data
                }).catch(error => {
                    console.log(error.response.data)
                })
        })
        
        //return
        return {
            comics,
        }
    }
}
</script>
<style>

</style>