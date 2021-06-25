<style>
  .modal-title{
    margin-top: -10px;
  }
</style>

<section class="section">
  <div class="section-header">
    <h1>User Group</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Manage User Group</h2>

    <div class="row">
      <div class="col-12">
        <div class="form-group">
          <a href="#" onclick="add_user_group()" class="btn btn-icon icon-left btn-outline-primary"><i class="far fa-plus-square"></i> Add</a>
          <a href="#" class="btn btn-icon icon-left btn-outline-warning"><i class="fa fa-filter"></i> Filter</a>
          <a href="#" class="btn btn-icon icon-left btn-outline-success"><i class="fas fa-download"></i> Download </a>
        </div>
        <div class="card">
          <div class="card-body">
            <div class="">
              <table class="table table-striped" id="table" style="width: 100%;">
                <thead>
                  <tr>
                    <th class="text-center" width="1px">
                      No
                    </th>
                    <th>Action</th>
                    <th>Group Name</th>
                  </tr>
                </thead>

              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Modal -->
<div class="modal fade" tabindex="-1" role="dialog" id="modal_user_group">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header  bg-primary text-white">
        <h5 class="modal-title">Add User Group</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" id="form_user_group">
          <div class="form-body">
            <input type="hidden" class="form-control" name="user_group_id">
            <div class="form-group">
              <label>Group Name</label>
              <input type="text" class="form-control" name="group_name">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Allowed Actions :</label><br>
              <label for="add-action"><input type="checkbox" id="add-action" name="action[]" value="add"> Add&ensp;</label>
              <label for="update-action"><input type="checkbox" id="update-action" name="action[]" value="update"> Edit&ensp;</label>
              <label for="delete-action"><input type="checkbox" id="delete-action" name="action[]" value="delete"> Delete&ensp;</label>
              <label for="view-action"><input type="checkbox" id="view-action" name="action[]" value="view"> View Only&ensp;</label>
              <label for="download-action"><input type="checkbox" id="download-action" name="action[]" value="download"> Download&ensp;</label>
            </div>
            <div class="row">
              <div class="col-sm-2">
                <div class="form-group">
                  <label>Allowed Menus :</label>
                </div>
              </div>
						<div class="col-sm-3">
							<label>Regulator Management<br>
              ├──<input type="checkbox" id="dashboard_regulator" name="access[]" value="dashboard_regulator"> Dashboard<br>
							├──<input type="checkbox" id="verification" name="access[]" value="verification"> Verification<br>
							├──<input type="checkbox" id="report_legulator" name="access[]" value="report_legulator"> Report<br>
							├──<input type="checkbox" id="archive" name="access[]" value="archive"> Archive<br>
							└──<input type="checkbox" id="user_activity_regulator" name="access[]" value="user_activity_regulator"> User Activity
							</label>
						</div>
            <div class="col-sm-3">
							<label>Data Source<br>
              ├──<input type="checkbox" id="upload_source" name="access[]" value="upload_source"> Upload Source<br>
							├──<input type="checkbox" id="raw_data" name="access[]" value="raw_data"> Raw Data<br>
							└──<input type="checkbox" id="data_clean" name="access[]" value="data_clean"> Data Clean
							</label>
						</div>
						<div class="col-sm-3">
							<label>Document Management<br>
							├──<input type="checkbox" id="dashboard_document" name="access[]" value="dashboard_document"> Dashboard<br>
							├──<input type="checkbox" id="document" name="access[]" value="document"> Document<br>
							├──<input type="checkbox" id="report_document" name="access[]" value="report_document"> Report<br>
							├──<input type="checkbox" id="version" name="access[]" value="version"> Version<br>
							└──<input type="checkbox" id="user_activity_document" name="access[]" value="user_activity_document"> User Activity<br>
							</label>
						</div>
          </div>
          <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-3 col-sm-offset-2">
							<label>System Setting<br>
							├──<input type="checkbox" id="user" name="access[]" value="user"> User<br>
							├──<input type="checkbox" id="user_group" name="access[]" value="user_group"> User Group<br>
							└──<input type="checkbox" id="master_data" name="access[]" value="master_data"> Master Data<br>
							</label>
						</div>
					</div>
            
          </div>
        </form>
      </div>
      <div class="modal-footer bg-whitesmoke br">
        <button type="button" class="btn btn-secondary float-left" data-dismiss="modal">Close</button>
        <button type="button" onclick="save();" class="btn btn-outline-primary float-right">Save</button>
      </div>
    </div>
  </div>
</div>

