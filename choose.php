<?php require_once('./config.php') ?>
<!DOCTYPE html>
<html lang="en" class="" style="height: auto;">
 <?php require_once('inc/header.php') ?>
<body class="hold-transition login-page">
  <script>
    start_loader()
  </script>
  <style>
      body{
          /* width:calc(100%);
          height:calc(100%);
          background-image:url('<?= validate_image($_settings->info('cover')) ?>');
          background-repeat: no-repeat;
          background-size:cover; */
      }
      #logo-img{
          /* width:15em;
          height:15em; */
          object-fit:scale-down;
          object-position:center center;
      }
  </style>
<div class="login-box">
<?php $page = isset($_GET['page']) ? $_GET['page'] : 'home';  ?>
     <?php if($_settings->chk_flashdata('success')): ?>
      <script>
        alert_toast("<?php echo $_settings->flashdata('success') ?>",'success')
      </script>
    <?php endif;?>
  <!-- /.login-logo -->
  <center><img src="<?= validate_image($_settings->info('logo')) ?>" alt="System Logo" id="logo-img"></center>
  <div class="clear-fix my-2"></div>
  <div class="card card-outline card-purple">
    <div class="card-header text-center">
      <a href="./" class="h4 text-decoration-none"><b>Client Login Panel</b></a>
    </div>
    <div class="card-body">
      


          <!-- /.col -->
          <div class="col-12">
          <div>
          <a href="<?php echo base_url.'register.php' ?>" style="text-decoration:none;">
          <button  class="btn btn-success btn-sm btn-flat btn-block">Register as Customer</button></a>
        </div>
        <div>
          <a href="<?php echo base_url.'dregister.php' ?>" style="text-decoration:none;">
          <button  class="btn btn-success btn-sm btn-flat btn-block">Register as Driver</button></a>
     </div>
          </div>
        
          <!-- /.col -->
        </div>
      <!-- /.social-auth-links -->

      <!-- <p class="mb-1">
        <a href="forgot-password.html">I forgot my password</a>
      </p> -->
      
    </div>
    <!-- /.card-body -->
  </div>
  <!-- /.card -->
</div>
<!-- /.login-box -->

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>

<script>
  $(document).ready(function(){
    end_loader();
  })
</script>
</body>
</html>