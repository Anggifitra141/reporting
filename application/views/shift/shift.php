<style>
  .modal-title{
    margin-top: -10px;
  }
</style>

<section class="section">
  <div class="section-header">
    <h1>Shift</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Manage Shift</h2>

    <div class="row">
      <div class="col-12">
        <div class="form-group">
          <?php if($this->session->userdata('level') != 'guest'){ ?>
          <a href="#" onclick="add_shift()" class="btn btn-icon icon-left btn-primary"><i class="far fa-plus-square"></i> Add</a>
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
                    <th>shift Name</th>
                    <th>Hour Production</th>
                    <th>Start</th>
                    <th>End</th>
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
<div class="modal fade" tabindex="-1" role="dialog" id="modal_shift">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header  bg-primary text-white">
        <h5 class="modal-title">Add Shift</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" id="form_shift">
          <div class="form-body">
            <input type="hidden" class="form-control" name="shift_id">
            <div class="form-group">
              <label>Shift Name</label>
              <input type="text" class="form-control" name="shift_name">
              <span class="invalid-feedback"></span>
            </div>
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label>Start</label>
                    <input type="time" class="form-control" name="start">
                    <span class="invalid-feedback"></span>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label>End</label>
                    <input type="time" class="form-control" name="end">
                    <span class="invalid-feedback"></span>
                </div>
              </div>
            </div>
            
            <div class="form-group">
              <label>Hour Production</label>
              <input type="text" class="form-control" name="hour_production" readonly>
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

<link rel="stylesheet" href="<?php echo base_url(); ?>assets/modules/bootstrap-timepicker/css/bootstrap-timepicker.min.css">
<script src="<?php echo base_url(); ?>assets/modules/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
<script>
  

   // Timepicker
   if(jQuery().timepicker && $(".timepicker").length) {
    $(".timepicker").timepicker({
      icons: {
        up: 'fas fa-chevron-up',
        down: 'fas fa-chevron-down'
      }
    });
  }

  function calculate() {
     var time1 = $('[name="start"]').val().split(':'), time2 = $('[name="end"]').val().split(':');
     var hours1 = parseInt(time1[0], 10), 
         hours2 = parseInt(time2[0], 10),
         mins1 = parseInt(time1[1], 10),
         mins2 = parseInt(time2[1], 10);
     var hours = hours2 - hours1, mins = 0;

     // get hours
     if(hours < 0) hours = 24 + hours;

     // get minutes
     if(mins2 >= mins1) {
         mins = mins2 - mins1;
     }
     else {
         mins = (mins2 + 60) - mins1;
         hours--;
     }

     // convert to fraction of 60
     mins = mins / 60; 

     hours += mins;
     hours = hours.toFixed(2);
     $('[name="hour_production"]').val(hours);
 }
  $('[name="start"]').change(function() {
    if($('[name="start"]').val() && $('[name="end"]').val()){
      calculate();
    }
  });
  $('[name="end"]').change(function() {
    if($('[name="start"]').val() && $('[name="end"]').val()){
      calculate();
    }
  });
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
          url: "<?php echo site_url('shift/ajax_list')?>", // json datasource
          type: "POST"
        },
        "columnDefs": [{
          "orderable": false
        }],
      });

  });

  /* -- Action -- */
  function add_shift() {
    save_method = 'add';
    $('.form-control').removeClass('is-invalid'); // clear error class
    $('#form_shift')[0].reset();
    $('#modal_shift').modal('show'); // show bootstrap modal
    $('.modal-title').text('Add Shift'); // Set Title to Bootstrap modal title
  }

  function get_shift(shift_id) {
    save_method = 'update';
    $('#form_shift')[0].reset();
    $.ajax({
      url: "<?php echo site_url('shift/get_shift')?>/" + shift_id,
      type: "GET",
      dataType: "JSON",
      success: function(data) {

        $('[name="shift_id"]').val(data.shift_id);
        $('[name="shift_name"]').val(data.shift_name);
        $('[name="hour_production"]').val(data.hour_production);
        $('[name="start"]').val(data.start);
        $('[name="end"]').val(data.end);

        $('#modal_shift').modal('show');
        $('.modal-title').text('Update Shift');
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert('Error get data from ajax');
      }
    });
  }

  function save() {
    var url;
    if (save_method == 'add') {
      url = "<?php echo site_url('shift/add_shift')?>";
    } else {
      url = "<?php echo site_url('shift/update_shift')?>";
    }
    // ajax adding data to database
    $.ajax({
      url: url,
      type: "POST",
      data: $('#form_shift').serialize(),
      dataType: "JSON",
      success: function(data, response) {
        if(data.status) //if success close modal and reload ajax table
        {
          $('#btnSave').text('save'); //change button text
          $('#btnSave').attr('disabled',false); //set button enable 
          //if success close modal and reload ajax table
          $('#modal_shift').modal('hide');
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

  function delete_shift(shift_id) {

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
            url: "<?php echo site_url('shift/delete_shift')?>/" + shift_id,
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
