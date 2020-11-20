<template>
  <div class="container">
    <ul>
      <li v-for="questionnaire in questionnaires" :key="questionnaire.id">
        <router-link :to="{ path: `/answer_sheets/${questionnaire.id}` }">
          {{ questionnaire.abstract }}
        </router-link>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  async asyncData({ $axios, params }) {
    let questionnaires = await $axios.$get(`/api/questionnaires/`);
    let answer_sheets = await $axios.$get(`/api/answer_sheets/`);

    return {
      questionnaires: questionnaires,
      answer_sheets: answer_sheets,
    };
  },
};
</script>