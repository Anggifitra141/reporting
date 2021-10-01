<style>
  .modal-title{
    margin-top: -10px;
  }
</style>

<section class="section">
  <div class="section-header">
    <h1>Data System Availability</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Manage Data System Availability</h2>
    
    <div class="row">
      <div class="col-12">
        <div class="form-group">
        <a href="#" onclick="add_sys_availability_pic()" class="btn btn-icon icon-left btn-outline-primary"><i class="far fa-plus-square"></i> Add PIC</a>
          <a href="#" onclick="add_availability_system()" class="btn btn-icon icon-left btn-outline-success"><i class="far fa-file-square"></i> Add Availability Sistem</a>
          <!-- <a href="<?= base_url('assets/template-excel/template-import-qris-merchant.xlsx') ?>" download class="btn float-right btn-icon icon-left btn-success"><i class="fas fa-download"></i> Download Sample</a> -->
        </div>
      </div>
      <div class="col-12">
        <div class="card">
          <div class="card-header">
            <ul class="nav nav-pills" id="myTab3" role="tablist">
              <li class="nav-item">
                <a class="nav-link active" id="pic-tab3" data-toggle="tab" href="#pic3" role="tab" aria-controls="pic" aria-selected="true">PIC</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="gangguan-system-tab3" data-toggle="tab" href="#gangguan-system3" role="tab" aria-controls="gangguan-system" aria-selected="false">Gangguan System </a>
              </li>
              <!-- <li class="nav-item">
                <a class="nav-link" id="availability-tab3" data-toggle="tab" href="#availability3" role="tab" aria-controls="availability" aria-selected="false">Form 3 Availability</a>
              </li> -->
            </ul>
          </div>
          <div class="card-body mb-2">
            <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label>Date Range</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <div class="input-group-text">
                          <i class="fas fa-calendar"></i>
                        </div>
                      </div>
                      <input type="text" class="form-control daterange-picker" name="daterange">
                    </div>
                  </div>
                </div>
                <div class="col-md-2">
                  <a href=""  class="btn btn-icon btn-outline-success btn-block" style="margin-top:27px;" id="btn-download-excel"><i class="fas fa-file-excel"></i> Download Excel </a>
                </div>
              </div>
              <div class="tab-content" id="myTabContent2">
              <div class="tab-pane fade show active" id="pic3" role="tabpanel" aria-labelledby="pic-tab3">
                <div class="row" >
                  <div class="col-md-12">
                    <div class="">
                      <table class="table table-striped" id="table-pic" style="width: 100%;">
                        <thead>
                          <tr>
                            <th class="text-center" width="1px">
                              No
                            </th>
                            <th>Action</th>
                            <th>Name</th>
                            <th>Division</th>
                            <th>Email</th>
                            <th>Phone Number</th>
                          </tr>
                        </thead>

                      </table>
                    </div>
                  </div>
                </div>
              </div>
              <div class="tab-pane fade" id="gangguan-system3" role="tabpanel" aria-labelledby="gangguan-system-tab3">
                <div class="row" >
                  <div class="col-md-12">
                    <div class="">
                      <table class="table table-striped" id="table-system" style="width: 100%;">
                        <thead>
                          <tr>
                            <th class="text-center" width="1px">
                              No
                            </th>
                            <th>Action</th>
                            <th>Service - Infrastructure</th>
                            <th>PIC</th>
                            <th>Threshold</th>
                            <th>Availibility</th>
                            <th>Notes</th>
                            <th>Date Input</th>
                          </tr>
                        </thead>

                      </table>
                    </div>
                  </div>
                </div>
              </div>
              <div class="tab-pane fade" id="availability3" role="tabpanel" aria-labelledby="availability-tab3">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- Modal -->
