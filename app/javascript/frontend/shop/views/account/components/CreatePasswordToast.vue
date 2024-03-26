<template>
  <div class="container">
    <span>{{ i18n.global.t('ACCOUNT.FORGOT_PASSWORD.SUCCESS.BODY') }}: <strong>{{ email }}</strong></span>
  </div>
</template>

<script>
import { createI18n } from 'vue-i18n'
import i18nMessages from '../../../i18n'
import defaultStore from '../../../../store'

export default {
  name: 'CreatePasswordToast',
  props: ['email'],
  setup: () => ({
    i18n: createI18n({
      locale: defaultStore.state.language,
      messages: i18nMessages
    })
  })
}
</script>

<style scoped>
span {
  font-size: 18px;
}
</style>
