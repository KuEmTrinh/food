<template>
  <div>
    <div class="images flex flx-wrap">
      <div class="image mr-1" v-for="image in images" :key="image.id">
        <img class="info-image" :src="'uploads/' + image.url" alt="" />
        <h2 class="txt-bold txt-s mt-1 txt-center">{{ image.name }}</h2>
      </div>
    </div>
  </div>
</template>

<script>
// import { bus } from "../app";

export default {
  props: ["info_id"],
  data() {
    return {
      images: [],
    };
  },
  methods: {
    async getImages(info_id) {
      axios.get("get_images/" + info_id).then((response) => {
        this.images = response.data;
      });
    },
  },
  mounted() {},
  created() {
    this.getImages(this.info_id);

    // bus.$on("loadImage", (id) => {
    //   setTimeout(() => this.getImages(id), 1000);
    // });
  },
};
</script>
