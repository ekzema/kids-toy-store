<template>
  <!--== Start Wishlist Area Wrapper ==-->
  <section class="product-area wishlist-page-area">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 m-auto">
          <div class="section-title text-center">
            <h2 class="title">Wishlist</h2>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-12">
          <form action="#">
            <div class="wishlist-table-content">
              <div class="table-content table-responsive">
                <table>
                  <thead>
                  <tr>
                    <th class="width-remove"></th>
                    <th class="width-thumbnail"></th>
                    <th class="width-name">Product</th>
                    <th class="width-price"> Unit price </th>
                    <th class="width-stock-status"> Stock status </th>
                    <th class="width-wishlist-cart"></th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                    <td class="product-remove"><a href="#">×</a></td>
                    <td class="product-thumbnail">
                      <a href="shop-single-product.html"><img src="assets/img/shop/details/nav1.jpg" alt="Image"></a>
                    </td>
                    <td class="product-name">
                      <h5><a href="shop-single-product.html">Jigsaw Puzzles For Kids</a></h5>
                    </td>
                    <td class="product-price"><span class="amount">$120.00</span></td>
                    <td class="stock-status">
                      <span><i class="fa fa-check"></i> In Stock</span>
                    </td>
                    <td class="wishlist-cart"><a href="shop-cart.html">Add to Cart</a></td>
                  </tr>
                  <tr>
                    <td class="product-remove"><a href="#">×</a></td>
                    <td class="product-thumbnail">
                      <a href="shop-single-product.html"><img src="assets/img/shop/details/nav2.jpg" alt="Image"></a>
                    </td>
                    <td class="product-name">
                      <h5><a href="shop-single-product.html">Bruder Toys Mini Ships</a></h5>
                    </td>
                    <td class="product-price"><span class="amount">$120.00</span></td>
                    <td class="stock-status">
                      <span><i class="fa fa-check"></i> In Stock</span>
                    </td>
                    <td class="wishlist-cart"><a href="shop-cart.html">Add to Cart</a></td>
                  </tr>
                  <tr>
                    <td class="product-remove"><a href="#">×</a></td>
                    <td class="product-thumbnail">
                      <a href="shop-single-product.html"><img src="assets/img/shop/details/nav3.jpg" alt="Image"></a>
                    </td>
                    <td class="product-name">
                      <h5><a href="shop-single-product.html">Sassy Crib and Floor Mirror</a></h5>
                    </td>
                    <td class="product-price"><span class="amount">$120.00</span></td>
                    <td class="stock-status">
                      <span><i class="fa fa-check"></i> In Stock</span>
                    </td>
                    <td class="wishlist-cart"><a href="shop-cart.html">Add to Cart</a></td>
                  </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>
  <!--== End Wishlist Area Wrapper ==-->

</template>

<script>

export default {
  name: 'WishlistShow',
  components: {
  },
  data: () => ({
  }),
  methods: {}
}
</script>
