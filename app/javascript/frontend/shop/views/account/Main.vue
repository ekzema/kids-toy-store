<template>
  <section class="my-account-area">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 m-auto">
          <div class="section-title text-center">
            <h2 class="title">{{ $t('ACCOUNT.TITLE') }}</h2>
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-lg-12">
          <div class="myaccount-page-wrapper">
            <div class="row">
              <div class="col-lg-3 co`l-md-4">
                <nav>
                  <div id="nav-tab" class="myaccount-tab-menu nav nav-tabs" role="tablist">
                    <router-link  v-for="(tab, index) in tabs"
                          :id="tab.key"
                          :key="index"
                          tag="button"
                          :to="{ name: tab.key }"
                          exact-active-class="active"
                          class="nav-link"
                          :class="{ active: tab.key === 'OrdersIndex' && $route.name === 'OrdersShow' }"
                      > {{ tab.title }}
                    </router-link>
                  </div>
                </nav>
              </div>
              <div class="col-lg-9 col-md-8">
                <div id="nav-tabContent" class="tab-content">
                  <div class="myaccount-content">
                    <router-view></router-view>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: 'AccountMain',
  data: () => ({
  }),
  computed: {
    tabs() {
      return [
        { key: 'AccountDashboard', title: this.$t('ACCOUNT.STATISTICS.TITLE') },
        { key: 'OrdersIndex', title: this.$t('ACCOUNT.ORDERS.TITLE') },
        { key: 'AccountDetails', title: this.$t('ACCOUNT.DETAILS.TITLE')}
      ]
    }
  },
  methods: {
  }
}
</script>

<style scoped>
</style>
