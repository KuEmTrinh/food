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
    <div class="show mbt-2" v-if="show_user == true">
      <div class="show-close" @click.prevent="hidden()">
        <box-icon name="x-circle" size="md"></box-icon>
      </div>
      <div class="show-info">
        <div class="wrap flex jc-sb">
          <div class="show-info flex-1">
            <h2 class="show-title txt-s txt-bold">ニックネーム</h2>
            <input
              type="text"
              class="input info-input__input w-50"
              placeholder="新パスワード"
              v-model="user.name"
            />
          </div>
          <div class="show-info flex-1">
            <h2 class="show-title txt-s txt-bold">社員番号</h2>
            <h3 class="show-content w-inherit txt-center">
              {{ user.username }}
            </h3>
          </div>
        </div>
        <h2 class="show-title txt-s txt-bold">メール</h2>
        <input
          type="text"
          class="input info-input__input w-50"
          placeholder="新パスワード"
          v-model="user.email"
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
        <div class="btn btn-m btn__black txt-center" 　@click.prevent="reset()">
          登録
        </div>
      </div>
    </div>
    <div class="list">
      <h1 class="title">社員情報管理</h1>
      <table class="list-table mt-2">
        <tr class="list-table__top">
          <th class="list-table__index">#</th>
          <th class="list-table__name">名前</th>
          <th class="list-table__number">社員番号</th>
          <th class="list-table__sex">性別</th>
          <th class="list-table__action">行動</th>
        </tr>
        <tr v-for="(user, index) in users" :key="user.id" class="list-table__item">
          <th class="list-table__index">{{ index }}</th>
          <th class="list-table__name">{{ user.name }}</th>
          <th class="list-table__number">{{ user.username }}</th>
          <th class="list-table__sex" v-if="user.sex == 1">男性</th>
          <th class="list-table__sex" v-if="user.sex == 2">女性</th>
          <th class="list-table__action">
            <i class="bx bx-edit" @click.prevent="show(index)"></i>
          </th>
        </tr>
      </table>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      users: [],
      user: "",
      message: [],
      show_user: false,
      new_password: "",
      new_repassword: "",
    };
  },
  methods: {
    async popMess() {
      this.message.pop();
    },
    async clear() {
      setTimeout(() => this.popMess(), 3000);
    },
    async getAllUser() {
      axios
        .get("get_all_user")
        .then((response) => (this.users = response.data));
    },
    async show(index) {
      this.user = this.users[index];
      this.show_user = true;
    },
    async hidden() {
      this.show_user = false;
    },
    async reset() {
      axios
        .post("reset_user", {
          id: this.user.id,
          new_password: this.new_password,
          name: this.user.name,
          email: this.user.email,
        })
        .then((response) => {
          this.message.push(response.data.message);
          this.clear();
          this.hidden();
        });
    },
  },
  mounted() {},
  created() {
    this.getAllUser();
  },
};
</script>
