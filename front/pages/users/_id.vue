<template>
  <h1>Hello, {{ name }}</h1>
</template>

<script>
export default {
  async asyncData({ $axios, params }) {
    let res = await $axios.$get(`/api/users/${params.id}`);
    return { name: res.name };
  },
};
</script>