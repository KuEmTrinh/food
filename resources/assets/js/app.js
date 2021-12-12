/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require("./bootstrap");

window.Vue = require("vue");
import VModal from "vue-js-modal";

Vue.use(VModal);

import Vue from "vue";
import StarRating from "vue-star-rating";
export const bus = new Vue();

// export const bus = new Vue();

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

//home
Vue.component("home", require("./components/Home.vue"));
//nav
Vue.component("nav-component", require("./components/Nav.vue"));
//list
Vue.component("list-component", require("./components/List.vue"));
//info
Vue.component("res-info-component", require("./components/Res/Infomation.vue"));
//user
Vue.component("user-component", require("./components/User/User.vue"));
Vue.component("users-component", require("./components/Admin/User.vue"));
//image
Vue.component("image-component", require("./components/Res/Image.vue"));
//star
Vue.component("star-rating", StarRating);
//admin
Vue.component("admin-component", require("./components/Admin/Admin.vue"));
const app = new Vue({
  el: "#app",
});
