<template>
  <div class="home-list">
    <div class="show mbt-2">
      <div class="message txt-center mt-1 mbt-1 flex jc-c">
        <div class="wrap flex flx-d-c">
          <div class="mt-1" v-for="mess in message" :key="mess.id">
            <h3
              class="message-notice message__content"
              v-bind="{ message_error: mess.type == 1 }"
            >
              {{ mess }}
            </h3>
          </div>
        </div>
      </div>
      <div class="show-info">
        <div class="wrap flex jc-sb">
          <div class="show-info flex-1">
            <h2 class="show-title txt-s txt-bold">ニックネーム</h2>
            <input
              type="text"
              class="input info-input__input w-50"
              placeholder="新パスワード"
              v-model="info.name"
            />
          </div>
          <div class="show-info flex-1">
            <h2 class="show-title txt-s txt-bold">社員番号</h2>
            <h3 class="show-content w-inherit txt-center">
              {{ info.username }}
            </h3>
          </div>
        </div>
        <h2 class="show-title txt-s txt-bold">メール</h2>
        <input
          type="text"
          class="input info-input__input w-50"
          placeholder="新パスワード"
          v-model="info.email"
        />
        <h2 class="show-title txt-s txt-bold">現在パスワード</h2>
        <input
          type="password"
          class="input info-input__input w-50"
          placeholder="現在パスワード"
          v-model="current_password"
        />
        <h2 class="show-title txt-s txt-bold">新パスワード</h2>
        <input
          type="password"
          class="input info-input__input w-50"
          placeholder="新パスワード"
          v-model="new_password"
        />
        <h2 class="show-title txt-s txt-bold">新パスワード再入力</h2>
        <input
          type="password"
          class="input info-input__input w-50"
          placeholder="新パスワード"
          v-model="new_repassword"
        />
        <div
          class="btn btn-m btn__black txt-center"
          　@click.prevent="resetPassword()"
        >
          登録
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
      current_password: "",
      new_password: "",
      new_repassword: "",
      message: [],
    };
  },
  methods: {
    async popMess() {
      this.message.pop();
    },
    async clear() {
      setTimeout(() => this.popMess(), 2000);
    },
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
    async resetPassword() {
      // alert("check");
      if (this.new_repassword == this.new_password) {
        axios
          .post("reset_password", {
            current_password: this.current_password,
            new_password: this.new_password,
            email: this.info.email,
            name: this.info.name,
          })
          .then((response) => {
            this.message.push(response.data.message);
            this.clear();
            console.log(response.data);
          });
      } else {
        this.message.push("パスワード再入力問題があります！");
        this.clear();
      }
    },
  },
  mounted() {},
  created() {
    this.getUserInfo();
  },
};
</script>
