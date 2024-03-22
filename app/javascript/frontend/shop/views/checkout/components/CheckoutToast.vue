<template>
  <div class="container wrap-toast">
    <h3>{{ i18n.global.t('CHECKOUT.SUCCESS.TITLE') }}</h3>
    <span>{{ i18n.global.t('CHECKOUT.SUCCESS.STATUS') }}</span><br>
    <span>{{ i18n.global.t('CHECKOUT.SUCCESS.BODY') }}</span>
  </div>
</template>

<script>
import { createI18n } from 'vue-i18n'
import i18nMessages from '../../../i18n'
import defaultStore from '../../../../store'

export default {
  name: 'CheckoutToast',
  setup: () => ({
    i18n: createI18n({
      locale: defaultStore.state.language,
      messages: i18nMessages
    })
  })
}
</script>

<style scoped>
.wrap-toast h3 {
  color: white !important;
  font-size: 18px;
}

span {
  font-size: 18px;
}
</style>
