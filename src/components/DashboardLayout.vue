<template>
  <!--Main Navigation-->
  <header>

    <!-- Sidebar -->
    <nav id="sidebarMenu" class="collapse d-lg-block sidebar collapse">
      <div class="position-sticky">
        <div class="list-group list-group-flush mx-3 mt-4">
          <!-- <router-link
            :to="{ name: 'layout' }"
            class="list-group-item list-group-item-action py-2 ripple"
            aria-current="true"
          >
            <br />
            <i class="fas fa-fw me-3">Dashboard </i>
          </router-link> -->

          <router-link
            :to="{ name: 'novel.index' }"
            class="list-group-item list-group-item-action py-2 ripple"
            aria-current="true"
          >
            <br />
            <i class="fas fa-fw me-3"> Novel </i>
          </router-link>

          <router-link
            :to="{ name: 'comic.index' }"
            class="list-group-item list-group-item-action py-2 ripple"
          >
            <br />
            <i class="fas fa-fw me-3"> Comic </i>
          </router-link>

          <router-link
            :to="{ name: 'majalah.index' }"
            class="list-group-item list-group-item-action py-2 ripple"
          >
            <br />
            <i class="fas fa-fw me-3"> Majalah </i>
          </router-link>

          <br />

          <a class="nav-link d-flex align-items-center">
            <img
              src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava2-bg.webp"
              class="rounded-circle"
              height="55"
              alt="Avatar"
            />
            <router-link
              :to="{ name: 'profile' }"
              class="list-group-item list-group-item-action py-2 ripple"
              >Profile</router-link
            >
          </a>

          <a
            class="list-group-item list-group-item-action py-2 ripple align-items-center"
            style="margin-top: 150px"
          >
            <i class="fas fa-fw me-3">
              <span>
                <li
                  @click.prevent="logout"
                  class="list-group-item text-dark text-decoration-none"
                >
                  <b> LOGOUT </b>
                </li>
              </span>
            </i>
          </a>
        </div>
      </div>
    </nav>
    <!-- Sidebar -->

    <!-- Navbar -->
    <nav id="main-navbar" class="navbar navbar-expand-lg">
      <!-- Container wrapper -->
      <div class="container-fluid">
        <!-- Brand -->
        <b> 
          <router-link :to="{ name: 'beranda' }" class="navbar-brand col-lg-2 me-0 px-3">
            BacaBuku.com 
          </router-link>
        </b>
      </div>
      <!-- Container wrapper -->
    </nav>
    <!-- Navbar -->

    
    
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <!-- View Route  -->
      <router-view></router-view>
    </main>
    
  </header>
  <!--Main Navigation-->
  
  <!--Main layout-->
  <!-- <header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow" >
        
        <router-link :to="{name: 'beranda'}" class="navbar-brand col-lg-2 me-0 px-3">BacaBuku.com</router-link>    
        <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse"
            data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    </header>
    <div class="container-fluid">
        <div class="row">
            <nav id="sidebarMenu" class="collapse d-lg-block sidebar collapse">
                <div class="position-sticky pt-3">
                    <ul class="nav flex-column">
                        <li class="list-group">
                            <router-link :to="{ name: 'novel.index' }" class="nav-link">Novel</router-link>
                        </li>
                        <li class="nav-item">
                            <router-link :to="{ name: 'comic.index' }" class="nav-link">Comic</router-link>
                        </li>
                        <li class="nav-item">
                            <router-link :to="{ name: 'majalah.index' }" class="nav-link">Majalah</router-link>
                        </li>
                        <div class=" text-white p-4" style="margin-top: 500px;">
                            <li @click.prevent="logout" class="list-group-item text-dark text-decoration-none"
                                > <b> LOGOUT </b></li>
                        </div>
                    </ul> 
                   
                </div>
               
            </nav>
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                 View Route 
                <router-view></router-view>
            </main>
        </div>
        
    </div> -->
</template>
<script>
import { onMounted, ref } from "vue";
import { useRouter } from "vue-router";
import axios from "axios";

export default {
  setup() {
    //state token
    const token = localStorage.getItem("token");

    //inisialisasi vue router on Composition API
    const router = useRouter();

    //state user
    const user = ref("");

    //mounted properti
    if(!token) {
          return router.push({
            name: 'login'
          })
    }

    //method logout
    function logout() {
      //logout
      axios.defaults.headers.common.Authorization = `Bearer ${token}`;
      axios
        .get("http://127.0.0.1:8000/api/logout")
        .then((response) => {
          if (response.data.success) {
            //remove localStorage
            localStorage.removeItem("token");

            //redirect ke halaman login
            return router.push({
              name: "login",
            });
          }
        })
        .catch((error) => {
          console.log(error.response.data);
        });
    }

    return {
      token, // <-- state token
      user, // <-- state user
      logout, // <-- method logout
    };
  },
};
</script>
<style>
body {
  background-color: #fbfbfb;
}
@media (min-width: 991.98px) {
  main {
    padding-left: 240px;
  }
}

/* Sidebar */
.sidebar {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  padding: 58px 0 0; /* Height of navbar */
  box-shadow: 0 2px 5px 0 rgb(0 0 0 / 5%), 0 2px 10px 0 rgb(0 0 0 / 5%);
  width: 240px;
  z-index: 600;
}

@media (max-width: 991.98px) {
  .sidebar {
    width: 100%;
  }
}
.sidebar .active {
  border-radius: 5px;
  box-shadow: 0 2px 5px 0 rgb(0 0 0 / 16%), 0 2px 10px 0 rgb(0 0 0 / 12%);
}

.sidebar-sticky {
  position: relative;
  top: 0;
  height: calc(100vh - 48px);
  padding-top: 0.5rem;
  overflow-x: hidden;
  overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
}

/* body {
    font-size: 0.875rem;
}

.feather {
    width: 16px;
    height: 16px;
    vertical-align: text-bottom;
} */

/*
* Sidebar
*/
/* .sidebar {
    position: fixed;
    top: 0;
    bottom: 0;
    left: 0;
    z-index: 100;
    padding: 48px 0 0;
    box-shadow: inset -1px 0 0 rgba(0, 0, 0, 0.1);
}

.sidebar-sticky {
    position: relative;
    top: 0;
    height: calc(100vh - 48px);
    padding-top: 0.5rem;
    overflow-x: hidden;
    overflow-y: auto;
}

.sidebar .nav-link {
    font-weight: 500;
    color: #333;
}

.sidebar .nav-link .feather {
    margin-right: 4px;
    color: #727272;
}

.sidebar .nav-link.active {
    color: #2470dc;
}

.sidebar .nav-link:hover .feather,
.sidebar .nav-link.active .feather {
    color: inherit;
}

.sidebar-heading {
    font-size: 0.75rem;
    text-transform: uppercase;
}

/*Navbar*/

/* .navbar-brand {
    padding-top: 0.75rem;
    padding-bottom: 0.75rem;
    font-size: 1rem;
    background-color: rgba(0, 0, 0, 0.25);
    box-shadow: inset -1px 0 0 rgba(0, 0, 0, 0.25);
}

.navbar .navbar-toggler {
    top: 0.25rem;
    right: 1rem;
}

.navbar .form-control {
    padding: 0.75rem 1rem;
    border-width: 0;
    border-radius: 0;
}

.form-control-dark {
    color: #fff;
    background-color: rgba(255, 255, 255, 0.1);
    border-color: rgba(255, 255, 255, 0.1);
}

.form-control-dark:focus {
    border-color: transparent;
    box-shadow: 0 0 0 3px rgba(255, 255, 255, 0.25);
}  */
</style>
