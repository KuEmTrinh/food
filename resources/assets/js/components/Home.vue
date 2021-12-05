<template>
  <div class="home">
    <nav-component v-on:clicked-nav="getDataFromNav" />
    <div class="content">
      <list-component
        v-on:show-info="showInfo"
        v-if="page == 'list' && show == false"
      />
      <res-info-component v-if="page == 'info'" :info_id="info_id" />
      <user-component v-if="page == 'user'" />
      <admin-component v-if="page == 'admin'" />
    </div>
  </div>
</template>

<script>
import Infomation from "./Res/Infomation.vue";

export default {
  components: {
    Infomation,
  },
  data() {
    return {
      page: "list",
      show: false,
      info: [],
      info_id: "",
    };
  },
  methods: {
    async getDataFromNav(page) {
      this.page = page;
    },
    async showInfo(id) {
      this.show = true;
      alert(id);
    },
    async getInfo() {
      axios.get("get_info").then((response) => {
        this.info = response.data;
        this.info_id = this.info[0].id;
      });
    },
  },
  created() {
    this.getInfo();
  },
};
</script>