<script src="<?php echo base_url(); ?>assets/modules/jquery.min.js"></script>
<script>
  

  $("input").change(function(){
      $(this).removeClass('is-invalid');
      $(this).next().empty();
  });
  $(document).ready(function() {

    var table = $('#table').DataTable({
        "deferRender": true,
        "scrollCollapse": true,
        "scrollX": true,
        "processing": true,
        "serverSide": true,
        "order": [],
        "ajax": {
          url: "<?php echo site_url('user_group/ajax_list')?>", // json datasource
          type: "POST"
        },
        "columnDefs": [{
          "orderable": false
        }],
      });

  });

  /* -- Action -- */
  function add_user_group() {
    save_method = 'add';
    $('.form-control').removeClass('is-invalid'); // clear error class
    $('#form_user_group')[0].reset();
    $('#modal_user_group').modal('show'); // show bootstrap modal
    $('.modal-title').text('Add User Group'); // Set Title to Bootstrap modal title
  }

  function get_user_group(user_group_id) {
    save_method = 'update';
    $('#form_user_group')[0].reset();
    $.ajax({
      url: "<?php echo site_url('user_group/get_user_group')?>/" + user_group_id,
      type: "GET",
      dataType: "JSON",
      success: function(data) {
        var access = data.access.split('#');
				var actions = data.action;
        $('[name="access[]"]').attr('checked', false)
        for (i = 0; i < access.length; i++) {
          $('#' + access[i]).attr('checked', true)
        }
        
        

        $('[name="user_group_id"]').val(data.user_group_id);
        $('[name="group_name"]').val(data.group_name);
        
        if(actions.match(/add/g)){ $('#add-action').attr('checked', true); }else{ $('#add-action').attr('checked', false); }
				if(actions.match(/update/g)){ $('#update-action').attr('checked', true); }else{ $('#update-action').attr('checked', false); }
				if(actions.match(/delete/g)){ $('#delete-action').attr('checked', true); }else{ $('#delete-action').attr('checked', false); }
				if(actions.match(/view/g)){ $('#view-action').attr('checked', true); }else{ $('#view-action').attr('checked', false); }
				if(actions.match(/download/g)){ $('#download-action').attr('checked', true); }else{ $('#download-action').attr('checked', false); }

        $('#modal_user_group').modal('show');
        $('.modal-title').text('Update user_group');
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert('Error get data from ajax');
      }
    });
  }

  function save() {
    var url;
    if (save_method == 'add') {
      url = "<?php echo site_url('user_group/add_user_group')?>";
    } else {
      url = "<?php echo site_url('user_group/update_user_group')?>";
    }
    // ajax adding data to database
    $.ajax({
      url: url,
      type: "POST",
      data: $('#form_user_group').serialize(),
      dataType: "JSON",
      success: function(data, response) {
        if(data.status) //if success close modal and reload ajax table
        {
          $('#btnSave').text('save'); //change button text
          $('#btnSave').attr('disabled',false); //set button enable 
          //if success close modal and reload ajax table
          $('#modal_user_group').modal('hide');
          iziToast.success({
            title: 'Success !',
            message: 'Data saved successfully ',
            position: 'topRight'
          });
          $('#table').DataTable().ajax.reload();
          // location.reload();// for reload a page
        }
        else
        {
            for (var i = 0; i < data.inputerror.length; i++) 
            {
                $('[name="'+data.inputerror[i]+'"]').addClass('is-invalid'); //select parent twice to select div form-group class and add has-error class
                $('[name="'+data.inputerror[i]+'"]').next().text(data.error_string[i]); //select span help-block class set text error string
            }
        }
      },
      error: function(jqXHR, textStatus, errorThrown) {
        iziToast.danger({
          title: 'Error !',
          message: 'Please try again',
          position: 'topRight'
        });
      }
    });
  }

  function delete_user_group(user_group_id) {
    var event = "<?php echo $this->session->userdata('action'); ?>";
    console.log(event)
		if(event.match(/delete/g)){
      swal({
        title: "Are you sure ?",
        text: "Once deleted, you will not be able to recover this data !",
        icon: "warning",
        buttons: true,
        dangerMode: true,
      })
      .then((willDelete) => {
        if (willDelete) {
          $.ajax({
            url: "<?php echo site_url('user_group/delete_user_group')?>/" + user_group_id,
            type: "post",
            complete: function() {
              swal("Your data has been deleted!", {
                icon: "success",
              }).then(function() {
                $('#table').DataTable().ajax.reload();
              });
            }
          });

        } else {
          swal("Data failed deleted !");
        }
      });
    }else{
        iziToast.error({
          title: 'Error !',
          message: 'You have no right to this action.',
          position: 'bottomCenter'
        });
    }
  }
</script>