<div class="modal fade" tabindex="-1" role="dialog" id="modal_sys_availability">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header  bg-primary text-white">
        <h5 class="modal-title"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" id="sys_availability">
          <input type="hidden" name="id">
          <div class="form-body">
            <div class="form-group">
              <label>Name</label>
              <input type="text" class="form-control" name="name">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Division</label>
              <input type="text" class="form-control" name="division">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Email</label>
              <input type="text" class="form-control" name="email">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Phone Number</label>
              <input type="number" class="form-control" name="phone_number">
              <span class="invalid-feedback"></span>
            </div>
          </div>
        </form>
      </div>
      <div class="modal-footer bg-whitesmoke br">
        <button type="button" class="btn btn-secondary float-left" data-dismiss="modal">Close</button>
        <button type="button" onclick="save_pic();" class="btn btn-outline-primary float-right">Save</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" tabindex="-1" role="dialog" id="modal_sys_availability_system">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header  bg-primary text-white">
        <h5 class="modal-title"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" id="sys_availability_system">
          <input type="hidden" name="id_system">
          <div class="form-body">
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label>Service</label>
                  <select name="id_service" id="id_service" class="form-control">
                    <option value=""> -- SELECT SERVICE -- </option>
                    <?php foreach($service as $key) : ?>
                      <option value="<?= $key->id ?>"><?= $key->service .' - '. $key->infrastructure ?></option>
                    <?php endforeach; ?>
                  </select>
                  <span class="invalid-feedback"></span>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label>PIC</label>
                  <select name="id_pic" id="id_pic" class="form-control">
                    <option value=""> -- SELECT PIC -- </option>
                    <?php foreach($pic as $key) : ?>
                      <option value="<?= $key->id ?>"><?= $key->name .' - '. $key->division ?></option>
                    <?php endforeach; ?>
                  </select>
                  <span class="invalid-feedback"></span>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label>Threshold <b class="text-danger">%</b></label>
                  <input type="text" class="form-control cek_shold" name="threshold">
                  <span class="invalid-feedback"></span>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label>Availibility <b class="text-danger">%</b></label>
                  <input type="text" class="form-control cek_shold" name="availibility">
                  <span class="invalid-feedback"></span>
                </div>
              </div>
            </div>
            <div class="form-group">
              <label>Keterangan</label>
              <textarea name="notes" id="notes" class="form-control"></textarea>
              <span class="invalid-feedback"></span>
            </div>

            <div id="problem" style="display: none;">
              <hr style="margin-top: 4rem; border: 1px solid #454545;">
              <i>*) Problem</i>
              <div class="form-group">
                <label>Kategori Gangguan</label>
                <input type="text" class="form-control" name="problem_category">
                <span class="invalid-feedback"></span>
              </div>
              <div class="form-group">
                <label>Waktu Kejadian</label>
                <input type="text" class="form-control" name="problem_datetime">
                <span class="invalid-feedback"></span>
              </div>
              <div class="form-group">
                <label>Hasil Investigasi Permasalahan</label>
                <input type="text" class="form-control" name="result">
                <span class="invalid-feedback"></span>
              </div>
              <div class="form-group">
                <label>Upaya Perbaikan</label>
                <input type="text" class="form-control" name="repair">
                <span class="invalid-feedback"></span>
              </div>
              <div class="form-group">
                <label>Keterangan Upaya</label>
                <input type="text" class="form-control" name="repair_notes">
                <span class="invalid-feedback"></span>
              </div>
              <div class="form-group">
                <label>Durasi Penyelesaian</label>
                <input type="text" class="form-control" name="repair_duration">
                <span class="invalid-feedback"></span>
              </div>
              <div class="form-group">
                <label>Status Penyelesaian</label>
                <input type="text" class="form-control" name="repair_status">
                <span class="invalid-feedback"></span>
              </div>
              <div class="form-group">
                <label>Severity Level</label>
                <input type="text" class="form-control" name="severity_level">
                <span class="invalid-feedback"></span>
              </div>
              <div class="form-group">
                <label>Dampak Insiden / Gangguan </label>
                <input type="text" class="form-control" name="problem_impact">
                <span class="invalid-feedback"></span>
              </div>
              <div class="form-group">
                <label>Keterangan</label>
                <textarea name="notes_problem" id="notes_problem" class="form-control"></textarea>
                <span class="invalid-feedback"></span>
              </div>
            </div>


          </div>
        </form>
      </div>
      <div class="modal-footer bg-whitesmoke br">
        <button type="button" class="btn btn-secondary float-left" data-dismiss="modal">Close</button>
        <button type="button" onclick="save_system();" class="btn btn-outline-primary float-right">Save</button>
      </div>
    </div>
  </div>
</div>



