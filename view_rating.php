<?php
require_once('./config.php');
if(isset($_GET['id']) && $_GET['id'] > 0){
    $qry = $conn->query("SELECT * from `booking_list` where id = '{$_GET['id']}' ");
    if($qry->num_rows > 0){
        foreach($qry->fetch_assoc() as $k => $v){
            $$k=$v;
        }
        $qry2 = $conn->query("SELECT c.*, cc.name as category from `cab_list` c inner join category_list cc on c.category_id = cc.id where c.id = '{$cab_id}' ");
        if($qry2->num_rows > 0){
            foreach($qry2->fetch_assoc() as $k => $v){
                if(!isset($$k))
                $$k=$v;
            }
        }
    }
}
?>
<style>
    #uni_modal .modal-footer{
        display:none
    }
</style>
<!-- <div class="container-fluid">
    <div class="row">
        <div class="col-md-11">
            <fieldset class="bor">
                <dl>
                    <dt class="">Rate Points</dt>
                    <dd class="pl-5"><input type="number" name="" id=""></dd>
                    <dt class="">Feedback</dt>
                    <dd class="pl-5"><textarea name="" id="" cols="40" rows="3"></textarea></dd>
                    <dt class="">description </dt>
                    <dd class="pl-5"><textarea name="" id="" cols="40" rows="3"></textarea></dd>
                </dl>
            </fieldset>
        </div>
    </div>
    <div class="text-right">  
        <button class="btn btn-danger btn-flat bg-gradient-warning" type="button" id="cancel_booking">Rate</button>
        <button class="btn btn-dark btn-flat bg-gradient-dark" type="button" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
    </div>
</div> -->
<div class="container-fluid">
    <div class="row">
        <div class="col-md-11">
            <form method="post" action="process.php">
                <fieldset class="bor">
                    <dl>
                        <dt class="">Rate Points</dt>
                        <dd class="pl-5"><input type="number" name="rating" id="rating"></dd>
                        <dt class="">Feedback</dt>
                        <dd class="pl-5"><textarea name="description" id="description" cols="40" rows="3"></textarea></dd>
                    </dl>
                </fieldset>
                <div class="text-right">  
                    <button class="btn btn-danger btn-flat bg-gradient-warning" type="submit" name="submit_rate">Rate</button>
                    <button class="btn btn-dark btn-flat bg-gradient-dark" type="button" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    $(function(){
        $('#cancel_booking').click(function(){
            _conf("Are you sure to cancel your cab booking [Ref. Code: <b><?= isset($ref_code) ? $ref_code : "" ?></b>]?", "cancel_booking",["<?= isset($id) ? $id : "" ?>"])
        })
    })
    function cancel_booking($id){
        start_loader();
		$.ajax({
			url:_base_url_+"classes/Master.php?f=update_booking_status",
			method:"POST",
			data:{id: $id,status:4},
			dataType:"json",
			error:err=>{
				console.log(err)
				alert_toast("An error occured.",'error');
				end_loader();
			},
			success:function(resp){
				if(typeof resp== 'object' && resp.status == 'success'){
					location.reload();
				}else{
					alert_toast("An error occured.",'error');
					end_loader();
				}
			}
		})
    }
</script>