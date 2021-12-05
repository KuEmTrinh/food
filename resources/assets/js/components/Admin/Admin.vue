<template>
  <div>
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
    <div class="register">
      <h1 class="title txt-center mbt-1">新店舗</h1>
      <input
        type="text"
        class="input txt-center w-100"
        v-model="name"
        placeholder="名前"
      />
      <input
        type="email"
        class="input txt-center w-100"
        v-model="email"
        placeholder="メール"
      />
      <input
        type="text"
        class="input txt-center w-100"
        v-model="number"
        placeholder="会員番号"
      />
      <input
        type="password"
        class="input txt-center w-100"
        v-model="password"
        placeholder="パスワード"
      />
      <input
        type="password"
        class="input txt-center w-100"
        v-model="repassword"
        placeholder="パスワード再入力"
      />
      <div class="wrap flex jc-sb">
        <div
          class="btn btn-m btn-nav w-48 txt-center"
          :class="{ btn__black: sex == 1 }"
          @click.prevent="changeSex(1)"
        >
          男性
        </div>
        <div
          class="btn btn-m btn-nav w-48 txt-center"
          :class="{ btn__black: sex == 2 }"
          @click.prevent="changeSex(2)"
        >
          女性
        </div>
      </div>
      <button
        type="submit"
        class="btn btn-m btn-black w-100 mt-1"
        @click.prevent="register()"
      >
        新規
      </button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      message: [],
      name: "",
      email: "",
      number: "",
      password: "",
      repassword: "",
      sex: 1,
      check: true,
    };
  },
  methods: {
    async popMess() {
      this.message.pop();
    },
    async clear() {
      setTimeout(() => this.popMess(), 2000);
    },
    async register() {
      this.check = true;
      this.validation();
      if (this.check == true) {
        axios
          .post("new_user", {
            name: this.name,
            email: this.email,
            number: this.number,
            sex: this.sex,
            password: this.password,
          })
          .then((respone) => {
            console.log(respone.data);
            this.message.push("登録できました！");
          });
      }
    },
    async changeSex(number) {
      this.sex = number;
    },
    async validation() {
      if (this.name == "") {
        this.message.push("名前入力してください！");
        this.clear();
        this.check = false;
      }
      if (this.email == "") {
        this.message.push("メール入力してください！");
        this.clear();
        this.check = false;
      }
      if (this.number == "") {
        this.message.push("社員番号入力してください！");
        this.clear();
        this.check = false;
      } else {
        const num_length = this.number.length;
        if (num_length < 6 || num_length > 15) {
          this.message.push("社員番号の長さは6桁から15までにしてください！");
          this.clear();
          this.check = false;
        }
      }
      if (this.password == "") {
        this.message.push("パスワード入力してください！");
        this.clear();
        this.check = false;
      } else if (this.password != this.repassword) {
        this.message.push("パスワードと再入力は正しくない！");
        this.clear();
        this.check = false;
      }
      if (this.repassword == "") {
        this.message.push("パスワード再入力してください！");
        this.clear();
        this.check = false;
      }
    },
  },
  mounted() {},
  created() {},
};
</script>
