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
                  <div id="nav-tab" class="myaccount-tab-menu nav nav-tabs" role="tablist">
                    <button
                        v-for="(tab, index) in tabs"
                        :id="tab.key"
                        :key="tab.key"
                        class="nav-link"
                        :class="{ active: index === 0 }"
                        data-bs-toggle="tab"
                        :data-bs-target="`#${tab.key}_${index}`"
                        type="button" role="tab"
                        :aria-controls="tab.key"
                        :aria-selected="index === 0"
                        @click="setActiveTab(tab.key)"
                    > {{ tab.title }}</button>
                  </div>
                </nav>
              </div>
              <div class="col-lg-9 col-md-8">
                <div id="nav-tabContent" class="tab-content">
                  <div
                      v-for="(tab, index) in tabs"
                      :id="`${tab.key}_${index}`"
                      :key="tab.key"
                      class="tab-pane fade"
                      :class="{ show: index === 0, active: index === 0 }"
                      role="tabpanel"
                      :aria-labelledby="tab.key">
                    <div class="myaccount-content">
                      <component :is="tab.key" v-if="isActiveTab(tab.key)" :key="tab.key"></component>
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
      { key: 'DashboardTab', title: 'Dashboard' },
      { key: 'OrdersTab', title: 'Orders' },
      { key: 'AccountDetailsTab', title: 'Account details' }
    ],
    activeTab: 'DashboardTab'
  }),
  methods: {
    isActiveTab(tabKey) {
      return this.activeTab === tabKey;
    },
    setActiveTab(tabKey) {
      this.activeTab = tabKey
    }
  }
}
</script>

<style scoped>
</style>
