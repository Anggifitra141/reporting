<style>
  .modal-title{
    margin-top: -10px;
  }
</style>
<section class="section">
  <div class="section-header">
    <h1>Leave</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Manage Leave</h2>

    <div class="row">
      <div class="col-12">
        <div class="form-group">
          <?php if($this->session->userdata('level') != 'guest'){ ?>
          <a href="#" onclick="add_leave()" class="btn btn-icon icon-left btn-primary"><i class="far fa-plus-square"></i> Add</a>
          <?php }?>
          <a href="#" class="btn btn-icon icon-left btn-warning"><i class="fa fa-filter"></i> Filter</a>
          <a href="#" class="btn btn-icon icon-left btn-success"><i class="fas fa-download"></i> Download </a>
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
                    <th width="70px">Action</th>
                    <th>leave Type</th>
                    <th>Description</th>
                    <th>Number Of Days</th>
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
<div class="modal fade" tabindex="-1" role="dialog" id="modal_leave">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header bg-primary text-white">
        <h5 class="modal-title">Add leave</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" id="form_leave">
          <div class="form-body">
            <input type="hidden" class="form-control" name="leave_id">
            <div class="form-group">
              <label>leave Type</label>
              <input type="text" class="form-control" name="leave_type">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Number Of Days</label>
              <input type="number" class="form-control" name="number_of_days">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Description</label>
              <textarea class="form-control" name="description">
              </textarea>
            </div>
          </div>
        </form>
      </div>
      <div class="modal-footer bg-whitesmoke br">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" onclick="save();" class="btn btn-primary">Save</button>
      </div>
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
  $("textarea").change(function(){
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
          url: "<?php echo site_url('leave/ajax_list')?>", // json datasource
          type: "POST"
        },
        "columnDefs": [{
          "orderable": false
        }],
      });

  });

  /* -- Action -- */
  function add_leave() {
    save_method = 'add';
    $('#form_leave')[0].reset();
    $('.form-control').removeClass('is-invalid'); // clear error class
    $('#modal_leave').modal('show'); // show bootstrap modal
    //$('.modal-title').text('Add Person'); // Set Title to Bootstrap modal title
  }

  function get_leave(leave_id) {
    save_method = 'update';
    $('#form_leave')[0].reset();
    $.ajax({
      url: "<?php echo site_url('leave/get_leave')?>/" + leave_id,
      type: "GET",
      dataType: "JSON",
      success: function(data) {

        $('[name="leave_id"]').val(data.leave_id);
        $('[name="leave_type"]').val(data.leave_type);
        $('[name="description"]').val(data.description);
        $('[name="number_of_days"]').val(data.number_of_days);

        $('#modal_leave').modal('show');
        $('.modal-title').text('Update leave');
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert('Error get data from ajax');
      }
    });
  }

  function save() {
    var url;
    if (save_method == 'add') {
      url = "<?php echo site_url('leave/add_leave')?>";
    } else {
      url = "<?php echo site_url('leave/update_leave')?>";
    }
    // ajax adding data to database
    $.ajax({
      url: url,
      type: "POST",
      data: $('#form_leave').serialize(),
      dataType: "JSON",
      success: function(data, response) {
        if(data.status) //if success close modal and reload ajax table
        {
          //if success close modal and reload ajax table
          $('#modal_leave').modal('hide');
          iziToast.success({
            title: 'Success !',
            message: 'Data saved successfully ',
            position: 'topRight'
          });
          $('#table').DataTable().ajax.reload();
          // location.reload();// for reload a page
        }else{
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

  function delete_leave(leave_id) {

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
            url: "<?php echo site_url('leave/delete_leave')?>/" + leave_id,
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
  }
</script>
