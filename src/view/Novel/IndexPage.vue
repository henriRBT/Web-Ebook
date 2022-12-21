<template>
    <div
        class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Novel Page</h1>
    </div>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-12">
                <div class="card border-0 rounded shadow">
                    <div class="card-body">
                        <table class="table table-striped table-bordered mt-4">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">JUDUL NOVEL</th>
                                    <th scope="col">PENULIS NOVEL</th>
                                    <th scope="col">PENERBIT NOVEL</th>
                                    <th scope="col">TAHUN</th>
                                    <th scope="col">GAMBAR</th>
                                    <th scope="col">BACA NOVEL</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(novel, id) in novels" :key="id">
                                    <td>{{ novel.judul_novel }}</td>
                                    <td>{{ novel.penulis_novel }}</td>
                                    <td>{{ novel.penerbit_novel }}</td>
                                    <td>{{ novel.tahun }}</td>
                                    <td> <img :src="require(`/image/${novel.gambar}` ) " width="80" height="90" /></td>
                                    <td class="text-center">
                                        <router-link :to="{ name: 'novel.baca', params: { id: novel.id } }" class="btn btn-sm btn-primary" style="margin-right: 5px;">Baca Novel</router-link>
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
export default {
    setup() {
        //reactive state
        let novels = ref([]);
        //mounted
        onMounted(() => {
            //get API from Laravel Backend
            axios
                .get('http://localhost:8000/api/novel')
                .then((response) => {
                    //assign state posts with response data
                    novels.value = response.data.data;
                })
                .catch((error) => {
                    console.log(error.response.data);
                });
        });

        //return
        return {
            novels,
        };
    },
};
</script>
<style>

</style>