<template>
  <section class="product-area product-style1-area">
    <div class="container">
      <div class="row">
        <div class="col-md-6 m-auto">
          <div class="section-title text-center" data-aos="fade-up" data-aos-duration="1000">
            <h2 class="title">New Products</h2>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="product-tab-content">
            <div class="tab-content" id="myTabContent" data-aos="fade-up" data-aos-duration="1300">
              <div class="tab-pane fade show active" id="our-features" role="tabpanel" aria-labelledby="our-features-tab">
                <div class="row">
                  <div class="col-lg-12">
                    <div class="product">
                      <div class="row">
                        <new-products/>
                      </div>
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
// import MainSlider from './components/Slider'
import NewProducts from "./components/NewProducts"

export default {
  name: 'ProductsIndex',
  components: {
    // MainSlider,
    NewProducts
  }
}
</script>
