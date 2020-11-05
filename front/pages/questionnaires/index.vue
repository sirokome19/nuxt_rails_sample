<template>
  <ul>
    <li v-for="questionnaire in questionnaires" :key="questionnaire.id">
      {{ questionnaire.abstract }}
    </li>
  </ul>
</template>

<script>
export default {
  async asyncData({ $axios, params }) {
    let res = await $axios.$get(`/api/questionnaires/`);
    return { questionnaires: res };
  },
};
</script>