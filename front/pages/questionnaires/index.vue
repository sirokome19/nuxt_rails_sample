<template>
  <div class="container">
    <ul>
      <li v-for="questionnaire in questionnaires" :key="questionnaire.id">
        <router-link :to="{ path: `/questionnaires/${questionnaire.id}` }">
          {{ questionnaire.abstract }}
        </router-link>
      </li>
    </ul>
    <a href="/questionnaires/new" class="button--green"> add Questionnaire </a>
  </div>
</template>

<script>
export default {
  async asyncData({ $axios, params }) {
    let res = await $axios.$get(`/api/questionnaires/`);
    return { questionnaires: res };
  },
};
</script>