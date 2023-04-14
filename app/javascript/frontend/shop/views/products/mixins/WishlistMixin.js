import NeedLoginToast from "../components/NeedLoginToast.vue";
import { useToast } from "vue-toastification"

export default {
  name: 'WishlistMixin',
  methods: {
    handleWashlist(id) {
      this.$store.dispatch('createWishlists', { product_id: id })
    },
    needLogin() {
      const toast = useToast()
      toast.success({
        component: NeedLoginToast,
      }, {
        position: "bottom-center",
        icon: "fa fa-info-circle fa-2x"
      })
    }
  }
}
