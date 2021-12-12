<template>
  <div>
    <div class="nav flex">
      <h2 class="nav-name mid-title">{{ name }}</h2>

      <div class="flex flx-d-c jc-c txt-center nav-content">
        <!-- <box-icon class="nav__icon" type="solid" name="down-arrow"></box-icon> -->
        <ul class="nav-ul txt-bold txt-s">
          <li
            class="nav-li mt-3"
            :class="{ nav_active: page == 'list' }"
            @click="navigateTo('list')"
          >
            <a>店舗参照</a>
          </li>
          <li
            class="nav-li mt-3"
            :class="{ nav_active: page == 'info' }"
            @click="navigateTo('info')"
          >
            <a>店舗情報登録</a>
          </li>
          <li
            class="nav-li mt-3"
            :class="{ nav_active: page == 'user' }"
            @click="navigateTo('user')"
          >
            <a>アカウント管理</a>
          </li>
          <li
            class="nav-li mt-3"
            :class="{ nav_active: page === 'admin' }"
            @click="navigateTo('admin')"
            v-if="role == 2"
          >
            <a>社員登録</a>
          </li>
          <li
            class="nav-li mt-3"
            :class="{ nav_active: page === 'users' }"
            @click="navigateTo('users')"
            v-if="role == 2"
          >
            <a>社員管理</a>
          </li>
        </ul>
        <div class="nav-logout" @click.prevent="logOut()">
          <i class="bx bx-log-out"></i>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  mounted() {},
  created() {},
  data() {
    return {
      page: "list",
      name: "",
      role: "",
      user_info: "",
    };
  },
  methods: {
    navigateTo(page) {
      this.page = page;
      this.$emit("clicked-nav", this.page);
    },
    reload() {
      window.location.reload();
    },
    logOut() {
      axios.get("logout", {}).then(() => window.location.reload());
    },
    async getUserInfo() {
      axios.get("get_user_info").then((response) => {
        this.user_info = response.data;
        this.role = response.data.role;
        this.name = response.data.name;
      });
    },
  },
  created() {
    this.getUserInfo();
  },

  logOut() {
    axios.get("logout", {}).then(() => window.location.reload());
  },
};
</script>
