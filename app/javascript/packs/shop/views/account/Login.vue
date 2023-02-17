<template>
  <section class="login-register-area">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-6">
          <div class="login-register-content">
            <div class="login-register-title mb-30">
              <h2 class="text-center">Login</h2>
              <p class="text-center">Welcome back! Please enter your username and password to login. </p>
            </div>
            <div class="login-register-style">
              <form action="#" method="post">
                <div class="login-register-input">
                  <input type="text" name="user-name" placeholder="Username or email address">
                </div>
                <div class="login-register-input">
                  <input type="password" name="user-password" placeholder="Password">
                  <div class="forgot">
                    <a href="#">Forgot?</a>
                  </div>
                </div>
                <div class="btn-style-3">
                  <button class="btn" onclick="window.location.href='my-account.html'" type="button">Login</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: 'login',
  components: {
  },
  data: () => ({
  }),
  methods: {

  }
}
</script>
