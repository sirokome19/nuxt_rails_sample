<template>
  <div class="container">
    <h1>
      {{ abstract }}
    </h1>
    <form @submit.prevent="post">
      <ul>
        <div
          v-for="(question, question_num) in order_questions"
          :key="question_num"
        >
          <div v-if="question.choice_question">
            <h2>{{ question.choice_question.text }}</h2>

            <ul style="list-style: none">
              <li
                v-for="(option, key) in question.choice_question.options"
                :key="key"
              >
                <div class="option">
                  <input
                    type="radio"
                    :value="option.id"
                    v-model="order_answers[question_num].option_id"
                  />{{ option.text }}
                  <img :src="option.image_url" />
                </div>
              </li>
            </ul>
          </div>
          <div v-if="question.free_question">
            <h2>{{ question.free_question.text }}</h2>
            <input
              class="freequestion"
              v-model="order_answers[question_num].text"
              type="text"
              name="freequestion"
            />
          </div>
        </div>
      </ul>
      <button type="submit">submit</button>
    </form>
  </div>
</template>

<script>
export default {
  data() {
    return {};
  },
  async asyncData({ $axios, params }) {
    const res = await $axios.$get(`/api/questionnaires/${params.id}`);
    const order_questions = res.order_questions;
    let order_answers = order_questions.map((x) => {
      if (x.hasOwnProperty("choice_question")) {
        return { type: "ChoiceAnswer", option_id: null };
      } else if (x.hasOwnProperty("free_question")) {
        return {
          type: "FreeAnswer",
          free_question_id: x.free_question.id,
          text: "",
        };
      }
    });

    return {
      questionnaire_id: params.id,
      abstract: res.abstract,
      order_questions: order_questions,
      order_answers: order_answers,
    };
  },
  methods: {
    post() {
      this.$axios
        .post("/api/answer_sheets", {
          answer_sheet: {
            user_id: 5, // 後でログイン情報からとってくる
            questionnaire_id: this.questionnaire_id,
            order_answers: this.order_answers,
          },
        })
        .then(() => {
          this.$router.push("/answer_sheets");
        });
    },
  },
};
</script>