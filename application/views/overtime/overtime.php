<style>
  .modal-title{
    margin-top: -10px;
  }
</style>

<section class="section">
  <div class="section-header">
    <h1>Overtime</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Manage Overtime</h2>

    <div class="row">
      <div class="col-12">
        <div class="form-group">
          <?php if($this->session->userdata('level') != 'guest'){ ?>
          <a href="#" onclick="add_overtime()" class="btn btn-icon icon-left btn-primary"><i class="far fa-plus-square"></i> Add</a>
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
                    <th>Action</th>
                    <th>Overtime Type</th>
                    <th>Overtime Hours</th>
                    <th>Description</th>
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
<div class="modal fade" tabindex="-1" role="dialog" id="modal_overtime">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header bg-primary text-white">
        <h5 class="modal-title">Add Overtime</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" id="form_overtime">
          <div class="form-body">
            <input type="hidden" class="form-control" name="overtime_id">
            <div class="form-group">
              <label>Overtime Type</label>
              <input type="text" class="form-control" name="overtime_type">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Overtime Hours</label>
              <input type="text" class="form-control" name="overtime_hours">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Description</label>
              <textarea class="form-control" name="description"></textarea>
              <span class="invalid-feedback"></span>
            </div>
          </div>
        </form>
      </div>
      <div class="modal-footer bg-whitesmoke br">
        <button type="button" class="btn btn-secondary float-left" data-dismiss="modal">Close</button>
        <button type="button" onclick="save();" class="btn btn-primary float-right">Save</button>
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
          url: "<?php echo site_url('overtime/ajax_list')?>", // json datasource
          type: "POST"
        },
        "columnDefs": [{
          "orderable": false
        }],
      });

  });

  /* -- Action -- */
  function add_overtime() {
    save_method = 'add';
    $('.form-control').removeClass('is-invalid'); // clear error class
    $('#form_overtime')[0].reset();
    $('#modal_overtime').modal('show'); // show bootstrap modal
    $('.modal-title').text('Add overtime'); // Set Title to Bootstrap modal title
  }

  function get_overtime(overtime_id) {
    save_method = 'update';
    $('#form_overtime')[0].reset();
    $.ajax({
      url: "<?php echo site_url('overtime/get_overtime')?>/" + overtime_id,
      type: "GET",
      dataType: "JSON",
      success: function(data) {
        $('[name="overtime_id"]').val(data.overtime_id);
        $('[name="overtime_type"]').val(data.overtime_type);
        $('[name="overtime_hours"]').val(data.overtime_hours);
        $('[name="description"]').val(data.description);

        $('#modal_overtime').modal('show');
        $('.modal-title').text('Update Overtime');
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert('Error get data from ajax');
      }
    });
  }

  function save() {
    var url;
    if (save_method == 'add') {
      url = "<?php echo site_url('overtime/add_overtime')?>";
    } else {
      url = "<?php echo site_url('overtime/update_overtime')?>";
    }
    // ajax adding data to database
    $.ajax({
      url: url,
      type: "POST",
      data: $('#form_overtime').serialize(),
      dataType: "JSON",
      success: function(data, response) {
        if(data.status) //if success close modal and reload ajax table
        {
          //if success close modal and reload ajax table
          $('#modal_overtime').modal('hide');
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

  function delete_overtime(overtime_id) {

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
            url: "<?php echo site_url('overtime/delete_overtime')?>/" + overtime_id,
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
