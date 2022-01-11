<template>
  <div class="wrapper home-default-wrapper">
    <!--    Start Header Wrapper-->
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
                      <img class="logo-main" src="./assets/img/logo.png" alt="Logo" />
                      <img class="logo-light" src="./assets/img/logo.png" alt="Logo" />
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
              <div class="header-logo-area">
                <a href="index.html">
                  <img class="logo-main" src="./assets/img/logo.png" alt="Logo" />
                  <img class="logo-light" src="./assets/img/logo.png" alt="Logo" />
                </a>
              </div>
            </div>
            <div class="col-lg-8 sticky-md-none">
              <div class="header-navigation-area d-none d-md-block">
                <ul class="main-menu nav position-relative">
                  <li class="has-submenu active"><a class="ml--2" href="index.html">Home</a>
                    <ul class="submenu-nav">
                      <li><a href="index.html">Home One</a></li>
                      <li><a href="index-2.html">Home Two</a></li>
                    </ul>
                  </li>
                  <li><a href="about.html">About</a></li>
                  <li class="has-submenu"><a href="index.html">Pages</a>
                    <ul class="submenu-nav">
                      <li><a href="shop-cart.html">Cart page</a></li>
                      <li><a href="shop-checkout.html">Checkout</a></li>
                      <li><a href="my-account.html">My Account</a></li>
                      <li><a href="shop-wishlist.html">Wishlist</a></li>
                      <li><a href="shop-compare.html">Compare</a></li>
                      <li><a href="login-register.html">Login / Register</a></li>
                      <li><a href="coming-soon.html">Coming soon</a></li>
                      <li><a href="page-not-found.html">404</a></li>
                    </ul>
                  </li>
                  <li class="has-submenu"><a href="shop.html">Shop</a>
                    <ul class="submenu-nav">
                      <li><a href="shop-3-column.html">Shop 3 Column</a></li>
                      <li><a href="shop.html">Shop 4 Column</a></li>
                      <li><a href="shop-left-sidebar.html">Shop Left Sidebar</a></li>
                      <li><a href="shop-right-sidebar.html">Shop Right Sidebar</a></li>
                      <li><a href="shop.html">Shop No Sidebar</a></li>
                      <li><a href="shop-single-product.html">Product Details</a></li>
                      <li><a href="shop-single-product-variable.html">Product Variable</a></li>
                      <li><a href="shop-single-product-grouped.html">Product Grouped</a></li>
                    </ul>
                  </li>
                  <li class="has-submenu"><a href="blog.html">Blog</a>
                    <ul class="submenu-nav">
                      <li><a href="blog.html">Blog 3 Column</a></li>
                      <li><a href="blog-4-column.html">Blog 4 Column</a></li>
                      <li><a href="blog-left-sidebar.html">Blog Left Sidebar</a></li>
                      <li><a href="blog-right-sidebar.html">Blog Right Sidebar</a></li>
                      <li><a href="blog.html">Blog No Sidebar</a></li>
                      <li><a href="blog-details.html">Blog Details Left Sidebar</a></li>
                      <li><a href="blog-details-right-sidebar.html">Blog Details Right Sidebar</a></li>
                      <li><a href="blog-details-no-sidebar.html">Blog Details No Sidebar</a></li>
                    </ul>
                  </li>
                  <li><a href="contact.html">Contact</a></li>
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
    <!--    End Header Wrapper-->

    <!--== Start Footer Area Wrapper ==-->
    <footer class="footer-area default-style" >
      <div class="footer-main">
        <div class="container">
          <div class="row">
            <div class="col-md-5 col-lg-3">
              <div class="widget-item item-style3">
                <div class="about-widget">
                  <a class="footer-logo" href="/">
                    <img src="./assets/img/logo-light.png" alt="Logo">
                  </a>
                  <p>Lorem ipsum dolor sit amet, consecl adipisicing elit, sed do eiusmod teml incididunt ut labore et dolore magna aliqua Ut enim</p>
                  <div class="widget-social-icons">
                    <a href="#"><i class="ion-social-twitter"></i></a>
                    <a href="#"><i class="ion-social-tumblr"></i></a>
                    <a href="#"><i class="ion-social-facebook"></i></a>
                    <a href="#"><i class="ion-social-instagram-outline"></i></a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-3 col-lg-2">
              <div class="widget-item item-style1">
                <h4 class="widget-title">Quick Links</h4>
                <h4 class="widget-title widget-collapsed-title collapsed" data-bs-toggle="collapse" data-bs-target="#dividerId-1">Quick Links</h4>
                <div id="dividerId-1" class="collapse widget-collapse-body">
                  <nav class="widget-menu-wrap">
                    <ul class="nav-menu nav item-hover-style">
                      <li><a href="/">- Support</a></li>
                      <li><a href="/">- Helpline</a></li>
                      <li><a href="/">- Courses</a></li>
                      <li><a href="/">- About</a></li>
                      <li><a href="/">- Event</a></li>
                    </ul>
                  </nav>
                </div>
              </div>
            </div>
            <div class="col-md-4 col-lg-2">
              <div class="widget-item item-style1">
                <h4 class="widget-title">Other Page</h4>
                <h4 class="widget-title widget-collapsed-title collapsed" data-bs-toggle="collapse" data-bs-target="#dividerId-2">Other Page</h4>
                <div id="dividerId-2" class="collapse widget-collapse-body">
                  <nav class="widget-menu-wrap item-hover-style">
                    <ul class="nav-menu nav">
                      <li><a href="/">- About</a></li>
                      <li><a href="/">- Blog</a></li>
                      <li><a href="/">- Speakers</a></li>
                      <li><a href="/">- Contact</a></li>
                      <li><a href="/">- Tricket</a></li>
                    </ul>
                  </nav>
                </div>
              </div>
            </div>
            <div class="col-md-5 col-lg-2">
              <div class="widget-item item-style2">
                <h4 class="widget-title">Company</h4>
                <h4 class="widget-title widget-collapsed-title collapsed" data-bs-toggle="collapse" data-bs-target="#dividerId-3">Company</h4>
                <div id="dividerId-3" class="collapse widget-collapse-body">
                  <nav class="widget-menu-wrap item-hover-style">
                    <ul class="nav-menu nav">
                      <li><a href="/">- Jesco</a></li>
                      <li><a href="/">- Shop</a></li>
                      <li><a href="/">- Contact us</a></li>
                      <li><a href="/">- Log in</a></li>
                      <li><a href="/">- Help</a></li>
                    </ul>
                  </nav>
                </div>
              </div>
            </div>
            <div class="col-md-7 col-lg-3">
              <div class="widget-item">
                <h4 class="widget-title">Store Information.</h4>
                <h4 class="widget-title widget-collapsed-title collapsed" data-bs-toggle="collapse" data-bs-target="#dividerId-4">Store Information.</h4>
                <div id="dividerId-4" class="collapse widget-collapse-body">
                  <p class="widget-address">2005 Your Address Goes Here. <br>896, Address 10010, HGJ</p>
                  <ul class="widget-contact-info">
                    <li>Phone/Fax: <a href="tel://0123456789">0123456789</a></li>
                    <li>Email: <a href="mailto://demo@example.com">demo@example.com</a></li>
                  </ul>
                  <div class="widget-payment-info">
                    <div class="thumb">
                      <a href="/"><img src="./assets/img/photos/payment1.png" alt="Image"></a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="footer-bottom">
        <div class="container">
          <div class="footer-bottom-content">
            <div class="row text-center">
              <div class="col-sm-12">
                <div class="widget-copyright">
                  <p><i class="fa fa-copyright"></i> 2021 <span>KIDOL. </span> Made with <i class="fa fa-heart"></i> by <a target="_blank" href="https://www.hasthemes.com">HasThemes</a></p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="footer-shape bg-img" data-bg-img="./assets/img/photos/footer1.png"></div>
    </footer>
    <!--== End Footer Area Wrapper ==-->

  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "YOUR CODES GOES HERE"
    }
  },
  created () {
  }
}
</script>

<style scoped>
</style>