<script src="<?php echo base_url(); ?>assets/modules/jquery.min.js"></script>
<script>
var table_pic;
var table_system;
var base_url = "<?= base_url() ?>";
$('#nav-report').addClass('dropdown active');
$('#nav-sys-availability-report').addClass('active');
  $("input").change(function(){
      $(this).removeClass('is-invalid');
      $(this).next().empty();
  });
  $(document).ready(function() {

    table_pic = $('#table-pic').DataTable({
      "deferRender": true,
      "scrollCollapse": true,
      "scrollX": true,
      "processing": true,
      "serverSide": true,
      "order": [],
      "ajax": {
        url: "<?php echo site_url('clean/ajax_availability_pic')?>", // json dataclean
        type: "POST"
      },
      "columnDefs": [{
        "orderable": false
      }],
    });

    table_system = $('#table-system').DataTable({
      "deferRender": true,
      "scrollCollapse": true,
      "scrollX": true,
      "processing": true,
      "serverSide": true,
      "order": [],
      "ajax": {
        url: "<?php echo site_url('clean/ajax_availability_system')?>", // json dataclean
        type: "POST",
          data: function(data) {
            data.daterange = $('[name="daterange"]').val()
          }
      },
      "columnDefs": [{
        "orderable": false
      }],
    });
  

  });
  const showLoading = function() {
  swal({
    title: 'Now loading',
    allowEscapeKey: false,
    allowOutsideClick: false,
    timer: 2000,
    onOpen: () => {
      swal.showLoading();
    }
  }).then(
    () => {},
    (dismiss) => {
      if (dismiss === 'timer') {
        console.log('closed by timer!!!!');
        swal({ 
          title: 'Finished!',
          type: 'success',
          timer: 2000,
          showConfirmButton: false
        })
      }
    }
  )
};

$('[name="daterange"]').change(function(){
  reload_table();
  $('#btn-download-excel').attr('href', base_url + 'report/download_excel_availability?&daterange=' + $('[name="daterange"]').val());
});


function add_sys_availability_pic() {
    save_method = 'add';
    cek_privileges('add', event);
    $('.form-control').removeClass('is-invalid'); // clear error class
    $('#sys_availability')[0].reset();
    $('#modal_sys_availability').modal('show'); // show bootstrap modal
    $('.modal-title').text('Tambah PIC System Avalability'); // Set Title to Bootstrap modal title
  }
  function get_form_pic(id) {
    cek_privileges('update', event);
    save_method = 'update';
    $('#sys_availability')[0].reset();
    $.ajax({
      url: "<?php echo site_url('clean/get_availability_pic') ?>/" + id,
      type: "GET",
      dataType: "JSON",
      success: function(data) {
        $('[name="id"]').val(data.id);
        $('[name="name"]').val(data.name);
        $('[name="division"]').val(data.division);
        $('[name="email"]').val(data.email);
        $('[name="phone_number"]').val(data.phone_number);

        $('#modal_sys_availability').modal('show');
        $('.modal-title').text('Update PIC System Avalability');
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert('Error get data from ajax');
      }
    });
  }
  function reload_table() {
    table_pic.ajax.reload(null, false);
    table_system.ajax.reload(null, false);
  }
