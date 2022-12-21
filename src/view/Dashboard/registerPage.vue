<template>
       <section class="h-100 h-custom" style="background-color: #8fc4b7;">
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-lg-8 col-xl-6">
                    <div class="card rounded-3">
                        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/img3.webp"
                            class="w-100" style="border-top-left-radius: .3rem; border-top-right-radius: .3rem;"
                            alt="Sample photo">

                        <div class="card-body p-md-5">
                            <h3 >Registration Info</h3>
                            <form @submit.prevent="register" class="px-md-2 ">
                                <div>
                                    <label style="margin-top:5px;">Full Name</label>
                                    <input type="text" v-model="user.username" class="form-control" placeholder="Full Name" style="margin-top:5px;">
                                    <div v-if="validation.username" class="mt-2 alert alert-danger">
                                        {{ validation.username[0] }}
                                    </div>
                                </div>

                                <div>
                                    <label style="margin-top:5px;">Email address</label>
                                    <input type="email" v-model="user.email" class="form-control" placeholder="Email Address" style="margin-top:5px;">
                                    <div v-if="validation.email" class="mt-2 alert alert-danger">
                                        {{ validation.email[0] }}
                                    </div>
                                </div>


                                 <div>
                                    <label style="margin-top:5px;">Password</label>
                                    <input type="password" v-model="user.password" class="form-control" placeholder="Password" style="margin-top:5px;">
                                    <div v-if="validation.password" class="mt-2 alert alert-danger">
                                        {{ validation.password[0] }}
                                    </div>
                                </div>

                                <button type="submit" class="btn btn-success btn-lg mb-1" style="margin-top:25px;">REGISTER</button>
                                <p class="small fw-bold mt-2 pt-1 mb-0">have an account? 
                                <router-link :to="{ name: 'login' }"  class="link-danger">Login</router-link> 
                                </p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
    import { reactive, ref } from 'vue'
    import { useRouter } from 'vue-router'
    import axios from 'axios'

    export default {


        setup() {

            //inisialisasi vue router on Composition API
            const router = useRouter()

            //state user
            const user = reactive({
                username: '',
                email: '',
                password: '',
            })

            //state validation
            const validation = ref([])
          
            //method register
            function register() {

                //define variable 
                let username = user.username
                let email = user.email
                let password = user.password
                

                //send server with axios
                axios.post('http://127.0.0.1:8000/api/register', {
                        username,
                        email,
                        password,
                })
                .then(() => {
                    if (username == "admin" && email == "admin@gmail.com" && password == "admin123") {
                        //redirect ke halaman dashboard
                        return router.push({
                            name: "register",
                    });
            }
                    //redirect ke halaman login
                    return router.push({
                        name: 'login'
                    })

                }).catch(error => {
                    //set validation dari error response
                    validation.value = error.response.data
                })

            }

            return {
                user, // <-- state user
                validation, // <-- state validation 
                register // <-- method register
            }

        }

    }
</script>