<template>
  <div class="home-list">
    <div class="show mbt-2">
      <div class="wrap flex jc-sb">
        <div class="show-info flex-1">
          <h2 class="show-title txt-s txt-bold">店名</h2>
          <h3 class="show-content w-inherit txt-center">{{ info.name }}</h3>
        </div>
        <div class="show-info flex-1">
          <h2 class="show-title txt-s txt-bold">電話番号</h2>
          <h3 class="show-content w-inherit txt-center">{{ info.username }}</h3>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      info: "",
      name: "",
      email: "",
      password: "",
      number: "",
      sex: "",
      role: "",
    };
  },
  methods: {
    async getUserInfo() {
      axios.get("get_user_info").then((response) => {
        this.info = response.data;
        // this.name = response.data.name;
        // this.email = response.data.email;
        // this.number = response.data.username;
        // this.password = response.data.password;
        // this.sex = response.data.sex;
        // this.role = response.data.role;
      });
    },
  },
  mounted() {},
  created() {
    this.getUserInfo();
  },
};
</script>