function loading()
{
  swal({
          title:"Please Wait.", 
          text:"Loading...",
          icon: base_url + 'assets/img/loading.gif',
          buttons: false,      
          // closeOnClickOutside: false,
          // timer: 3000,
          //icon: "success"
      })
}
function save_pic() {
    var url;
    if (save_method == 'add') {
      url = "<?php echo site_url('clean/add_availability_pic') ?>";
    } else {
      url = "<?php echo site_url('clean/update_availability_pic') ?>";
    }
    // ajax adding data to database
    $.ajax({
      url: url,
      type: "POST",
      data: $('#sys_availability').serialize(),
      dataType: "JSON",
      success: function(data, response) {
        if (data.status) //if success close modal and reload ajax table
        {
          $('#btnSave').text('save'); //change button text
          $('#btnSave').attr('disabled', false); //set button enable 
          //if success close modal and reload ajax table
          $('#modal_sys_availability').modal('hide');
          iziToast.success({
            title: 'Success !',
            message: 'Data saved successfully ',
            position: 'topRight'
          });
          reload_table();
          // location.reload();// for reload a page
        } else {
          for (var i = 0; i < data.inputerror.length; i++) {
            $('[name="' + data.inputerror[i] + '"]').addClass('is-invalid'); //select parent twice to select div form-group class and add has-error class
            $('[name="' + data.inputerror[i] + '"]').next().text(data.error_string[i]); //select span help-block class set text error string
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

  function save_system() {
    var url;
    if (save_method == 'add') {
      url = "<?php echo site_url('clean/add_availability_system') ?>";
    } else {
      url = "<?php echo site_url('clean/update_availability_system') ?>";
    }
    // ajax adding data to database
    $.ajax({
      url: url,
      type: "POST",
      data: $('#sys_availability_system').serialize(),
      dataType: "JSON",
      success: function(data, response) {
        if (data.status) //if success close modal and reload ajax table
        {
          $('#btnSave').text('save'); //change button text
          $('#btnSave').attr('disabled', false); //set button enable 
          //if success close modal and reload ajax table
          $('#modal_sys_availability_system').modal('hide');
          iziToast.success({
            title: 'Success !',
            message: 'Data saved successfully ',
            position: 'topRight'
          });
          reload_table();
          // location.reload();// for reload a page
        } else {
          for (var i = 0; i < data.inputerror.length; i++) {
            $('[name="' + data.inputerror[i] + '"]').addClass('is-invalid'); //select parent twice to select div form-group class and add has-error class
            $('[name="' + data.inputerror[i] + '"]').next().text(data.error_string[i]); //select span help-block class set text error string
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

  function delete_form_pic(id) {
    cek_privileges('delete', event);
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
            url: "<?php echo site_url('clean/delete_availability_pic') ?>/" + id,
            type: "post",
            complete: function() {
              swal("Your data has been deleted!", {
                icon: "success",
              }).then(function() {
                reload_table();
              });
            }
          });

        } else {
          swal("Data failed deleted !");
        }
      });
  }

    $('.cek_shold').change(function(){
      var threshold = $('[name="threshold"]').val();
      var availibility = $('[name="availibility"]').val();
      if(threshold > 0 && availibility > 0 ){
        if(threshold > availibility){
          $('#problem').slideDown();
        }else{
          $('#problem').slideUp();
        }
      }else{
        $('#problem').slideUp();
      }
    })

  // AVAILABILITY SYSTEM
  function add_availability_system() {
    save_method = 'add';
    cek_privileges('add', event);
    $('.form-control').removeClass('is-invalid'); // clear error class
    $('#sys_availability_system')[0].reset();
    $('#modal_sys_availability_system').modal('show'); // show bootstrap modal
    $('.modal-title').text('Tambah Availability System'); // Set Title to Bootstrap modal title
  }
  function get_form_system(id) {
    cek_privileges('update', event);
    save_method = 'update';
    $('#sys_availability_system')[0].reset();
    $.ajax({
      url: "<?php echo site_url('clean/get_availability_system') ?>/" + id,
      type: "GET",
      dataType: "JSON",
      success: function(data) {
        $('[name="id_system"]').val(data.system.id);
        $('[name="id_service"]').val(data.system.id_service);
        $('[name="id_pic"]').val(data.system.id_pic);
        $('[name="threshold"]').val(data.system.threshold);
        $('[name="availibility"]').val(data.system.availibility);
        $('[name="notes"]').val(data.system.notes);

        if(data.system.threshold > data.system.availibility){
          $('#problem').show();
          $('[name="problem_category"]').val(data.problem.problem_category);
          $('[name="problem_datetime"]').val(data.problem.problem_datetime);
          $('[name="result"]').val(data.problem.result);
          $('[name="repair"]').val(data.problem.repair);
          $('[name="repair_notes"]').val(data.problem.repair_notes);
          $('[name="repair_status"]').val(data.problem.repair_status);
          $('[name="repair_duration"]').val(data.problem.repair_duration);
          $('[name="severity_level"]').val(data.problem.severity_level);
          $('[name="problem_impact"]').val(data.problem.problem_impact);
          $('[name="notes_problem"]').val(data.problem.notes);
        }else{
          $('#problem').hide();
        }

        $('#modal_sys_availability_system').modal('show');
        $('.modal-title').text('Update System Avalability');
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert('Error get data from ajax');
      }
    });
  }
  
  function delete_form_system(id) {
    cek_privileges('delete', event);
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
            url: "<?php echo site_url('clean/delete_availability_system') ?>/" + id,
            type: "post",
            complete: function() {
              swal("Your data has been deleted!", {
                icon: "success",
              }).then(function() {
                reload_table();
              });
            }
          });

        } else {
          swal("Data failed deleted !");
        }
      });
  }

</script>