<template>
  <section class="contact-area">
    <div class="container">
      <div class="contact-page-wrap">
        <div class="row">
          <div class="col-lg-10 m-auto">
            <div class="contact-info-items text-center">
              <div class="row row-gutter-80">
                <div class="col-sm-6 col-md-4">
                  <div class="contact-info-item">
                    <div class="icon">
                      <img class="icon-img" src="./../../assets/img/icons/5.png" alt="Icon">
                    </div>
                    <h2>Address</h2>
                    <div class="content">
                      <p>Your address goes here</p>
                    </div>
                  </div>
                </div>
                <div class="col-sm-6 col-md-4">
                  <div class="contact-info-item mt-xs-30">
                    <div class="icon">
                      <img class="icon-img" src="./../../assets/img/icons/6.png" alt="Icon">
                    </div>
                    <h2>Phone No</h2>
                    <div class="content">
                      <a href="tel://+00123456789">+ 00 123 456 789</a>
                    </div>
                  </div>
                </div>
                <div class="col-sm-6 col-md-4">
                  <div class="contact-info-item mt-sm-30">
                    <div class="icon">
                      <img class="icon-img" src="./../../assets/img/icons/7.png" alt="Icon">
                    </div>
                    <h2>Email / Web</h2>
                    <div class="content">
                      <a href="mailto://demo@example.com">demo@example.com</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-10 m-auto">
            <div class="contact-form">
              <form class="contact-form-wrapper" id="contact-form" action="https://whizthemes.com/mail-php/raju/arden/mail.php" method="post">
                <div class="row">
                  <div class="col-lg-12">
                    <div class="section-title">
                      <h2 class="title">Send a message</h2>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-lg-12">
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group">
                          <input class="form-control" type="text" name="con_name" placeholder="Name *">
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group">
                          <input class="form-control" type="email" name="con_email" placeholder="Email *">
                        </div>
                      </div>
                      <div class="col-md-12">
                        <div class="form-group">
                          <input class="form-control" type="text" placeholder="Subject (Optinal)">
                        </div>
                      </div>
                      <div class="col-md-12">
                        <div class="form-group">
                          <textarea class="form-control" name="con_message" placeholder="Message"></textarea>
                        </div>
                      </div>
                      <div class="col-md-12">
                        <div class="form-group text-center">
                          <button class="btn btn-theme" type="submit">Send Message</button>
                        </div>
                      </div>
                    </div>
                  </div>
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
import { mapGetters } from 'vuex'

export default {
  name: 'ContactShow',
  computed: {
    ...mapGetters([
      'language'
    ])
  },
  created() {
  },
  methods: {
  }
}
</script>
