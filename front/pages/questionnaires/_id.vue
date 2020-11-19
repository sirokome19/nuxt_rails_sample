<template>
  <div class="container">
    <h1>
      {{ res.abstract }}
    </h1>
    <ul>
      <div v-for="question in res.order_questions" :key="question.order_num">
        <div v-if="question.choice_question">
          <h2>- {{ question.choice_question.text }}</h2>
          <ul>
            <li
              v-for="(option, key) in question.choice_question.options"
              :key="key"
            >
              {{ option.text }}
              {{ option.image_url }}
            </li>
          </ul>
        </div>
        <div v-if="question.free_question">
          <h2>- {{ question.free_question.text }}</h2>
        </div>
      </div>
    </ul>
  </div>
</template>

<script>
export default {
  async asyncData({ $axios, params }) {
    let res = await $axios.$get(`/api/questionnaires/${params.id}`);
    return { res: res };
  },
};
</script>