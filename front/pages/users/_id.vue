<template>
  <h1>Hello, {{ name }}</h1>
</template>

<script>
import axios from "axios";
export default {
  async asyncData({ params }) {
    const { data } = await axios.get(`/api/users/${params.id}`);
    return { name: data.name };
  },
};
</script>