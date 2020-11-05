<template>
  <div class="container">
    <h1>
      {{ res.abstract }}
    </h1>
    <ul>
      <li v-for="question in res.order_questions" :key="question.order_num">
        <div v-if="question.choice_question">
          <div
            v-for="option in question.choice_question.options"
            :key="option.text"
          >
            {{ option.text }}
          </div>
        </div>
        <div v-if="question.free_question">
          {{ question.free_question.text }}
        </div>
      </li>
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