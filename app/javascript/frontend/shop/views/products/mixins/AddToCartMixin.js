import { cart } from "../../../helpers/utils"
import AddedToCartToast from "../components/AddedToCartToast"
import { useToast } from "vue-toastification"

export default {
  name: 'add-to-cart-mixin',
  methods: {
    addToCart(product, quantity = 1) {
      if (product.status === 'not_available' || product.status === 'on_the_way') return

      const toast = useToast()
      const payload = { product_id: product.id, quantity: quantity }
      if (this.user) {
        this.$store.dispatch('createLineItems', payload)
      } else {
        cart.add(payload)
        this.$store.commit('setCart', cart.get())
      }

      toast.success({
        component: AddedToCartToast,
        props: { product: product }
      }, {
        position: "bottom-center",
        icon: false
      })
    }
  }
}
