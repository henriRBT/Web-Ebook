<template>
    <div
        class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Majalah Page</h1>
    </div>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-12">
                <div class="card border-0 rounded shadow">
                    <div class="card-body">
                        <table class="table table-striped table-bordered mt-4">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">JUDUL MAJALAH</th>
                                    <th scope="col">PENULIS MAJALAH</th>
                                    <th scope="col">PENERBIT MAJALAH</th>
                                    <th scope="col">TAHUN</th>
                                    <th scope="col">GAMBAR</th>
                                    <th scope="col">BACA MAJALAH</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(majalah, id) in majalahs" :key="id">
                                    <td>{{ majalah.judul }}</td>
                                    <td>{{ majalah.penulis }}</td>
                                    <td>{{ majalah.penerbit }}</td>
                                    <td>{{ majalah.tahun_terbit }}</td>
                                    <td> <img :src="require(`/image/${majalah.gambar}` ) " width="80" height="90" /></td>
                                    <td class="text-center">
                                        <router-link :to="{ name: 'majalah.baca', params: { id: majalah.id } }" class="btn btn-sm btn-primary" style="margin-right: 5px;">Baca Majalah</router-link>
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
        let majalahs = ref([]);
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

        //return
        return {
            majalahs,
        };
    },
};
</script>
<style>

</style>