<style>
  .modal-title{
    margin-top: -10px;
  }
</style>

<section class="section">
  <div class="section-header">
    <h1>Role Model</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Manage Role Model</h2>

    <div class="row">
      <div class="col-12">
        <div class="form-group">
          <a href="#" onclick="add_role_model()" class="btn btn-icon icon-left btn-outline-primary"><i class="far fa-plus-square"></i> Add</a>
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
                    <th>Report Code</th>
                    <th>Table</th>
                    <th>Field</th>
                    <th>From</th>
                    <th>To</th>
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
<div class="modal fade" tabindex="-1" role="dialog" id="modal_role_model">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header  bg-primary text-white">
        <h5 class="modal-title">Add Role Model</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" id="form_role_model">
          <input type="hidden" name="id">
          <div class="form-body">
            <div class="form-group">
              <label>Report Code</label>
              <input type="text" class="form-control" name="report_code">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Table</label>
              <input type="text" class="form-control" name="table">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Field</label>
              <input type="text" class="form-control" name="field">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>From</label>
              <input type="text" class="form-control" name="from">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>To</label>
              <input type="text" class="form-control" name="to">
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
          url: "<?php echo site_url('role_model/ajax_list')?>", // json datasource
          type: "POST"
        },
        "columnDefs": [{
          "orderable": false
        }],
      });

  });

  /* -- Action -- */
  function add_role_model() {
    save_method = 'add';
    $('.form-control').removeClass('is-invalid'); // clear error class
    $('#form_role_model')[0].reset();
    $('#modal_role_model').modal('show'); // show bootstrap modal
    $('.modal-title').text('Add role_model'); // Set Title to Bootstrap modal title
  }

  function get_role_model(id) {
    save_method = 'update';
    $('#form_role_model')[0].reset();
    $.ajax({
      url: "<?php echo site_url('role_model/get_role_model')?>/" + id,
      type: "GET",
      dataType: "JSON",
      success: function(data) {
        $('[name="id"]').val(data.id);
        $('[name="report_code"]').val(data.report_code);
        $('[name="table"]').val(data.table);
        $('[name="field"]').val(data.field);
        $('[name="from"]').val(data.from);
        $('[name="to"]').val(data.to);

        $('#modal_role_model').modal('show');
        $('.modal-title').text('Update role_model');
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert('Error get data from ajax');
      }
    });
  }

  function save() {
    var url;
    if (save_method == 'add') {
      url = "<?php echo site_url('role_model/add_role_model')?>";
    } else {
      url = "<?php echo site_url('role_model/update_role_model')?>";
    }
    // ajax adding data to database
    $.ajax({
      url: url,
      type: "POST",
      data: $('#form_role_model').serialize(),
      dataType: "JSON",
      success: function(data, response) {
        if(data.status) //if success close modal and reload ajax table
        {
          $('#btnSave').text('save'); //change button text
          $('#btnSave').attr('disabled',false); //set button enable 
          //if success close modal and reload ajax table
          $('#modal_role_model').modal('hide');
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

  function delete_role_model(id) {
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
            url: "<?php echo site_url('role_model/delete_role_model')?>/" + id,
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
