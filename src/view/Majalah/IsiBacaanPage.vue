<template>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-12">
                
                <div class="card border-0 rounded shadow">
                    <div class="card-body">
                        <h4 style="text-align:center">ISi Bacaan</h4>
                        <p style="text-align:center">contoh bancaan</p>
                    </div>  
                </div>

                <div class="card border-0 rounded shadow">
                    <div class="card-body">
                        <router-link :to="{ name: 'majalah.isibacaan', params: { id: majalah.id } }" class="btn btn-sm btn-primary" style="margin-left:550px;">Next</router-link>
                    </div>  
                </div>

                <div class="card border-0 rounded shadow">
                    <div class="card-body">
                        <router-link :to="{ name: 'majalah.baca', params: { id: majalah.id } }" class="btn btn-sm btn-primary" style="margin-left:540px;">Previous</router-link>
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