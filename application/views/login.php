<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>Login &mdash; Management Report</title>

  <!-- General CSS Files -->
  <link rel="stylesheet" href="<?php echo base_url(); ?>assets/modules/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="<?php echo base_url(); ?>assets/modules/fontawesome/css/all.min.css">

  <!-- CSS Libraries -->
  <link rel="stylesheet" href="<?php echo base_url(); ?>assets/modules/bootstrap-social/bootstrap-social.css">

  <!-- Template CSS -->
  <link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/style.css">
  <link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/components.css">
  <!-- Start GA -->
  <!-- /END GA -->
</head>

<body>
  <div id="app">
    <section class="section">
      <div class="container mt-5">
        <div class="row">
          <div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
            <div class="login-brand">
              <h2> Regulatory Report </h2>
            </div>

            <div class="card card-danger">
              <div class="card-header">
                <br />
                <img src="<?php echo base_url('assets/img/finnet.png') ?>" style="height:145px; width:345px; margin-left:-14px;"><br/>
                
              </div>
              <div class="col-md-12">
                <?php
                if (isset($error)) {
                  echo "<div id='message' class='alert alert-danger'> <button class='close' data-dismiss='alert'>&times;</button><strong>$error</strong></div>";
                }
                if (isset($success)) {
                  echo "<div id='message' class='alert alert-success'> <button class='close' data-dismiss='alert'>&times;</button><strong>$success</strong></div>";
                }
                ?>
              </div>
              <div class="card-body">
                <form method="post" action="<?= site_url() ?>login/check/" onsubmit="post(this);" class="needs-validation" novalidate="">
                  <div class="form-group">
                    <label for="username">Username</label>
                    <input id="username" type="text" class="form-control" name="username" required autofocus>
                    <div class="invalid-feedback">
                      Please fill in your username
                    </div>
                  </div>

                  <div class="form-group">
                    <div class="d-block">
                      <label for="password" class="control-label">Password</label>
                      <!--<div class="float-right">
                        <a href="<?php echo base_url(); ?>auth-forgot-password.html" class="text-small">
                          Forgot Password?
                        </a>
                      </div>-->
                    </div>
                    <input id="password" type="password" class="form-control" name="password" required>
                    <div class="invalid-feedback">
                      please fill in your password
                    </div>
                  </div>

                  <div class="form-group">
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" name="remember" class="custom-control-input" id="remember-me">
                      <label class="custom-control-label" for="remember-me">Remember Me</label>
                    </div>
                  </div>

                  <div class="form-group">
                    <button type="submit" class="btn btn-outline-danger btn-icon btn-lg btn-block" tabindex="4">
                      <i class="fas fa-sign-in-alt"></i> Login
                    </button>
                  </div>
                </form>
              </div>
            </div>
            <!--<div class="mt-5 text-muted text-center">
              Don't have an account? <a href="<?php echo base_url(); ?>auth-register.html">Create One</a>
            </div> -->
            <div class="simple-footer">
              <br />
              Copyright &copy; Regulatory Report Finnet 2021
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>

  <!-- General JS Scripts -->
  <script src="<?php echo base_url(); ?>assets/modules/jquery.min.js"></script>
  <script src="<?php echo base_url(); ?>assets/modules/popper.js"></script>
  <script src="<?php echo base_url(); ?>assets/modules/tooltip.js"></script>
  <script src="<?php echo base_url(); ?>assets/modules/bootstrap/js/bootstrap.min.js"></script>
  <script src="<?php echo base_url(); ?>assets/modules/nicescroll/jquery.nicescroll.min.js"></script>
  <script src="<?php echo base_url(); ?>assets/modules/moment.min.js"></script>
  <script src="<?php echo base_url(); ?>assets/js/stisla.js"></script>

  <!-- JS Libraies -->

  <!-- Page Specific JS File -->

  <!-- Template JS File -->
  <script src="<?php echo base_url(); ?>assets/js/scripts.js"></script>
  <script src="<?php echo base_url(); ?>assets/js/custom.js"></script>
  <script>
    function post(a) {
      $('#message').hide();
      $.ajax({
        type: 'POST',
        url: $(a).attr('action'),
        data: $(a).serialize(),
        success: function(data) {
          $('#message').fadeIn('slow').html(data);
        }
      });
      return false;
    }
    window.onload = function() {
      document.getElementById("username").focus();
    };
  </script>
</body>

</html>