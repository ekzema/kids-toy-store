<template>
  <header class="header-wrapper">
    <div class="header-top">
      <div class="container">
        <div class="row">
          <div class="col-xs-12 col-sm-5 col-md-4 col-lg-6">
            <div class="header-info-left">
              <p>Free Returns and Free Shipping</p>
            </div>
          </div>
          <div class="col-xs-12 col-sm-7 col-md-8 col-lg-6 sm-pl-0 xs-pl-15 header-top-right">
            <div class="header-info">
              <a href="tel://+00123456789"><i class="fa fa-phone"></i> +00 123 456 789</a>
              <a href="mailto://demo@example.com"><i class="fa fa-envelope"></i> demo@example.com</a>
              <a href="login-register.html"><i class="fa fa-user"></i> Account</a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="header-middle">
      <div class="container">
        <div class="row row-gutter-0 align-items-center">
          <div class="col-12">
            <div class="header-align">
              <div class="header-align-left">
                <div class="header-logo-area">
                  <a href="index.html">
                    <img class="logo-main" src="./../../assets/img/logo.png" alt="Logo" />
                    <img class="logo-light" src="./../../assets/img/logo.png" alt="Logo" />
                  </a>
                </div>
              </div>
              <div class="header-align-center">
                <div class="header-search-box">
                  <form action="#" method="post">
                    <div class="form-input-item">
                      <label for="search" class="sr-only">Search Everything</label>
                      <input type="text" id="search" placeholder="Search Everything">
                      <button type="submit" class="btn-src">
                        <i class="pe-7s-search"></i>
                      </button>
                    </div>
                  </form>
                </div>
              </div>
              <div class="header-align-right">
                <div class="header-action-area">
                  <div class="header-action-wishlist">
                    <button class="btn-wishlist" onclick="window.location.href='shop-wishlist.html'">
                      <i class="pe-7s-like"></i>
                    </button>
                  </div>
                  <div class="header-action-cart">
                    <button class="btn-cart cart-icon">
                      <span class="cart-count">01</span>
                      <i class="pe-7s-shopbag"></i>
                    </button>
                  </div>
                  <button class="btn-menu d-md-none">
                    <i class="ion-navicon"></i>
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="header-area header-default sticky-header">
      <div class="container">
        <div class="row row-gutter-0 align-items-center">
          <div class="col-4 col-sm-6 col-lg-2">
            <div class="menu">
              <button class="menu__btn js-menu-btn">
                <span class="menu__burger"><span></span></span><span class="menu__text">Каталог товаров</span>
              </button>
            </div>
          </div>
          <div class="col-lg-8 sticky-md-none">
            <div class="header-navigation-area d-none d-md-block">
              <ul class="main-menu nav position-relative">
                <li><a href="contact.html">Contact</a></li>
                <li><a href="contact.html">About</a></li>
                <li><a href="contact.html">Blogs</a></li>
              </ul>
            </div>
          </div>
          <div class="col-8 col-sm-6 col-lg-2">
            <div class="header-action-area">
              <div class="header-action-search">
                <button class="btn-search btn-search-menu">
                  <i class="pe-7s-search"></i>
                </button>
              </div>
              <div class="header-action-login">
                <button class="btn-login" onclick="window.location.href='login-register.html'">
                  <i class="pe-7s-users"></i>
                </button>
              </div>
              <div class="header-action-wishlist">
                <button class="btn-wishlist" onclick="window.location.href='shop-wishlist.html'">
                  <i class="pe-7s-like"></i>
                </button>
              </div>
              <div class="header-action-cart">
                <button class="btn-cart cart-icon">
                  <span class="cart-count">01</span>
                  <i class="pe-7s-shopbag"></i>
                </button>
              </div>
              <button class="btn-menu d-lg-none">
                <i class="ion-navicon"></i>
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header>
</template>

<script>
export default {
  data () {
    {
    }
  },
  methods: {
  }
}
</script>
