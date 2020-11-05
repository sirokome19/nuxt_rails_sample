<template>
  <section>
    <div>
      <h1>New questionnaire</h1>
      <form @submit.prevent="post">
        <label for="abstract">abstract: </label>
        <input id="abstract" v-model="abstract" type="text" name="abstract" />
        <button type="submit">submit</button>
      </form>
    </div>
  </section>
</template>

<script>
export default {
  data() {
    return {
      abstract: "",
      order_questions: [],
    };
  },
  methods: {
    post() {
      this.$axios
        .post("/api/questionnaires", {
          questionnaire: {
            abstract: this.abstract,
            order_questions: [
              {
                type: "ChoiceQuestion",
                options: [
                  {
                    text: "option1",
                    image_url: "hoge.png",
                  },
                  {
                    text: "option2",
                    image_url: "fuga.png",
                  },
                ],
              },
              {
                type: "FreeQuestion",
                text: "free_hoge",
              },
            ],
          },
        })
        .then((res) => {
          this.$router.push(`${res.data.id}`);
        });
    },
  },
};
</script>