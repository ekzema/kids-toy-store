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
              <div class="price-inputs">
                <div class="price_field">
                  <input v-model="minValue" @blur="updateRangeSlider" type="text">
                </div>
                <span>-</span>
                <div class="price_field">
                  <input v-model="maxValue" @blur="updateRangeSlider" type="text">
                </div>
              </div>
              <div id="slider-range" class="slider-range"></div>
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
import noUiSlider from 'nouislider'

export default {
  name: 'SideBar',
  data: () => ({
    minValue: 100,
    maxValue: 5000
  }),
  mounted() {
    const slider = document.getElementById("slider-range")

    noUiSlider.create(slider, {
      start: [this.minValue, this.maxValue],
      step: 1,
      range: {
        'min': [100],
        'max': [5000]
      },
      connect: true
    })

    slider.noUiSlider.on("update", (values, handle) => {
      handle
        ? this.maxValue = Math.round(values[handle])
        : this.minValue = Math.round(values[handle])
    })
  },
  methods: {
    updateRangeSlider() {
      const slider = document.getElementById("slider-range")
      slider.noUiSlider.set([this.minValue, this.maxValue])
    }
  },
}
</script>

<style scoped>
  .noUi-target,.noUi-target * {
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -ms-touch-action: none;
    touch-action: none;
    -ms-user-select: none;
    -moz-user-select: none;
    user-select: none;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
  }

  .noUi-target {
    position: relative;
    direction: ltr;
  }

  .noUi-base {
    width: 100%;
    height: 100%;
    position: relative;
    z-index: 1;
    /* Fix 401 */
  }

  .noUi-origin {
    position: absolute;
    right: 0;
    top: 0;
    left: 0;
    bottom: 0;
  }

  .noUi-handle {
    position: relative;
    z-index: 1;
  }

  .noUi-stacking .noUi-handle {
    z-index: 10;
  }

  .noUi-state-tap .noUi-origin {
    -webkit-transition: left 0.3s,top .3s;
    transition: left 0.3s,top .3s;
  }

  .noUi-state-drag * {
    cursor: inherit !important;
  }

  .noUi-base,.noUi-handle {
    -webkit-transform: translate3d(0,0,0);
    transform: translate3d(0,0,0);
  }

  .noUi-horizontal {
    height: 4px;
  }

  .noUi-horizontal .noUi-handle {
    width: 18px;
    height: 18px;
    border-radius: 50%;
    left: -7px;
    top: -7px;
    background-color: #345DBB;
  }

  .noUi-background {
    background: #D6D7D9;
  }

  .noUi-connect {
    background: #345DBB;
    -webkit-transition: background 450ms;
    transition: background 450ms;
  }

  .noUi-origin {
    border-radius: 2px;
  }

  .noUi-target {
    border-radius: 2px;
  }

  .noUi-target.noUi-connect {
  }

  .noUi-draggable {
    cursor: w-resize;
  }

  .noUi-vertical .noUi-draggable {
    cursor: n-resize;
  }

  .noUi-handle {
    cursor: default;
    -webkit-box-sizing: content-box !important;
    -moz-box-sizing: content-box !important;
    box-sizing: content-box !important;
  }

  .noUi-handle:active {
    border: 8px solid #345DBB;
    -webkit-background-clip: padding-box;
    background-clip: padding-box;
    left: -14px;
    top: -14px;
  }

  [disabled].noUi-connect,[disabled] .noUi-connect {
    background: #B8B8B8;
  }

  [disabled].noUi-origin,[disabled] .noUi-handle {
    cursor: not-allowed;
  }

  .price-inputs {
    display: flex;
  }

  .price-inputs span{
    margin: 4px 10px;
  }

  .price_field input {
    width: 100%;
    height: 40px;
    padding: 0 20px;
    border: 1px solid #ededed;
    border-radius: 6px;
    text-align: center;
    font-size: 14px;
    color: #202124;
  }
  .price_field {
    margin-bottom: 20px;
  }
</style>