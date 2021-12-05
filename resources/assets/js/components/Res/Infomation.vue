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
    <div class="info-input flex al-ct mt-1">
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
          value="カレー"
          v-model="genre"
        />

        <h2 for="kare" class="info-genre__content txt-s txt-bold mr-2">
          カレー
        </h2>
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
      <h2 class="info-title mid-title mr-1">写真追加リスト</h2>
      <image-component :info_id="info_id" />
    </div>
    <div class="info-input flex al-ct mt-1">
      <h2 class="info-title mid-title mr-1">写真</h2>
      <input type="file" class="info-image" @change="imageLoad" />
      <div class="wrap flex flx-d-c al-ct ml-2">
        <input
          type="text"
          class="home-money__input"
          placeholder="写真名"
          v-model="img_name"
        />
        <box-icon name="upload" @click.prevent="saveImage()"></box-icon>
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
      <div
        class="btn btn-m btn__black mr-1 w-48"
        @click.prevent="saveInfo()"
        v-if="edit == 1"
      >
        登録
      </div>
      <div
        class="btn btn-m btn__black mr-1 w-48"
        @click.prevent="changeInfo()"
        v-if="edit == 2"
      >
        編集
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
      url: "",
      pic: "",
      resize_img: "",
      image: "",
      img_name: "",
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
    async changeDelivery(num) {
      this.delivery = num;
    },
    async pushGenre(genre) {
      genre.forEach((el) => {
        this.genre.push(el);
      });
    },
    async saveInfo() {
      axios
        .post("create_info", {
          name: this.name,
          delivery: this.delivery,
          address: this.address,
          number: this.number,
          genre: this.genre,
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
    },
    async changeInfo() {
      axios
        .post("change_info", {
          id: this.id,
          name: this.name,
          delivery: this.delivery,
          address: this.address,
          number: this.number,
          genre: this.genre,
          open: this.open,
          close: this.close,
          min_money: this.min_money,
          max_money: this.max_money,
          url: this.url,
        })
        .then((response) => {
          this.message.push(response.data.message);
          this.clear();
        })
        .catch((error) => console.log(error));
    },
    async getInfo() {
      axios.get("get_info").then((response) => {
        this.info = response.data;
        this.id = this.info[0].id;
        this.name = this.info[0].name;
        this.delivery = this.info[0].delivery;
        this.address = this.info[0].address;
        this.number = this.info[0].number;
        this.open = this.info[0].open;
        this.close = this.info[0].close;
        this.pushGenre(JSON.parse(this.info[0].genre));
        this.min_money = this.info[0].min_money;
        this.max_money = this.info[0].max_money;
        this.url = this.info[0].url;
        this.edit = 2;
      });
    },
    async imageLoad(e) {
      this.image = e.target.files[0];
      const file = e.target.files[0];
      // this.pic = URL.createObjectURL(file);

      const dataURItoBlob = (dataURI) => {
        const bytes =
          dataURI.split(",")[0].indexOf("base64") >= 0
            ? atob(dataURI.split(",")[1])
            : unescape(dataURI.split(",")[1]);
        const mime = dataURI.split(",")[0].split(":")[1].split(";")[0];
        const max = bytes.length;
        const ia = new Uint8Array(max);
        for (let i = 0; i < max; i += 1) ia[i] = bytes.charCodeAt(i);
        return new Blob([ia], { type: mime });
      };

      const resizeImage = ({ file, maxSize }) => {
        const reader = new FileReader();
        const image = new Image();
        const canvas = document.createElement("canvas");

        const resize = () => {
          let { width, height } = image;

          if (width > height) {
            if (width > maxSize) {
              height *= maxSize / width;
              width = maxSize;
            }
          } else if (height > maxSize) {
            width *= maxSize / height;
            height = maxSize;
          }

          canvas.width = width;
          canvas.height = height;
          canvas.getContext("2d").drawImage(image, 0, 0, width, height);
          const dataUrl = canvas.toDataURL("image/jpeg");

          return dataURItoBlob(dataUrl);
        };

        return new Promise((ok, no) => {
          if (!file.type.match(/image.*/)) {
            no(new Error("Not an image"));
            return;
          }

          reader.onload = (readerEvent) => {
            image.onload = () => ok(resize());
            image.src = readerEvent.target.result;
          };
          reader.readAsDataURL(file);
        });
      };

      resizeImage({ file: file, maxSize: 900 })
        .then((resizedImage) => {
          console.log(resizedImage);
          this.pic = URL.createObjectURL(resizedImage);
          this.resize_img = resizedImage;
        })
        .catch((err) => {
          console.error(err);
        });
    },
    saveImage() {
      const formData = new FormData();
      formData.append("image", this.resize_img);
      formData.append("info_id", this.info_id);
      formData.append("img_name", this.img_name);
      axios.post("save_image", formData).then((response) => {
        this.getInfo();
      });

      this.image = "";
      this.resize_img = "";
      this.pic = "";
      this.img_name = "";

      location.reload();
    },
  },
  mounted() {},
  created() {
    this.getInfo();
  },
};
</script>
