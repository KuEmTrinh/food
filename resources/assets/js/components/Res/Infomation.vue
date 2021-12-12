<template>
  <div class="info">
    <h1 class="title">店舗情報登録</h1>
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
    <div class="info-input flex al-ct mt-1">
      <h2 class="info-title mid-title mr-1">店舗名</h2>
      <input
        type="text"
        class="input info-input__input"
        placeholder="店舗名"
        v-model="name"
      />
    </div>
    <div class="info-input flex al-ct mt-1">
      <h2 class="info-title mid-title mr-1">住所</h2>
      <input
        type="text"
        class="input info-input__input"
        placeholder="住所"
        v-model="address"
      />
    </div>
    <div class="info-input flex al-ct mt-1">
      <h2 class="info-title mid-title mr-1">電話番号</h2>
      <input
        type="text"
        class="input info-input__input"
        placeholder="電話番号"
        v-model="number"
      />
    </div>
    <div class="info-input flex al-ct mt-1">
      <h2 class="info-title mid-title mr-1">目安金額</h2>
      <div class="mt-06 flex jc-sb al-ct">
        <div class="info-wrap">
          <input
            type="text"
            class="home-money__input"
            placeholder="から"
            v-model="min_money"
          />
          <span>~</span>
          <input
            type="text"
            class="home-money__input"
            placeholder="まで"
            v-model="max_money"
          />
        </div>
      </div>
    </div>
    <div class="info-input flex al-ct mt-1 flx-wrap">
      <h2 class="info-title mid-title mr-1">ジャンル</h2>
      <div class="info-genre flex al-ct">
        <!-- <input type="checkbox" class="mr-1" v-on:click="pushGenre('定食')" /> -->
        <input
          type="checkbox"
          class="mr-1"
          id="teisyoku"
          value="定食"
          v-model="genre"
        />
        <h2 for="teisyoku" class="info-genre__content txt-s txt-bold mr-2">
          定食
        </h2>
      </div>
      <div class="info-genre flex al-ct">
        <!-- <input type="checkbox" class="mr-1" v-on:click="pushGenre('麺類')" /> -->
        <input
          type="checkbox"
          class="mr-1"
          id="menrui"
          value="麺類"
          v-model="genre"
        />

        <h2 for="menrui" class="info-genre__content txt-s txt-bold mr-2">
          麺類
        </h2>
      </div>
      <div class="info-genre flex al-ct">
        <!-- <input type="checkbox" class="mr-1" v-on:click="pushGenre('カレー')" /> -->
        <input
          type="checkbox"
          class="mr-1"
          id="kare"
          value="パン"
          v-model="genre"
        />

        <h2 for="kare" class="info-genre__content txt-s txt-bold mr-2">パン</h2>
      </div>
      <div class="info-genre flex al-ct">
        <!-- <input type="checkbox" class="mr-1" v-on:click="pushGenre('カレー')" /> -->
        <input
          type="checkbox"
          class="mr-1"
          id="kare"
          value="飲料"
          v-model="genre"
        />

        <h2 for="kare" class="info-genre__content txt-s txt-bold mr-2">飲料</h2>
      </div>
      <div class="info-genre flex al-ct">
        <!-- <input type="checkbox" class="mr-1" v-on:click="pushGenre('カレー')" /> -->
        <input
          type="checkbox"
          class="mr-1"
          id="kare"
          value="和食"
          v-model="genre"
        />

        <h2 for="kare" class="info-genre__content txt-s txt-bold mr-2">和食</h2>
      </div>
      <div class="info-genre flex al-ct">
        <!-- <input type="checkbox" class="mr-1" v-on:click="pushGenre('カレー')" /> -->
        <input
          type="checkbox"
          class="mr-1"
          id="kare"
          value="洋食"
          v-model="genre"
        />

        <h2 for="kare" class="info-genre__content txt-s txt-bold mr-2">洋食</h2>
      </div>
      <div class="info-genre flex al-ct">
        <!-- <input type="checkbox" class="mr-1" v-on:click="pushGenre('カレー')" /> -->
        <input
          type="checkbox"
          class="mr-1"
          id="kare"
          value="中華"
          v-model="genre"
        />

        <h2 for="kare" class="info-genre__content txt-s txt-bold mr-2">中華</h2>
      </div>
      <div class="info-genre flex al-ct">
        <!-- <input type="checkbox" class="mr-1" v-on:click="pushGenre('カレー')" /> -->
        <input
          type="checkbox"
          class="mr-1"
          id="kare"
          value="スイーツ"
          v-model="genre"
        />

        <h2 for="kare" class="info-genre__content txt-s txt-bold mr-2">
          スイーツ
        </h2>
      </div>
      <div class="info-genre flex al-ct">
        <!-- <input type="checkbox" class="mr-1" v-on:click="pushGenre('カレー')" /> -->
        <input
          type="checkbox"
          class="mr-1"
          id="kare"
          value="ファストフード"
          v-model="genre"
        />

        <h2 for="kare" class="info-genre__content txt-s txt-bold mr-2">
          ファストフード
        </h2>
      </div>
    </div>
    <div class="info-input flex al-ct mt-1">
      <h2 class="info-title mid-title mr-1">定休日</h2>
      <div class="info-genre flex al-ct">
        <!-- <input type="checkbox" class="mr-1" v-on:click="pushGenre('定食')" /> -->
        <input type="checkbox" class="mr-1" value="月" v-model="holiday" />
        <h2 for="teisyoku" class="info-genre__content txt-s txt-bold mr-2">
          月
        </h2>
      </div>
      <div class="info-genre flex al-ct">
        <!-- <input type="checkbox" class="mr-1" v-on:click="pushGenre('麺類')" /> -->
        <input type="checkbox" class="mr-1" value="火" v-model="holiday" />
        <h2 for="menrui" class="info-genre__content txt-s txt-bold mr-2">火</h2>
      </div>
      <div class="info-genre flex al-ct">
        <!-- <input type="checkbox" class="mr-1" v-on:click="pushGenre('カレー')" /> -->
        <input type="checkbox" class="mr-1" value="水" v-model="holiday" />
        <h2 for="kare" class="info-genre__content txt-s txt-bold mr-2">水</h2>
      </div>
      <div class="info-genre flex al-ct">
        <!-- <input type="checkbox" class="mr-1" v-on:click="pushGenre('カレー')" /> -->
        <input type="checkbox" class="mr-1" value="木" v-model="holiday" />
        <h2 for="kare" class="info-genre__content txt-s txt-bold mr-2">木</h2>
      </div>
      <div class="info-genre flex al-ct">
        <!-- <input type="checkbox" class="mr-1" v-on:click="pushGenre('カレー')" /> -->
        <input type="checkbox" class="mr-1" value="金" v-model="holiday" />
        <h2 for="kare" class="info-genre__content txt-s txt-bold mr-2">金</h2>
      </div>
      <div class="info-genre flex al-ct">
        <!-- <input type="checkbox" class="mr-1" v-on:click="pushGenre('カレー')" /> -->
        <input type="checkbox" class="mr-1" value="土" v-model="holiday" />
        <h2 for="kare" class="info-genre__content txt-s txt-bold mr-2">土</h2>
      </div>
      <div class="info-genre flex al-ct">
        <!-- <input type="checkbox" class="mr-1" v-on:click="pushGenre('カレー')" /> -->
        <input type="checkbox" class="mr-1" value="日" v-model="holiday" />
        <h2 for="kare" class="info-genre__content txt-s txt-bold mr-2">日</h2>
      </div>
    </div>
    <div class="info-input flex al-ct mt-1">
      <h2 class="info-title mid-title mr-1">営業時間</h2>
      <div class="info-time mt-06 flex jc-sb al-ct">
        <div class="wrap flex al-ct">
          <input
            type="text"
            class="info-time__input"
            placeholder="9"
            v-model="open"
          />
          <span class="ml-1 mr-1">:</span>
          <input type="text" class="info-time__input" placeholder="00" />
        </div>
        <span class="ml-1 mr-1">~</span>
        <div class="wrap flex al-ct">
          <input
            type="text"
            class="info-time__input"
            placeholder="10"
            v-model="close"
          />
          <span class="ml-1 mr-1">:</span>
          <input type="text" class="info-time__input" placeholder="00" />
        </div>
      </div>
    </div>
    <div class="info-input flex al-ct mt-1">
      <h2 class="info-title mid-title mr-1">デリバリー</h2>
      <div
        class="btn btn-m btn-nav mr-1"
        @click.prevent="changeDelivery(1)"
        v-bind:class="{ btn__black: delivery == 1 }"
      >
        あり
      </div>
      <div
        class="btn btn-m btn-nav mr-1"
        @click.prevent="changeDelivery(2)"
        v-bind:class="{ btn__black: delivery == 2 }"
      >
        なし
      </div>
    </div>

    <div class="info-input flex al-ct mt-1">
      <h2 class="info-title mid-title mr-1">URL</h2>
      <input
        type="text"
        class="input info-input__input"
        placeholder="URL"
        v-model="url"
      />
    </div>

    <div class="wrap flex jc-sb mt-2 txt-center">
      <div class="btn btn-m btn-nav mr-1 w-48">リセット</div>
      <div class="btn btn-m btn__black mr-1 w-48" @click.prevent="saveInfo()">
        登録
      </div>
    </div>
  </div>
