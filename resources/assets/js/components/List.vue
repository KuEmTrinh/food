<template>
  <div class="home-list">
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
    <div class="toggle" v-if="toggle == true">
      <div class="wrap flex jc-sb center w-80">
        <div class="btn btn-m btn-nav flx-1" @click.prevent="hideToggle()">
          キャンセル
        </div>
        <div
          class="btn btn-m btn-nav flx-1"
          @click.prevent="deleteThisUser(delete_id)"
        >
          削除
        </div>
      </div>
    </div>
    <div class="show mbt-2" v-if="show_info == true">
      <div class="show-close" @click.prevent="hidden()">
        <box-icon name="x-circle" size="md"></box-icon>
      </div>
      <div class="wrap flex jc-sb">
        <div class="show-info flex-1">
          <h2 class="show-title txt-s txt-bold">店名</h2>
          <h3 class="show-content w-inherit txt-center">{{ info.name }}</h3>
        </div>
        <div class="show-info flex-1">
          <h2 class="show-title txt-s txt-bold">電話番号</h2>
          <h3 class="show-content w-inherit txt-center">{{ info.number }}</h3>
        </div>
      </div>

      <div class="show-info">
        <h2 class="show-title txt-s txt-bold">住所</h2>
        <h3 class="show-content w-100 txt-center">
          {{ info.address }}
        </h3>
      </div>

      <div class="show-info">
        <h2 class="show-title txt-s txt-bold">ジャンル</h2>
        <div class="home-list-infomation__taglist flex">
          <h2 class="tag-s mr-1" v-for="gen in info.genre" :key="gen.id">
            {{ gen }}
          </h2>
        </div>
      </div>

      <div class="show-info">
        <h2 class="show-title txt-s txt-bold">写真</h2>

        <div class="wrap flex flx-wrap">
          <div
            class="show-img mr-1"
            v-for="image in info.images"
            :key="image.id"
          >
            <img class="show-image" :src="'uploads/' + image.url" alt="" />
          </div>
        </div>
      </div>
      <div class="wrap flex jc-sb">
        <div class="show-info flex-2">
          <h2 class="show-title txt-s txt-bold">営業時間</h2>
          <div class="show-time flex al-ct">
            <div class="show-time__start">{{ info.open }}時</div>
            <span class="txt-bold ml-1 mr-1">~</span>
            <div class="show-time__close">{{ info.close }}時</div>
          </div>
        </div>
        <div class="show-info flex-2">
          <h2 class="show-title txt-s txt-bold">目安金額</h2>
          <div class="show-time flex al-ct">
            <div class="show-time__start">{{ info.min_money }}</div>
            <span class="txt-bold ml-1 mr-1">~</span>
            <div class="show-time__close">{{ info.max_money }}</div>
          </div>
        </div>
        <div class="show-info flex-1">
          <h2 class="show-title txt-s txt-bold">デリバリー</h2>
          <div class="show-time flex al-ct">
            <div class="show-time__start" v-if="info.delivery == 1">あり</div>
            <div class="show-time__start" v-if="info.delivery == 2">なし</div>
          </div>
        </div>
      </div>
      <div class="show-info">
        <h2 class="show-title txt-s txt-bold">URL</h2>
        <h3 class="show-content w-100 txt-center">{{ info.url }}</h3>
      </div>
      <div class="wrap flex jc-sb">
        <div class="show-info flex-1">
          <h2 class="show-title txt-s txt-bold">評価店</h2>
          <div class="star flex al-ct">
            <star-rating
              @rating-selected="setRating"
              v-bind:star-size="25"
              v-bind:show-rating="false"
            />
            <h2 class="show-title txt-bold ml-1">{{ rating }}点</h2>
          </div>
        </div>
        <div class="show-info show-relative flex-3">
          <h2 class="show-title txt-s txt-bold">コメント入力</h2>
          <box-icon
            name="comment-add"
            class="show-comment"
            size="md"
            @click.prevent="comment(info.id), saveStar(info.id)"
          ></box-icon>
          <input
            type="text"
            class="input info-input__input"
            placeholder="店舗名"
            v-model="desc"
          />
        </div>
      </div>
      <div class="show-info show-cmt">
        <!-- <h2 class="show-title txt-s txt-bold txt-right">コメントリスト</h2> -->
        <div
          class="show-cmt__comment txt-right mt-1p5"
          v-for="comment in comments"
          :key="comment.id"
        >
          <h2 class="txt-s txt-bold mt-1">
            <span class="color-grey">({{ comment.created_at }})</span>
            {{ comment.name }}
          </h2>
          <div class="mt-05">
            <span class="show-cmt__desc txt-s mt-1">{{ comment.desc }}</span>
          </div>
        </div>
      </div>
    </div>
    <div class="home-box">
      <h2 class="mid-title">デリバリー</h2>
      <div class="home-box__delivery">
        <div class="home-box__item">
          <input type="checkbox" />
          <h2>あり</h2>
        </div>
        <div class="home-box__item">
          <input type="checkbox" />
          <h2>なし</h2>
        </div>
      </div>
      <h2 class="mid-title mt-1">評価順</h2>
      <div class="home-box__sex">
        <div class="home-box__item">
          <input type="radio" />
          <h2>指定なし</h2>
        </div>
        <div class="home-box__item">
          <input type="radio" />
          <h2>女性</h2>
        </div>
        <div class="home-box__item">
          <input type="radio" />
          <h2>男性</h2>
        </div>
        <div class="home-box__item">
          <input type="radio" />
          <h2>男性</h2>
        </div>
        <div class="home-box__item">
          <input type="radio" />
          <h2>男性</h2>
        </div>
      </div>
      <h2 class="mid-title mt-1">目安金額</h2>
      <div class="home-box__money">
        <div class="mt-06 flex jc-sb al-ct">
          <div class="wrap">
            <input type="text" class="home-money__input" placeholder="から" />
            <span>~</span>
            <input type="text" class="home-money__input" placeholder="まで" />
          </div>
          <div class="wrap flex al-ct">
            <h2 class="txt-s txt-bold">検索</h2>
            <box-icon type="solid" name="right-arrow-alt"></box-icon>
            <box-icon
              name="search-alt-2"
              animation="tada"
              class="home-box__search"
              size="lg"
            ></box-icon>
          </div>
        </div>
      </div>
    </div>
    <input type="text" class="home-box__input mt-2" placeholder="検索..." />
    <h1 class="title mt-2">東京の店</h1>
    <div class="home-list__categories flex mt-2 jc-sb">
      <div class="home-list__category w-32">
        <h2
          class="btn-m btn-nav txt-center"
          :class="{ btn__black: sort_item == 'ranking' }"
          @click.prevent="shortByStar(), activeSort('ranking')"
        >
          ランキング
        </h2>
      </div>
      <div class="home-list__category w-32">
        <h2
          class="btn-m btn-nav txt-center"
          :class="{ btn__black: sort_item == 'comment' }"
          @click.prevent="shortByComment(), activeSort('comment')"
        >
          コメント
        </h2>
      </div>
      <div class="home-list__category w-32">
        <h2
          class="btn-m btn-nav txt-center"
          :class="{ btn__black: sort_item == 'money' }"
          @click.prevent="shortByMoney(), activeSort('money')"
        >
          金額
        </h2>
      </div>
    </div>
    <div class="home-list-infomations">
      <div
        class="home-list-infomation flex mt-1 jc-sb"
        v-for="(item, index) in list"
        :key="item.id"
      >
        <div class="home-list-infomation__remove" v-if="role == 2">
          <i class="bx bx-user-x" @click.prevent="openToggle(index)"></i>
        </div>
        <div class="home-list-infomation__image flex flex-1">
          <!-- <img class="info-image" src="#" alt="" /> -->
          <img
            class="info-image"
            :src="'uploads/' + item.images[0].url"
            alt=""
          />
        </div>
        <div class="home-list-infomation__info flex-3 ml-1 flex flx-d-c jc-sb">
          <div class="home-list-infomation__name">
            <h2 class="mid-title">{{ item.name }}</h2>
          </div>
          <div class="home-list-infomation__taglist flex">
            <h2 class="tag-s mr-1" v-for="gen in item.genre" :key="gen.id">
              {{ gen }}
            </h2>
            <!-- <h2 class="tag-s mr-1">金額</h2>
            <h2 class="tag-s mr-1">金額</h2> -->
          </div>
          <div class="home-list-infomation__star txt-s txt-bold">
            評価点 : {{ item.point }}
            <div class="flex al-ct">
              <star-rating
                v-model="item.point"
                v-bind:star-size="15"
                v-bind:increment="0.25"
                v-bind:read-only="true"
                v-bind:show-rating="false"
              >
              </star-rating>
              <h1 class="txt-bold txt-s ml-1">{{ item.count }} 回</h1>
            </div>
          </div>
          <div class="home-list-infomation__comment flex al-ct">
            <i class="bx bx-comment"></i>
            <h1 class="txt-bold txt-s ml-05">
              {{ item.comment_count }}
            </h1>
          </div>
        </div>
        <div
          class="
            home-list-infomation__button
            btn btn-m btn-nav
            flex
            al-ct
            txt-bold txt-s
          "
          @click.prevent="show(index)"
        >
          <h3>詳細</h3>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      rating: "",
      message: [],
      comments: [],
      list: [],
      genre: [],
      show_info: false,
      info: [],
      desc: "",
      find: 1,
      star_id: "",
      sort_clicked: false,
      sort_item: "",
      role: "",
      toggle: false,
      delete_id: "",
    };
  },
  methods: {
    async popMess() {
      this.message.pop();
    },
    async clear() {
      setTimeout(() => this.popMess(), 2000);
    },
    async setRating(rating) {
      this.rating = rating;
    },

    async getUserInfo() {
      axios.get("get_user_info").then((response) => {
        this.role = response.data.role;
      });
    },
    async getAll() {
      axios.get("get_all").then((response) => {
        response.data.forEach((el) => {
          el.genre = JSON.parse(el.genre);
        });
        this.list = response.data;
      });
    },
    async hidden() {
      this.show_info = false;
    },
    async pushGenre(genre) {
      genre.forEach((el) => {
        this.genre.push(el);
      });
    },
    async show(index) {
      this.info = this.list[index];
      this.show_info = true;
      this.getComments(this.info.id);
      this.findStar(this.info.id);
    },
    async getComments(id) {
      axios
        .get("get_comments/" + id)
        .then((response) => (this.comments = response.data));
    },
    //comment
    async comment(id) {
      if (this.rating != 0) {
        if (this.desc == "") {
          this.message.push("コメントしてください！");
          this.clear();
        } else {
          axios
            .post("create_comment", {
              info_id: id,
              desc: this.desc,
            })
            .then((response) => {
              this.message.push(response.data.message);
              this.clear();
              this.desc = "";
              this.getComments(this.info.id);
            });
        }
      } else {
        this.message.push("評価点してください！");
        this.clear();
      }
    },
    async saveStar(id) {
      if (this.find == 1) {
        axios
          .post("create_star", {
            info_id: id,
            star: this.rating,
          })
          .then((response) => {
            this.message.push(response.data.message);
            this.clear();
            this.rating = 0;
            findStar(response.data.id);
          });
      } else {
        axios
          .post("change_star", {
            star_id: this.star_id,
            info_id: id,
            star: this.rating,
          })
          .then((response) => {
            this.message.push(response.data.message);
            this.clear();
            this.rating = 0;
            findStar(response.data.id);
          });
      }
    },
    async findStar(id) {
      axios.get("find_star/" + id).then((response) => {
        const find = response.data.length;
        if (find > 0) {
          this.find = 2;
          this.star_id = response.data[0].id;
        }
      });
    },

    async shortByStar() {
      if (this.sort_clicked == false) {
        this.list.sort(function (a, b) {
          return b.point - a.point;
        });
        this.sort_clicked = true;
      } else {
        this.list.sort(function (a, b) {
          return a.point - b.point;
        });
        this.sort_clicked = false;
      }
    },
    async shortByComment() {
      if (this.sort_clicked == false) {
        this.list.sort(function (a, b) {
          return b.comment_count - a.comment_count;
        });
        this.sort_clicked = true;
      } else {
        this.list.sort(function (a, b) {
          return a.comment_count - b.comment_count;
        });
        this.sort_clicked = false;
      }
    },

    async shortByMoney() {
      if (this.sort_clicked == false) {
        this.list.sort(function (a, b) {
          return b.min_money - a.min_money;
        });
        this.sort_clicked = true;
      } else {
        this.list.sort(function (a, b) {
          return a.min_money - b.min_money;
        });
        this.sort_clicked = false;
      }
    },

    async activeSort(item) {
      this.sort_item = item;
    },

    async openToggle(index) {
      this.toggle = true;
      this.delete_id = this.list[index].id;
    },

    async hideToggle() {
      this.toggle = false;
    },
    async deleteThisUser(id) {
      console.log(id);
      axios.get("delete_info/" + id).then((response) => {
        this.message.push(response.data.message);
        this.clear();
      });
      this.hideToggle();
      this.getAll();
    },
  },
  mounted() {},
  created() {
    this.getAll();
    this.getUserInfo();
  },
};
</script>
