<template>
  <div class="col-lg-3 order-1 order-lg-0">
    <div class="sidebar-area shop-sidebar-area">
      <div class="widget-item">
        <div class="widget-title">
          <h3 class="title">Product Categories</h3>
        </div>
        <div class="widget-body">
          <div class="widget-categories">
            <ul>
              <li><a href="shop.html">Accesasories <span>(6)</span></a></li>
              <li><a href="shop.html">Computer <span>(4)</span></a></li>
              <li><a href="shop.html">Covid-19 <span>(2)</span></a></li>
              <li><a href="shop.html">Electronics <span>(6)</span></a></li>
              <li><a href="shop.html">Frame Sunglasses <span>(12)</span></a></li>
              <li><a href="shop.html">Furniture <span>(7)</span></a></li>
              <li><a href="shop.html">Genuine Leather <span>(9)</span></a></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="widget-item">
        <div class="widget-filter">
          <div class="widget-title">
            <h3 class="title">Price Filter</h3>
          </div>
          <div class="widget-body">
            <div class="widget-price-filter">
              <div class="slider-labels">
                <div class="caption">
                  <span id="slider-range-value1"></span>
                </div>
                <span class="range-separator"></span>
                <div class="caption">
                  <span id="slider-range-value2"></span>
                </div>
              </div>
              <div class="slider-range" id="slider-range"></div>
            </div>
          </div>
        </div>
      </div>
      <div class="widget-item">
        <div class="widget-title">
          <h3 class="title">Color</h3>
        </div>
        <div class="widget-body">
          <div class="widget-color">
            <div class="form-check">
              <input class="form-check-input red" type="radio" name="colorRadio" id="colorRadio1" checked>
              <label class="form-check-label" for="colorRadio1">Red (12)</label>
            </div>
            <div class="form-check">
              <input class="form-check-input black" type="radio" name="colorRadio" id="colorRadio2">
              <label class="form-check-label" for="colorRadio2">Light Black (09)</label>
            </div>
            <div class="form-check">
              <input class="form-check-input blue" type="radio" name="colorRadio" id="colorRadio3">
              <label class="form-check-label" for="colorRadio3">Dark Blue (07)</label>
            </div>
            <div class="form-check">
              <input class="form-check-input gray" type="radio" name="colorRadio" id="colorRadio4">
              <label class="form-check-label" for="colorRadio4">Gray (11)</label>
            </div>
          </div>
        </div>
      </div>
      <div class="widget-item mb-md-0">
        <div class="widget-title">
          <h3 class="title">Size</h3>
        </div>
        <div class="widget-body">
          <div class="widget-size">
            <div class="form-check">
              <input class="form-check-input black" type="radio" name="colorRadio2" id="colorRadio5" checked>
              <label class="form-check-label" for="colorRadio5">M (12)</label>
            </div>
            <div class="form-check">
              <input class="form-check-input black" type="radio" name="colorRadio2" id="colorRadio6">
              <label class="form-check-label" for="colorRadio6">L (09)</label>
            </div>
            <div class="form-check">
              <input class="form-check-input black" type="radio" name="colorRadio2" id="colorRadio7">
              <label class="form-check-label" for="colorRadio7">XL (07)</label>
            </div>
            <div class="form-check">
              <input class="form-check-input black" type="radio" name="colorRadio2" id="colorRadio8">
              <label class="form-check-label" for="colorRadio8">XXL (11)</label>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

export default {
  name: 'SideBar',
}
</script>
