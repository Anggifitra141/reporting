<style>
  .modal-title{
    margin-top: -10px;
  }
</style>

<section class="section">
  <div class="section-header">
    <h1>User</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Manage User</h2>

    <div class="row">
      <div class="col-12">
        <div class="form-group">
          <a href="#" onclick="add_user()" class="btn btn-icon icon-left btn-outline-primary"><i class="far fa-plus-square"></i> Add</a>
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
                    <th style="width: 80px;">Action</th>
                    <th>Username</th>
                    <th>fullname</th>
                    <th>User Group</th>
                    <th>Join Date</th>
                    <th>Status</th>
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
<div class="modal fade" tabindex="-1" role="dialog" id="modal_user">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header  bg-primary text-white">
        <h5 class="modal-title">Add User</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" id="form_user">
          <input type="hidden" name="id">
          <div class="form-body">
            <div class="form-group">
              <label>Username</label>
              <input type="text" class="form-control" name="username">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Password</label>
              <input type="password" class="form-control" name="password">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Fullname</label>
              <input type="text" class="form-control" name="fullname">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>User Group :</label><br>
              <select name="user_group" id="user_group" class="form-control">
              <option value="">-- Choose User Group --</option>
                <?php foreach($user_group as $key): ?>
                <option value="<?= $key->group_name ?>"><?= $key->group_name ?></option>
                <?php endforeach; ?>
              </select>
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Status :</label><br>
              <select name="status" id="status" class="form-control">
                <option value="">-- Choose Status --</option>
                <option value="active"> ACTIVE </option>
                <option value="no_active"> NO ACTIVE </option>
              </select>
              <span class="invalid-feedback"></span>
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
  $('#nav-user').addClass('active');

  $("input").change(function(){
      $(this).removeClass('is-invalid');
      $(this).next().empty();
  });
  $(document).ready(function() {

    var table = $('#table').DataTable({
        "deferRender": true,
        "scrollCollapse": false,
        "scrollX": false,
        "processing": true,
        "serverSide": true,
        "order": [],
        "ajax": {
          url: "<?php echo site_url('user/ajax_list')?>", // json datasource
          type: "POST"
        },
        "columnDefs": [{
          "orderable": false
        }],
      });

  });

  /* -- Action -- */
  function add_user() {
    save_method = 'add';
    cek_privileges('add', event);
    $('.form-control').removeClass('is-invalid'); // clear error class
    $('#form_user')[0].reset();
    $('#modal_user').modal('show'); // show bootstrap modal
    $('.modal-title').text('Add user'); // Set Title to Bootstrap modal title
  }

  function get_user(id) {
    cek_privileges('update', event);
    save_method = 'update';
    $('#form_user')[0].reset();
    $.ajax({
      url: "<?php echo site_url('user/get_user')?>/" + id,
      type: "GET",
      dataType: "JSON",
      success: function(data) {
        $('[name="id"]').val(data.id);
        $('[name="username"]').val(data.username);
        $('[name="fullname"]').val(data.fullname);
        $('[name="user_group"]').val(data.user_group);
        $('[name="status"]').val(data.status);

        $('#modal_user').modal('show');
        $('.modal-title').text('Update user');
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert('Error get data from ajax');
      }
    });
  }

  function save() {
    var url;
    if (save_method == 'add') {
      url = "<?php echo site_url('user/add_user')?>";
    } else {
      url = "<?php echo site_url('user/update_user')?>";
    }
    // ajax adding data to database
    $.ajax({
      url: url,
      type: "POST",
      data: $('#form_user').serialize(),
      dataType: "JSON",
      success: function(data, response) {
        if(data.status) //if success close modal and reload ajax table
        {
          $('#btnSave').text('save'); //change button text
          $('#btnSave').attr('disabled',false); //set button enable 
          //if success close modal and reload ajax table
          $('#modal_user').modal('hide');
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

  function delete_user(id) {
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
            url: "<?php echo site_url('user/delete_user')?>/" + id,
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
