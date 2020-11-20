<template>
  <section>
    <div>
      <h1>New questionnaire</h1>
      <form @submit.prevent="post">
        <div>
          <label for="abstract">abstract: </label>
          <input id="abstract" v-model="abstract" type="text" name="abstract" />
        </div>
        <div class="formDetail">
          <div v-for="(question, idx) in this.order_questions" :key="idx">
            <label
              >設問{{ idx + 1 }}
              <div v-if="question.type == 'ChoiceQuestion'">
                <div>
                  <input
                    class="ChoiceText"
                    v-model="question['text']"
                    type="text"
                    placeholder="質問文"
                  />
                  <div v-for="(option, key) in question['options']" :key="key">
                    <label>
                      選択肢{{ key + 1 }}
                      <input
                        class="OptionText"
                        v-model="option['text']"
                        type="text"
                        placeholder="text"
                      />
                      <input
                        class="OptionImageURL"
                        v-model="option['image_url']"
                        type="text"
                        placeholder="URL"
                      />
                    </label>
                  </div>
                </div>
                <div>
                  <button type="button" v-on:click="addChoiceOption(idx)">
                    +Option
                  </button>
                </div>
              </div>
              <div v-else-if="question.type == 'FreeQuestion'">
                <label for="FreeText">
                  質問内容:
                  <input
                    class="FreeText"
                    type="text"
                    v-model="question['text']"
                  />
                </label>
              </div>
            </label>
          </div>
        </div>

        <div class="addForm">
          <button type="button" v-on:click="addChoiceQuestion">
            +ChoiceQuestion
          </button>
          <button type="button" v-on:click="addFreeQuestion">
            +FreeQuestion
          </button>
        </div>
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
    addChoiceQuestion: function (event) {
      const additionalChoiceQuestion = {
        type: "ChoiceQuestion",
        text: "",
        options: [],
      };
      this.order_questions.push(additionalChoiceQuestion);
    },
    addChoiceOption: function (idx) {
      const additionalOption = {
        text: "",
        image_url: "",
      };
      this.order_questions[idx]["options"].push(additionalOption);
    },
    addFreeQuestion: function (event) {
      const additionalFreeQuestion = {
        type: "FreeQuestion",
        text: "",
      };
      this.order_questions.push(additionalFreeQuestion);
    },
    post() {
      this.$axios
        .post("/api/questionnaires", {
          questionnaire: {
            abstract: this.abstract,
            order_questions: this.order_questions,
          },
        })
        .then((res) => {
          this.$router.push(`/questionnaires/${res.data.id}`);
        });
    },
  },
};
</script>