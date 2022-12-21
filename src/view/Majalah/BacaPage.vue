<template>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-12">
                
                <div class="card border-0 rounded shadow">
                    <div class="card-body">
                        <div v-for="(majalah, id) in majalahs " :key="id">
                            <div v-if="majalah.id == this.$route.params.id">
                                <h4 style="text-align:center">{{majalah.judul}}</h4>
                            </div>
                        </div>
                    </div>  
                </div>

                <div class="card border-0 rounded shadow">
                    <div class="card-body">
                        <div v-for="(majalah, id) in majalahs " :key="id">
                            <div v-if="majalah.id == this.$route.params.id">
                                <td>
                                    <img :src="require(`/image/${majalah.gambar}`)" style="margin-left:320px; " width="500" height="600">
                                </td>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card border-0 rounded shadow">
                    <div class="card-body">
                        <router-link :to="{ name: 'majalah.isibacaan', params: { id: majalah.id } }" class="btn btn-sm btn-primary" style="margin-left:550px;">Next</router-link>
                    </div>  
                </div>


            </div>
        </div>
    </div>
</template>

<script>
import axios from "axios";
import { useRouter } from 'vue-router'
import { reactive, onMounted, ref } from "vue";
export default {

    setup() {
        //reactive state
        let majalahs = ref([]);
        //state comic
        const majalah = reactive({
        judul: '',
        gambar: ''
        })
        //vue router
        const router = useRouter() 
        //vue router
        //const route = useRoute()
        //mounted
        onMounted(() => {
            //get API from Laravel Backend
            axios.get(`http://localhost:8000/api/majalah/`)
                .then(response => {
                    majalahs.value = response.data.data;
                })
                .catch((error) => {
                    console.log(error.response.data);
                });
        });

        //return
        return {
            majalah,
            majalahs,
            router,
        };
    },
};
</script>