</template>

<script>
import ImageComponent from "./Image.vue";
// import { bus } from "../app";

export default {
  props: ["info_id"],

  components: {
    ImageComponent,
  },
  data() {
    return {
      id: "",
      edit: 1,
      info: "",
      delivery: 1,
      name: "",
      address: "",
      number: "",
      genre: [],
      check_genre: false,
      open: "",
      close: "",
      min_money: "",
      max_money: "",
      holiday: [],
      url: "",
      // pic: "",
      // resize_img: "",
      // image: "",
      // img_name: "",
      message: [],
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
    async changeDelivery(num) {
      this.delivery = num;
    },
    async pushGenre(genre) {
      genre.forEach((el) => {
        this.genre.push(el);
      });
    },
    async saveInfo() {
      this.validation();
      if (this.check == true) {
        axios
          .post("create_info", {
            name: this.name,
            delivery: this.delivery,
            address: this.address,
            number: this.number,
            genre: this.genre,
            holiday: this.holiday,
            open: this.open,
            close: this.close,
            min_money: this.min_money,
            max_money: this.max_money,
            url: this.url,
          })
          .then((response) => {
            this.message.push(response.data.message);
            this.clear();
          });
      }
    },
    async validation() {
      this.check = true;
      if (this.name == "") {
        this.message.push("店舗名を入力してください！");
        this.clear();
        this.check = false;
      }
      if (this.address == "") {
        this.message.push("住所を入力してください！");
        this.clear();
        this.check = false;
      }
      if (this.number == "") {
        this.message.push("電話番号を入力してください！");
        this.clear();
        this.check = false;
      }
      if (this.open == "") {
        this.message.push("開始営業時間を入力してください！");
        this.clear();
        this.check = false;
      }
      if (this.close == "") {
        this.message.push("終了営業時間を入力してください！");
        this.clear();
        this.check = false;
      }
      if (this.url == "") {
        this.message.push("URLを入力してください！");
        this.clear();
        this.check = false;
      }
    },
  },
  mounted() {},
  created() {},
};
</script>
