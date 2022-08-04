<template>
  <v-row justify="center">
    <v-col
        cols="12"
        sm="10"
        md="8"
        lg="6"
    >
      <v-form ref="form" >
        <h1 class="text-center mb-3">Create new category</h1>
            <v-text-field
                ref="name"
                v-model="name"
                label="Name"
                variant="underlined"
                color="primary"
            ></v-text-field>
            <v-text-field
                v-model="parent_id"
                label="Parent category"
                variant="underlined"
                color="primary"
            ></v-text-field>
      </v-form>
    </v-col>
  </v-row>
</template>

<script>

export default {
  name: 'new',
  data: () => ({
    name: '',
    parent_id: ''
  }),
  created() {
  }
}
</script>
