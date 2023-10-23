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
                    <router-link  v-for="(tab, index) in tabs"
                          :id="tab.key"
                          :key="tab.key"
                          tag="button"
                          :to="{ name: tab.key }"
                          exact-active-class="active"
                          class="nav-link"
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
    tabs: [
      { key: 'AccountDashboard', title: 'Dashboard' },
      { key: 'OrdersIndex', title: 'Orders' },
      { key: 'AccountDetails', title: 'Account details' }
    ],
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
