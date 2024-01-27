
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script><?php
//require_once('./config.php');
// Check if the form is submitted
// if ($_SERVER["REQUEST_METHOD"] == "POST") {
// 	require_once('./classes/DBConnection.php');
    // Retrieve form data
   // $id = $_POST["id"];
//     $cab_id = $_POST["cab_id"];
//     $client_id = $_POST["client_id"];
//     $ref_code = $_POST["ref_code"];
//     $pickup_zone = $_POST["pickup_zone"];
//     $drop_zone = $_POST["drop_zone"];

//     $sql = "INSERT INTO booking_list ( cab_id, client_id, ref_code, pickup_zone, drop_zone) VALUES ('$cab_id', '$client_id', '$ref_code', '$pickup_zone', '$drop_zone')";
// }
if(isset($_GET['id']) && $_GET['id'] > 0){
    $qry = $conn->query("SELECT * from `booking_list` where id = '{$_GET['id']}' ");
    if($qry->num_rows > 0){
        foreach($qry->fetch_assoc() as $k => $v){
            $$k=stripslashes($v);
        }
    }
}
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
		<h3 class="card-title"><?php echo isset($id) ? "Update ": "Create New " ?> Booking</h3>
	</div>
	<div class="card-body">
		<form action="POST" id="cab-forma" method="POST" >
			<input type="hidden" name ="id" value="<?php echo isset($id) ? $id : '' ?>">
            <div class="form-group">
				<label for="cab_id" class="control-label">Category</label>
                <select name="cab_id" id="cab_id" class="custom-select select2">
                    <option value="" <?= !isset($cab_id) ? "selected" : "" ?> disabled></option>
                    <?php 
                    $categorys = $conn->query("SELECT * FROM cab_list where delete_flag = 0 ".(isset($cab_id) ? " or id = '{$category_id}'" : "")." order by `cab_model` asc ");
                    while($row= $categorys->fetch_assoc()):
                    ?>
                    <option value="<?= $row['id'] ?>" <?= isset($cab_id) && $cab_id == $row['id'] ? "selected" : "" ?>><?= $row['cab_model'] ?> <?= $row['delete_flag'] == 1 ? "<small>Deleted</small>" : "" ?></option>
                    <?php endwhile; ?>
                </select>
			</div>

			<div class="form-group">
				<label for="client_id" class="control-label">client</label>
                <select name="client_id" id="client_id" class="custom-select select2">
                    <option value="" <?= !isset($client_id) ? "selected" : "" ?> disabled></option>
                    <?php 
                    $categorys = $conn->query("SELECT * FROM client_list where delete_flag = 0 ".(isset($client_id) ? " or id = '{$client_id}'" : "")." order by `firstname` asc ");
                    while($row= $categorys->fetch_assoc()):
                    ?>
                    <option value="<?= $row['id'] ?>" <?= isset($category_id) && $category_id == $row['id'] ? "selected" : "" ?>><?= $row['firstname'] ?> <?= $row['delete_flag'] == 1 ? "<small>Deleted</small>" : "" ?></option>
                    <?php endwhile; ?>
                </select>
			</div>

			<div class="form-group">
				<label for="cab_reg_no" class="control-label">ref_code</label>
                <input name="ref_code" id="ref_code" type="text" class="form-control rounded-0" value="<?php echo isset($ref_code) ? $ref_code : ''; ?>" required>
			</div>
			<div class="form-group">
				<label for="pickup_zone" class="control-label">pickup_zone</label>
                <input name="pickup_zone" id="pickup_zone" type="text" class="form-control rounded-0" value="<?php echo isset($pickup_zone) ? $pickup_zone : ''; ?>" required>
			</div>
			<div class="form-group">
				<label for="drop_zone" class="control-label">drop_zone #</label>
                <input name="drop_zone" id="drop_zone" type="text" class="form-control rounded-0" value="<?php echo isset($drop_zone) ? $drop_zone : ''; ?>" required>
			</div>
			<button  class="btn btn-flat btn-success" form="cab-forma">Save</button>
			<a class="btn btn-flat btn-danger" href="?page=bookings">Cancel</a>
	</div>
		</form>
	</div>
	<div class="card-footer">
	
		
</div>
<script>
	$(document).ready(function() {
    $('#cab-forma').submit(function(e) {
        e.preventDefault(); // Prevent the default form submission
        
        // Get form data
        var cab_id = $('#cab_id').val();
        var client_id = $('#client_id').val();
        var ref_code = $('#ref_code').val();
        var pickup_zone = $('#pickup_zone').val();
        var drop_zone = $('#drop_zone').val();

        // Send AJAX request
        $.ajax({
            type: 'POST',
            url: 'process_form.php', // Update with the actual PHP file handling the form submission
            data: {
                cab_id: cab_id,
                client_id: client_id,
                ref_code: ref_code,
                pickup_zone: pickup_zone,
                drop_zone: drop_zone
            },
            success: function(response) {
                // Handle the response from the server if needed
                console.log(response);
				location.href = "./?page=bookings";
            }
        });
    });
});

</script>

<!-- <script>
	window.displayImg = function(input,_this) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	        	$('#cimg').attr('src', e.target.result);
	        	_this.siblings('.custom-file-label').html(input.files[0].name)
	        }

	        reader.readAsDataURL(input.files[0]);
	    }else{
          
            _this.siblings('.custom-file-label').html("Choose file")
        }
	}
	$(document).ready(function(){
		$('.select2').select2({
			width:'100%',
			placeholder:"Please Select Here"
		})
		$('.pass_view').click(function(){
			var group = $(this).closest('.input-group');
			var type = group.find('input').attr('type')
			if(type == 'password'){
				group.find('input').attr('type','text').focus()
				$(this).html('<i class="fa fa-eye"></i>')
			}else{
				group.find('input').attr('type','password').focus()
				$(this).html('<i class="fa fa-eye-slash"></i>')
			}
		})
		$('#cab-form').submit(function(e){









			e.preventDefault();
            var _this = $(this)
			 $('.err-msg').remove();
			start_loader();
			$.ajax({
				url:_base_url_+"classes/Master.php?f=save_cab",
				data: new FormData($(this)[0]),
                cache: false,
                contentType: false,
                processData: false,
                method: 'POST',
                type: 'POST',
                dataType: 'json',
				error:err=>{
					console.log(err)
					alert_toast("An error occured",'error');
					end_loader();
				},
				success:function(resp){
					if(typeof resp =='object' && resp.status == 'success'){
						location.href = "./?page=cabs/view_cab&id="+resp.id;
					}else if(resp.status == 'failed' && !!resp.msg){
                        var el = $('<div>')
                            el.addClass("alert alert-danger err-msg").text(resp.msg)
                            _this.prepend(el)
                            el.show('slow')
                            $("html, body").animate({ scrollTop: _this.closest('.card').offset().top }, "fast");
                            end_loader()
                    }else{
						alert_toast("An error occured",'error');
						end_loader();
                        console.log(resp)
					}
				}
			})
		})

        $('.summernote').summernote({
		        height: 200,
		        toolbar: [
		            [ 'style', [ 'style' ] ],
		            [ 'font', [ 'bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'clear'] ],
		            [ 'fontname', [ 'fontname' ] ],
		            [ 'fontsize', [ 'fontsize' ] ],
		            [ 'color', [ 'color' ] ],
		            [ 'para', [ 'ol', 'ul', 'paragraph', 'height' ] ],
		            [ 'table', [ 'table' ] ],
		            [ 'view', [ 'undo', 'redo', 'fullscreen', 'codeview', 'help' ] ]
		        ]
		    })
	})
</script> -->
