<template>
  <section class="my-account-area">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 m-auto">
          <div class="section-title text-center">
            <h2 class="title">My account</h2>
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-lg-12">
          <div class="myaccount-page-wrapper">
            <div class="row">
              <div class="col-lg-3 co`l-md-4">
                <nav>
                  <div class="myaccount-tab-menu nav nav-tabs" id="nav-tab" role="tablist">
                    <button v-for="(tab, index) in tabs" class="nav-link" :ref="tab.key" :class="{ active: index === 0 }" :id="tab.key" data-bs-toggle="tab" :data-bs-target="`#${tab.key}_${index}`" type="button" role="tab" :aria-controls="tab.key" :aria-selected="index === 0"> {{ tab.title }}</button>
                  </div>
                </nav>
              </div>
              <div class="col-lg-9 col-md-8">
                <div class="tab-content" id="nav-tabContent">
                  <div v-for="(tab, index) in tabs" class="tab-pane fade" :class="{ show: index === 0, active: index === 0 }" :id="`${tab.key}_${index}`" role="tabpanel" :aria-labelledby="tab.key">
                    <div class="myaccount-content">
                      <component :key="tab.key" :is="tab.key"></component>
                    </div>
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
import DashboardTab from "./components/DashboardTab.vue"
import OrdersTab from "./components/OrdersTab.vue"
import AccountDetailsTab from "./components/AccountDetailsTab.vue";

export default {
  name: 'AccountMain',
  components: {
    DashboardTab,
    OrdersTab,
    AccountDetailsTab
  },
  data: () => ({
    tabs: [
      { key: 'DashboardTab', title: 'Dashboard'},
      { key: 'OrdersTab', title: 'Orders'},
      { key: 'AccountDetailsTab', title: 'Account details'}
    ]
  }),
  methods: {
    isActiveTab(buttonId) {
      console.log(buttonId,'test')
      const button = this.$refs.DashboardTab;
      console.log(button,'test')
    }
  }
}
</script>

<style scoped>
</style>
