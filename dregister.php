<?php require_once('./config.php') ?>
<!DOCTYPE html>
<html lang="en">
 <?php require_once('inc/header.php') ?>
<body class="">
  <script>
  </script>
  <style>
    html, body{
      width:calc(100%);
      height:calc(100%);
    }
      body{
         
          /* background-image:url('<?= validate_image($_settings->info('cover')) ?>');
          background-repeat: no-repeat;
          background-size:cover; */
          background-color: rgb(143, 174, 202);
      }
      #logo-img{
          width:15em;
          height:15em;
          object-fit:scale-down;
          object-position:center center;
      }
      #cimg{
          width:15vw;
          height:20vh;
          object-fit:scale-down;
          object-position:center center;
      }
      .pass_type{
        cursor: pointer;
      }
  </style>
<div class="d-flex align-items-center justify-content-center ">
  <!-- /.login-logo -->
  <!-- <div class="d-flex  justify-content-center align-items-center col-lg-5">
      <center><img src="<?= validate_image($_settings->info('logo')) ?>" alt="System Logo" class="img-thumbnail rounded-circle" id="logo-img"></center>
      <div class="clear-fix my-2"></div>
  </div> -->
  <div class="d-flex  justify-content-center align-items-center col-lg-7 bg-gradient-light text-dark">
    <div class="card card-outline card-purple w-75">
      <div class="card-header text-center">
        <a href="./" class="text-decoration-none text-dark"><b>Create an Account - Driver</b></a>
      </div>
      <div class="card-body">
      <?php


?>
<style>
	#cimg{
		width: 15vw;
		height: 20vh;
		object-fit:scale-down;
		object-position:center center;
	}
</style>
<div class="card card-outline card-purple rounded-0">
	<div class="card-header">
	</div>
	<div class="card-body">
		<form action="REQUEST_METHOD" id="cab-form">
            <div class="form-group">
				<label for="category_id" class="control-label">Category</label>
                <select name="category_id" id="category_id" class="custom-select select2">
                    <option value="" <?= !isset($category_id) ? "selected" : "" ?> disabled></option>
                    <?php 
                    $categorys = $conn->query("SELECT * FROM category_list where delete_flag = 0 ".(isset($category_id) ? " or id = '{$category_id}'" : "")." order by `name` asc ");
                    while($row= $categorys->fetch_assoc()):
                    ?>
                    <option value="<?= $row['id'] ?>" <?= isset($category_id) && $category_id == $row['id'] ? "selected" : "" ?>><?= $row['name'] ?> <?= $row['delete_flag'] == 1 ? "<small>Deleted</small>" : "" ?></option>
                    <?php endwhile; ?>
                </select>
			</div>
			<div class="form-group">
				<label for="cab_reg_no" class="control-label">Plate #/Vehicle Reg #</label>
                <input name="cab_reg_no" id="cab_reg_no" type="text" class="form-control rounded-0" value="<?php echo isset($cab_reg_no) ? $cab_reg_no : ''; ?>" required>
			</div>
			<div class="form-group">
				<label for="cab_model" class="control-label">Vehicle Model</label>
                <input name="cab_model" id="cab_model" type="text" class="form-control rounded-0" value="<?php echo isset($cab_model) ? $cab_model : ''; ?>" required>
			</div>
			<div class="form-group">
				<label for="body_no" class="control-label">Cab's Body #</label>
                <input name="body_no" id="body_no" type="text" class="form-control rounded-0" value="<?php echo isset($body_no) ? $body_no : ''; ?>" required>
			</div>
            <div class="form-group">
				<label for="cab_driver" class="control-label">Driver Name</label>
                <input name="cab_driver" id="cab_driver" type="text" class="form-control rounded-0" value="<?php echo isset($cab_driver) ? $cab_driver : ''; ?>" required>
			</div>
			<div class="form-group">
				<label for="driver_contact" class="control-label">Driver's Contact #</label>
                <input name="driver_contact" id="driver_contact" type="text" class="form-control rounded-0" value="<?php echo isset($driver_contact) ? $driver_contact : ''; ?>" required>
			</div>
			<div class="form-group">
				<label for="driver_address" class="control-label">Driver's Address</label>
                <textarea name="driver_address" id="driver_address" type="text" class="form-control rounded-0" required><?php echo isset($driver_address) ? $driver_address : ''; ?></textarea>
			</div>
			<div class="form-group">
				<label for="password" class="control-label">Driver's Account Password</label>
				<div class="input-group">
                	<input name="password" id="password" type="password" class="form-control rounded-0" <?php echo !isset($password) ? 'required' : ''; ?>>
					<div class="input-group-append">
						<button class="btn btn-outline-default pass_view" type="button"><i class="fa fa-eye-slash"></i></button>
					</div>
				</div>
				<small class="text-muted"><i>Leave this field blank if you don't wish to update the driver's account password.</i></small>
			</div>
			<div class="form-group col-md-6">
				<label for="" class="control-label">Driver's Image</label>
				<div class="custom-file">
	              <input type="file" class="custom-file-input rounded-circle" id="customFile" name="img" onchange="displayImg(this,$(this))">
	              <label class="custom-file-label" for="customFile">Choose file</label>
	            </div>
			</div>
			<div class="form-group col-md-6 d-flex justify-content-center">
				<img src="<?php echo validate_image(isset($image_path) ? $image_path : "") ?>" alt="" id="cimg" class="img-fluid img-thumbnail">
			</div>
            <div class="form-group">
				<label for="status" class="control-label">Status</label>
                <select name="status" id="status" class="custom-select selevt">
                <option value="1" <?php echo isset($status) && $status == 1 ? 'selected' : '' ?>>Active</option>
                <option value="0" <?php echo isset($status) && $status == 0 ? 'selected' : '' ?>>Inactive</option>
                </select>
			</div>
      <div class="card-footer">
		<button class="btn btn-flat btn-success" form="cab-form">Register</button>
    
	</div>
		</form>
	</div>
	
</div>
<div class="row">
            <div class="col-12 text-center">
             <a href="<?php echo base_url.'./driver/login.php' ?>" style="text-decoration:none;">Login as Drive</a>
            </div>
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

</div>



</body>
</html>
<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $category_id = $_POST["category_id"];
    $cab_reg_no = $_POST["cab_reg_no"];
    $cab_model = $_POST["cab_model"];
    $body_no = $_POST["body_no"];
    $cab_driver = $_POST["cab_driver"];
    $driver_contact = $_POST["driver_contact"];
    $driver_address = $_POST["driver_address"];
    $password = isset($_POST["password"]) ? $_POST["password"] : null;
    $status = $_POST["status"];

    // Insert or update data into the database
    // Example: Inserting data into a 'cab_info' table
    $query = "INSERT INTO cab_list (category_id, cab_reg_no, cab_model, body_no, cab_driver, driver_contact, driver_address, password, status) VALUES ('$category_id', '$cab_reg_no', '$cab_model', '$body_no', '$cab_driver', '$driver_contact', '$driver_address', '$password', '$status')";

    // Uncomment the following line if you want to perform the database operation
    // $conn->query($query);

    // Redirect to a success page or display a success message
    header("Location: success.php");
    exit();
}
?>