<template>
  <section class="login-register-area">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-7">
          <div class="login-register-content login-register-pl">
            <div class="login-register-title mb-30">
              <h2>Register</h2>
              <p>Create new account today to reap the benefits of a personalized shopping experience. </p>
            </div>
            <div class="login-register-style">
              <form action="#" method="post">
                <div class="login-register-input">
                  <input type="text" name="user-name" placeholder="E-mail address">
                </div>
                <div class="login-register-input">
                  <input type="password" name="user-password" placeholder="Password">
                </div>
                <div class="login-register-paragraph">
                  <p>Your personal data will be used to support your experience throughout this website, to manage access to your account, and for other purposes described in our <a href="#">privacy policy.</a></p>
                </div>
                <div class="btn-style-3">
                  <button class="btn" onclick="window.location.href='my-account.html'" type="button">Register</button>
                </div>
              </form>
              <div class="register-benefits">
                <h3>Sign up today and you will be able to :</h3>
                <p>The Loke Buyer Protection has you covered from click to delivery. Sign up <br>or sign in and you will be able to:</p>
                <ul>
                  <li><i class="pe-7s-check icons"></i> Speed your way through checkout</li>
                  <li><i class="pe-7s-check icons"></i> Track your orders easily</li>
                  <li><i class="pe-7s-check icons"></i> Keep a record of all your purchases</li>
                </ul>
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
  name: 'new',
  components: {
  },
  data: () => ({
  }),
  methods: {

  }
}
</script>
