<template>
  <h3>{{ $t('ACCOUNT.ORDERS.TITLE') }} №{{ order.id }}</h3>
  <p class="orderStatus"><strong>{{ $t('ACCOUNT.ORDERS.SHOW.STATUS') }}: </strong><span :class="order.status">{{ order.status }}</span></p>
  <div class="row">
    <div class="col-lg-12">
      <div class="cart-table-wrap">
        <div class="cart-table table-responsive">
          <table>
            <thead>
            <tr>
              <th class="width-thumbnail"></th>
              <th>{{ $t('ACCOUNT.ORDERS.SHOW.HEADER.PRODUCT') }}</th>
              <th class="width-price"> {{ $t('ACCOUNT.ORDERS.SHOW.HEADER.PRICE') }}</th>
              <th class="width-quantity">{{ $t('ACCOUNT.ORDERS.SHOW.HEADER.QUANTITY') }}</th>
              <th class="order-width-total">{{ $t('ACCOUNT.ORDERS.SHOW.HEADER.TOTAL') }}</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="product in order.products" :key="product.id" >
              <td class="product-thumbnail">
                <router-link :to="{ name: 'ProductsShow', params: { id: product.slug }}">
                  <img :src="product.logo ? product.logo.thumb.url : ''" alt="Image">
                </router-link>
              </td>
              <td class="product-name">
                <h5>
                  <router-link :to="{ name: 'ProductsShow', params: { id: product.slug }}">
                    {{ product.name.ru }}
                  </router-link>
                </h5>
              </td>
              <td class="product-price"><span class="amount">{{ product.price }} грн</span></td>
              <td class="cart-quality">
                <div class="product-details-quality">
                  x {{ product.quantity }}
                </div>
              </td>
              <td class="product-total"><span>{{ product.price * product.quantity  }} грн</span></td>
            </tr>
            </tbody>
          </table>
          <div v-if="order.note" class="commentOrder">
            <p><strong>Комментарий к заказу: </strong>{{ order.note }}</p>
          </div>
        </div>
      </div>
      <div class="cart-shiping-update-wrapper clearMarginBottom">
        <div class="cart-shiping-btn continure-btn">
          <a class="btn btn-link" @click="hasHistory() ? $router.go(-1) : $router.push({name: 'OrdersIndex'})">
            <i class="ion-ios-arrow-left"></i> {{ $t('ACCOUNT.ORDERS.SHOW.BACK') }}
          </a>
        </div>
        <div class="cart-shiping-btn update-btn">
          <div class="grand-total-wrap">
            <div class="grand-total-content">
              <div class="grand-total">
                <h4>Всего: <span>{{ order.amount }} грн</span></h4>
              </div>
              <hr>
              <div class="order-info">
                <p>Доставка: <span>{{ order.delivery }}</span></p>
                <p v-if="order.city">Город: <span>{{ order.city }}</span></p>
                <p v-if="order.department_number">Отделение: <span>{{ order.department_number }}</span></p>
                <p>Оплата: <span>{{ order.pay_type }}</span></p>
              </div>
              <hr>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'OrderShow',
  data: () => ({
  }),
  computed: {
    ...mapGetters([
      'order',
    ]),
  },
  created() {
    this.fetchOrder()
  },
  methods: {
    fetchOrder() {
      this.$store.dispatch('fetchOrder', this.$route.params.id)
    },
    hasHistory () {
      return window.history.length > 2
    }
  }
}
</script>

<style scoped>
.width-price {
  width: 130px;
}

.width-quantity {
  min-width: 50px !important;
}

.order-width-total {
  width: 130px;
}

.grand-total p {
  font-weight: bold;
}

.grand-total p span {
  font-weight: normal;
  font-size: 15px;
  margin-left: 10px;
}

.order-info p, .order-info span {
  font-size: 15px;
}

.order-info p {
  font-weight: bold;
}

.order-info p span {
  font-weight: normal;
}

.sent {
  color: #007affc4;
}

.pending, .approved {
  color: #e9b207;
}

.canceled {
  color: #ff6b6b;
}

.completed {
  color: #62bd14;
}

.commentOrder {
  margin-top: -10px;
  margin-bottom: 20px;
}

.orderStatus {
  margin-top: -15px;
}

.clearMarginBottom {
  margin-bottom: 0 !important;
}
</style>
