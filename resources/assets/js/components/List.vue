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
    <div class="edit show mbt-2" v-if="show_edit == true">
      <div class="show-close" @click.prevent="hideEdit()">
        <box-icon name="x-circle" size="md"></box-icon>
      </div>
      <div class="m-2">
        <div class="info">
          <h1 class="title">店舗情報編集</h1>
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
              v-model="info.name"
            />
          </div>
          <div class="info-input flex al-ct mt-1">
            <h2 class="info-title mid-title mr-1">住所</h2>
            <input
              type="text"
              class="input info-input__input"
              placeholder="住所"
              v-model="info.address"
            />
          </div>
          <div class="info-input flex al-ct mt-1">
            <h2 class="info-title mid-title mr-1">電話番号</h2>
            <input
              type="text"
              class="input info-input__input"
              placeholder="電話番号"
              v-model="info.number"
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
                  v-model="info.min_money"
                />
                <span>~</span>
                <input
                  type="text"
                  class="home-money__input"
                  placeholder="まで"
                  v-model="info.max_money"
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
                v-model="info.genre"
              />
              <h2
                for="teisyoku"
                class="info-genre__content txt-s txt-bold mr-2"
              >
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
                v-model="info.genre"
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
                v-model="info.genre"
              />

              <h2 for="kare" class="info-genre__content txt-s txt-bold mr-2">
                パン
              </h2>
            </div>
            <div class="info-genre flex al-ct">
              <!-- <input type="checkbox" class="mr-1" v-on:click="pushGenre('カレー')" /> -->
              <input
                type="checkbox"
                class="mr-1"
                id="kare"
                value="飲料"
                v-model="info.genre"
              />

              <h2 for="kare" class="info-genre__content txt-s txt-bold mr-2">
                飲料
              </h2>
            </div>
            <div class="info-genre flex al-ct">
              <!-- <input type="checkbox" class="mr-1" v-on:click="pushGenre('カレー')" /> -->
              <input
                type="checkbox"
                class="mr-1"
                id="kare"
                value="和食"
                v-model="info.genre"
              />

              <h2 for="kare" class="info-genre__content txt-s txt-bold mr-2">
                和食
              </h2>
            </div>
            <div class="info-genre flex al-ct">
              <!-- <input type="checkbox" class="mr-1" v-on:click="pushGenre('カレー')" /> -->
              <input
                type="checkbox"
                class="mr-1"
                id="kare"
                value="洋食"
                v-model="info.genre"
              />

              <h2 for="kare" class="info-genre__content txt-s txt-bold mr-2">
                洋食
              </h2>
            </div>
            <div class="info-genre flex al-ct">
              <!-- <input type="checkbox" class="mr-1" v-on:click="pushGenre('カレー')" /> -->
              <input
                type="checkbox"
                class="mr-1"
                id="kare"
                value="中華"
                v-model="info.genre"
              />

              <h2 for="kare" class="info-genre__content txt-s txt-bold mr-2">
                中華
              </h2>
            </div>
            <div class="info-genre flex al-ct">
              <!-- <input type="checkbox" class="mr-1" v-on:click="pushGenre('カレー')" /> -->
              <input
                type="checkbox"
                class="mr-1"
                id="kare"
                value="スイーツ"
                v-model="info.genre"
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
                v-model="info.genre"
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
              <input
                type="checkbox"
                class="mr-1"
                value="月"
                v-model="info.holiday"
              />
              <h2
                for="teisyoku"
                class="info-genre__content txt-s txt-bold mr-2"
              >
                月
              </h2>
            </div>
            <div class="info-genre flex al-ct">
              <!-- <input type="checkbox" class="mr-1" v-on:click="pushGenre('麺類')" /> -->
              <input
                type="checkbox"
                class="mr-1"
                value="火"
                v-model="info.holiday"
              />
              <h2 for="menrui" class="info-genre__content txt-s txt-bold mr-2">
                火
              </h2>
            </div>
            <div class="info-genre flex al-ct">
              <!-- <input type="checkbox" class="mr-1" v-on:click="pushGenre('カレー')" /> -->
              <input
                type="checkbox"
                class="mr-1"
                value="水"
                v-model="info.holiday"
              />
              <h2 for="kare" class="info-genre__content txt-s txt-bold mr-2">
                水
              </h2>
            </div>
            <div class="info-genre flex al-ct">
              <!-- <input type="checkbox" class="mr-1" v-on:click="pushGenre('カレー')" /> -->
              <input
                type="checkbox"
                class="mr-1"
                value="木"
                v-model="info.holiday"
              />
              <h2 for="kare" class="info-genre__content txt-s txt-bold mr-2">
                木
              </h2>
            </div>
            <div class="info-genre flex al-ct">
              <!-- <input type="checkbox" class="mr-1" v-on:click="pushGenre('カレー')" /> -->
              <input
                type="checkbox"
                class="mr-1"
                value="金"
                v-model="info.holiday"
              />
              <h2 for="kare" class="info-genre__content txt-s txt-bold mr-2">
                金
              </h2>
            </div>
            <div class="info-genre flex al-ct">
              <!-- <input type="checkbox" class="mr-1" v-on:click="pushGenre('カレー')" /> -->
              <input
                type="checkbox"
                class="mr-1"
                value="土"
                v-model="info.holiday"
              />
              <h2 for="kare" class="info-genre__content txt-s txt-bold mr-2">
                土
              </h2>
            </div>
            <div class="info-genre flex al-ct">
              <!-- <input type="checkbox" class="mr-1" v-on:click="pushGenre('カレー')" /> -->
              <input
                type="checkbox"
                class="mr-1"
                value="日"
                v-model="info.holiday"
              />
              <h2 for="kare" class="info-genre__content txt-s txt-bold mr-2">
                日
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
                  v-model="info.open"
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
                  v-model="info.close"
                />
                <span class="ml-1 mr-1">:</span>
                <input type="text" class="info-time__input" placeholder="00" />
              </div>
            </div>
          </div>
          <div class="info-input flex al-ct mt-1">
            <h2 class="info-title mid-title mr-1">写真追加リスト</h2>
            <div
              class="show-img mr-1"
              v-for="image in info.images"
              :key="image.id"
            >
              <img class="show-image" :src="'uploads/' + image.url" alt="" />
            </div>
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
              v-bind:class="{ btn__black: info.delivery == 1 }"
            >
              あり
            </div>
            <div
              class="btn btn-m btn-nav mr-1"
              @click.prevent="changeDelivery(2)"
              v-bind:class="{ btn__black: info.delivery == 2 }"
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
              v-model="info.url"
            />
          </div>

          <div class="wrap flex jc-sb mt-2 txt-center">
            <div class="btn btn-m btn-nav mr-1 w-48">リセット</div>
            <div
              class="btn btn-m btn__black mr-1 w-48"
              @click.prevent="changeInfo()"
            >
              編集
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="toggle" v-if="toggle == true">
      <div class="wrap flex jc-sb center w-80">
        <div
          class="btn btn-m btn__black txt-bold flx-1"
          @click.prevent="hideToggle()"
        >
          キャンセル
        </div>
        <div
          class="btn btn-m btn__black txt-bold flx-1"
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
        <div class="home-list-infomation__taglist flex flx-wrap">
          <h2 class="tag-s mr-1" v-for="gen in info.genre" :key="gen.id">
            {{ gen }}
          </h2>
        </div>
      </div>

      <div class="show-info">
        <h2 class="show-title txt-s txt-bold">定休日</h2>
        <div class="home-list-infomation__taglist flex flx-wrap">
          <h2 class="tag-s mr-1" v-for="day in info.holiday" :key="day.id">
            {{ day }}
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
      <div class="wrap flex jc-sb" v-if="info.user_id != user_id">
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
          <input
            type="checkbox"
            value="1"
            v-model="filter_delivery"
            @change="filterDelivery()"
          />
          <h2>あり</h2>
        </div>
        <div class="home-box__item">
          <input
            type="checkbox"
            value="2"
            v-model="filter_delivery"
            @change="filterDelivery()"
          />
          <h2>なし</h2>
        </div>
      </div>
      <h2 class="mid-title mt-1">ジャンル</h2>
      <div class="home-box__sex">
        <div class="home-box__item">
          <input
            type="checkbox"
            value="定食"
            v-model="filter_genre"
            @change="filterGenre()"
          />
          <h2>定食</h2>
        </div>
        <div class="home-box__item">
          <input
            type="checkbox"
            value="麺類"
            v-model="filter_genre"
            @change="filterGenre()"
          />
          <h2>麺類</h2>
        </div>
        <div class="home-box__item">
          <input
            type="checkbox"
            value="パン"
            v-model="filter_genre"
            @change="filterGenre()"
          />
          <h2>パン</h2>
        </div>
        <div class="home-box__item">
          <input
            type="checkbox"
            value="飲料"
            v-model="filter_genre"
            @change="filterGenre()"
          />
          <h2>飲料</h2>
        </div>
        <div class="home-box__item">
          <input
            type="checkbox"
            value="和食"
            v-model="filter_genre"
            @change="filterGenre()"
          />
          <h2>和食</h2>
        </div>
        <div class="home-box__item">
          <input
            type="checkbox"
            value="洋食"
            v-model="filter_genre"
            @change="filterGenre()"
          />
          <h2>洋食</h2>
        </div>
        <div class="home-box__item">
          <input
            type="checkbox"
            value="中華"
            v-model="filter_genre"
            @change="filterGenre()"
          />
          <h2>中華</h2>
        </div>
        <div class="home-box__item">
          <input
            type="checkbox"
            value="スイーツ"
            v-model="filter_genre"
            @change="filterGenre()"
          />
          <h2>スイーツ</h2>
        </div>
        <div class="home-box__item">
          <input
            type="checkbox"
            value="ファストフード"
            v-model="filter_genre"
            @change="filterGenre()"
          />
          <h2>ファストフード</h2>
        </div>
      </div>
      <h2 class="mid-title mt-1">目安金額</h2>
      <div class="home-box__money">
        <div class="mt-06 flex jc-sb al-ct">
          <div class="wrap">
            <input
              type="text"
              class="home-money__input"
              placeholder="から"
              v-model="filter_min"
              @change="filterMoney()"
            />
            <span>~</span>
            <input
              type="text"
              class="home-money__input"
              placeholder="まで"
              v-model="filter_max"
              @change="filterMoney()"
            />
          </div>
        </div>
      </div>
    </div>
    <input
      type="text"
      class="home-box__input mt-2"
      v-model="searchQuery"
      placeholder="店舗名..."
    />
    <h1 class="title mt-2">Food Share Service</h1>
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
        v-for="(item, index) in resultQuery"
        :key="item.id"
      >
        <div class="home-list-infomation__remove" v-if="role == 2">
          <i class="bx bx-user-x" @click.prevent="openToggle(index)"></i>
        </div>
        <div class="home-list-infomation__image flex flex-1">
          <!-- <img class="info-image" src="#" alt="" /> -->
          <img
            class="info-image"
            v-if="item.images[0] != null"
            :src="'uploads/' + item.images[0].url"
            alt=""
          />
        </div>
        <div class="home-list-infomation__info flex-3 ml-1 flex flx-d-c jc-sb">
          <div class="home-list-infomation__name flex al-ct">
            <h2 class="mid-title">{{ item.name }}</h2>
            <h2 class="ml-1 txt-ss txt-bold label" v-if="item.delivery == 1">
              デリバリー<i class="bx bx-check delivery__true ml-1"></i>
            </h2>
            <h2 class="ml-1 txt-ss txt-bold label" v-if="item.delivery == 2">
              デリバリー<i class="bx bx-x delivery__false ml-1"></i>
            </h2>
          </div>
          <div class="home-list-infomation__taglist flex flx-wrap">
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
        <div class="wrap flex flx-d-c">
          <div
            class="
              home-list-infomation__button
              btn-m btn-nav
              flex
              al-ct
              txt-bold txt-s
              mr-1
              h-50
            "
            v-if="item.user_id == user_id"
            @click.prevent="showEdit(index)"
          >
            <h3>編集</h3>
          </div>
          <div
            class="
              home-list-infomation__button2
              btn-m btn-nav
              flex
              al-ct
              txt-bold txt-s
              mr-1
              h-50
            "
            v-if="item.user_id == user_id"
            @click.prevent="openToggle(index)"
          >
            <h3>削除</h3>
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
      searchQuery: null,
      filter_delivery: [],
      filter_genre: [],
      filter_max: "",
      filter_min: "",
      user_id: "",
      rating: "",
      message: [],
      comments: [],
      list: [],
      genre: [],
      show_info: false,
      show_edit: false,
      info: [],
      desc: "",
      find: 1,
      star_id: "",
      sort_clicked: false,
      sort_item: "",
      role: "",
      toggle: false,
      delete_id: "",
      pic: "",
      resize_img: "",
      image: "",
      img_name: "",
      new_array: [],
      curr_list: [],
      genre_array: [],
      money_array: [],
      check_this: false,
      check: false,
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
        this.user_id = response.data.id;
      });
    },
    async getAll() {
      axios.get("get_all").then((response) => {
        response.data.forEach((el) => {
          el.genre = JSON.parse(el.genre);
          el.holiday = JSON.parse(el.holiday);
        });
        this.list = response.data;
        this.curr_list = response.data;
      });
    },
    async hidden() {
      this.show_info = false;
      this.getAll();
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

    //show edit
    async showEdit(index) {
      this.show_edit = true;
      this.info = this.list[index];
      console.log(index);
    },
    async hideEdit() {
      this.show_edit = false;
      this.getAll();
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
      formData.append("info_id", this.info.id);
      formData.append("img_name", this.img_name);
      axios.post("save_image", formData).then((response) => {
        // this.getInfo();
      });

      this.image = "";
      this.resize_img = "";
      this.pic = "";
      this.img_name = "";

      location.reload();
    },
    async changeInfo() {
      this.validation();
      if (this.check == true) {
        axios
          .post("change_info", {
            id: this.info.id,
            name: this.info.name,
            delivery: this.info.delivery,
            address: this.info.address,
            number: this.info.number,
            genre: this.info.genre,
            holiday: this.info.holiday,
            open: this.info.open,
            close: this.info.close,
            min_money: this.info.min_money,
            max_money: this.info.max_money,
            url: this.info.url,
          })
          .then((response) => {
            this.message.push(response.data.message);
            this.clear();
            this.hideEdit();
            this.getAll();
          })
          .catch((error) => console.log(error));
      }
    },

    async filterDelivery() {
      if (this.new_array.length != 0) {
        this.new_array = this.new_array;
      } else {
        this.new_array = this.curr_list;
      }
      if (this.filter_delivery.length > 0) {
        this.list = this.curr_list;
        (this.new_array = []),
          this.filter_delivery.forEach((el) => {
            const filtered_array = this.list.filter(
              (item) => item.delivery == el
            );
            filtered_array.forEach((el_item) => {
              this.new_array.push(el_item);
            });
          });
        this.list = this.new_array;
      } else {
        this.list = this.curr_list;
        if (this.filter_genre.length > 0) {
          this.filterGenre();
        }
      }
    },

    async filterGenre() {
      this.genre_array = [];
      if (this.filter_genre.length > 0) {
        if (this.new_array.length == 0) {
          this.new_array = this.list;
        }
        this.new_array.forEach((el) => {
          const genre_list = el.genre;
          console.log(genre_list);
          this.filter_genre.forEach((genre) => {
            genre_list.forEach((gen_name) => {
              if (gen_name == genre) {
                this.check_this = true;
              }
            });
          });
          if (this.check_this == true) {
            // console.log("have this!");
            this.genre_array.push(el);
            this.check_this = false;
          } else {
            this.check_this = false;
          }
        });
        this.list = this.genre_array;
      } else {
        this.list = this.curr_list;
      }
    },

    async filterMoney() {
      if (this.new_array.length != 0) {
        this.new_array = this.new_array;
      } else {
        this.new_array = this.curr_list;
      }
      this.money_array = [];
      if (this.filter_min == "" && this.filter_max == "") {
        this.money_array = this.list;
        this.filterDelivery();
        this.filterGenre();
      }
      if (this.filter_min != "" && this.filter_max != "") {
        if (this.filter_min > this.filter_max) {
          this.message.push("目安金額正しくない！");
          this.clear();
        } else {
          this.list.forEach((el) => {
            if (
              this.filter_min >= el.min_money &&
              this.filter_max <= el.max_money
            ) {
              this.money_array.push(el);
            }
          });
          this.list = this.money_array;
        }
      }
    },

    async validation() {
      this.check = true;
      if (this.info.name == "") {
        this.message.push("店舗名を入力してください！");
        this.clear();
        this.check = false;
      }
      if (this.info.address == "") {
        this.message.push("住所を入力してください！");
        this.clear();
        this.check = false;
      }
      if (this.info.number == "") {
        this.message.push("電話番号を入力してください！");
        this.clear();
        this.check = false;
      }
      if (this.info.open == "") {
        this.message.push("開始営業時間を入力してください！");
        this.clear();
        this.check = false;
      }
      if (this.info.close == "") {
        this.message.push("終了営業時間を入力してください！");
        this.clear();
        this.check = false;
      }
      if (this.info.url == "") {
        this.message.push("URLを入力してください！");
        this.clear();
        this.check = false;
      }
    },
  },
  mounted() {},
  computed: {
    resultQuery() {
      if (this.searchQuery) {
        return this.list.filter((item) => {
          return this.searchQuery
            .toLowerCase()
            .split(" ")
            .every((v) => item.name.toLowerCase().includes(v));
        });
      } else {
        return this.list;
      }
    },
  },
  watch: {
    resultQuery() {
      console.log("resultQuery changed");
    },
  },
  created() {
    this.getAll();
    this.getUserInfo();
  },
};
</script>
