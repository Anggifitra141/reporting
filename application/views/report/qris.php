<style>
  .modal-title{
    margin-top: -10px;
  }
</style>

<section class="section">
  <div class="section-header">
    <h1>Data QRIS Merchant</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Manage Data QRIS Merchant</h2>
    
    <div class="row">
      <!-- <div class="col-12">
        <div class="form-group">
          <a href="#" onclick="add_qris_merchant()" class="btn btn-icon icon-left btn-outline-primary"><i class="far fa-plus-square"></i> Add</a>
          <a href="#" onclick="import_data()" class="btn btn-icon icon-left btn-outline-success"><i class="far fa-file-excel"></i> Import Data</a>
          <a href="<?= base_url('assets/template-excel/template-import-qris-merchant.xlsx') ?>" download class="btn float-right btn-icon icon-left btn-success"><i class="fas fa-download"></i> Download Sample</a>
        </div>
      </div> -->
      <div class="col-12">
        <div class="card">
          <div class="card-header">
            <ul class="nav nav-pills" id="myTab3" role="tablist">
              <li class="nav-item">
                <a class="nav-link active" id="merchant-tab3" data-toggle="tab" href="#merchant3" role="tab" aria-controls="merchant" aria-selected="true">Merchant</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="transaksi-tab3" data-toggle="tab" href="#transaksi3" role="tab" aria-controls="transaksi" aria-selected="false">Transaksi</a>
              </li>
            </ul>
          </div>
          <div class="card-body mb-2">
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label>Trx Date Upload</label>
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
              <div class="tab-pane fade show active" id="merchant3" role="tabpanel" aria-labelledby="merchant-tab3">
                <div class="row mt-4" >
                  <div class="col-md-12">
                    <div class="">
                      <table class="table table-striped" id="table-merchant" style="width: 100%;">
                        <thead>
                          <tr>
                            <th class="text-center" width="1px">
                              No
                            </th>
                            <th>Action</th>
                            <th>Merchant Name</th>
                            <th>City</th>
                            <th>Mcc</th>
                            <th>Merchant Criteria</th>
                            <th>Merchant Status</th>
                            <th>Activation Period</th>
                            <th>TRX Date</th>
                          </tr>
                        </thead>

                      </table>
                    </div>
                  </div>
                </div>
              </div>
              <div class="tab-pane fade" id="transaksi3" role="tabpanel" aria-labelledby="transaksi-tab3">
                <div class="row mt-4" >
                  <div class="col-md-12">
                    <div class="">
                      <table class="table table-striped" id="table-transaksi" style="width: 100%;">
                        <thead>
                          <tr>
                            <th class="text-center" width="1px">
                              No
                            </th>
                            <th>City</th>
                            <th>Pjsp</th>
                            <th>Mcc</th>
                            <th>Merchant Criteria</th>
                            <th>Vol Trx</th>
                            <th>Amount Trx</th>
                            <th>Trx Date</th>
                          </tr>
                        </thead>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Modal -->
<div class="modal fade" tabindex="-1" role="dialog" id="modal_qris_merchant">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header  bg-primary text-white">
        <h5 class="modal-title"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" id="qris_merchant">
          <input type="hidden" name="id">
          <div class="form-body">
            <div class="form-group">
              <label>Merchant Name</label>
              <input type="text" class="form-control" name="merchant_name">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>City</label>
              <input type="text" class="form-control" name="city">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Mcc</label>
              <select name="mcc" id="mcc" class="form-control select2">
                <option value="">-- Select MCC --</option>
                <?php foreach($mcc as $key) :  ?>
                  <option value="<?= $key->mcc ?>"><?= $key->mcc .' - '. $key->mcc_name ?></option>
                <?php endforeach; ?>
              </select>
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Merchant Criteria</label>
              <select name="merchant_criteria" id="merchant_criteria" class="form-control select2">
                <option value="">-- Select Merchant Criteria --</option>
                <?php foreach($merchant_criteria as $key) :  ?>
                  <option value="<?= $key->code ?>"><?= $key->code .' - '. $key->description ?></option>
                <?php endforeach; ?>
              </select>
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Merchant Status</label>
              <select name="merchant_status" id="merchant_status" class="form-control">
                <option value="Active">Active</option>
                <option value="Not Active">Not Active</option>
              </select>
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Activation Period</label>
              <input type="date" class="form-control" name="activation_peroid">
              <span class="invalid-feedback"></span>
            </div>
          </div>
        </form>
      </div>
      <div class="modal-footer bg-whitesmoke br">
        <button type="button" class="btn btn-secondary float-left" data-dismiss="modal">Close</button>
        <button type="button" onclick="save_merchant();" class="btn btn-outline-primary float-right">Save</button>
      </div>
    </div>
  </div>
</div>


<script src="<?php echo base_url(); ?>assets/modules/jquery.min.js"></script>
<script>
var table_merchant;
var table_transaksi;
var base_url = "<?= base_url() ?>";
$('#nav-report').addClass('dropdown active');
$('#nav-qris-report').addClass('active');
  $("input").change(function(){
      $(this).removeClass('is-invalid');
      $(this).next().empty();
  });
  $(document).ready(function() {

    table_merchant = $('#table-merchant').DataTable({
      "deferRender": true,
      "scrollCollapse": true,
      "scrollX": true,
      "processing": true,
      "serverSide": true,
      "order": [],
      "ajax": {
        url: "<?php echo site_url('clean/ajax_list_qris_merchant_clean')?>", // json dataclean
        type: "POST",
        data: function(data) {
              data.daterange = $('[name="daterange"]').val();
          }
      },
      "columnDefs": [{
        "orderable": false
      }],
    });

    table_transaksi = $('#table-transaksi').DataTable({
      "deferRender": true,
      "scrollCollapse": true,
      "scrollX": true,
      "processing": true,
      "serverSide": true,
      "order": [],
      "ajax": {
        url: "<?php echo site_url('clean/ajax_list_qris_Trx_clean')?>", // json dataclean
        type: "POST",
        data: function(data) {
              data.daterange = $('[name="daterange"]').val();
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
  reload_table_merchant();
  reload_table_transaksi();
  $('#btn-download-excel').attr('href', base_url + 'report/download_excel_qris?&daterange=' + $('[name="daterange"]').val());
});
function reload_table_merchant() {
  table_merchant.ajax.reload(null, false);
}

function reload_table_transaksi() {
  table_transaksi.ajax.reload(null, false);
}



  function get_qris_merchant(id) {
    cek_privileges('update', event);
    save_method = 'update';
    $('#qris_merchant')[0].reset();
    $.ajax({
      url: "<?php echo site_url('clean/get_qris_merchant') ?>/" + id,
      type: "GET",
      dataType: "JSON",
      success: function(data) {
        $('[name="id"]').val(data.id);
        $('[name="merchant_name"]').val(data.merchant_name);
        $('[name="city"]').val(data.city);
        $('[name="mcc"]').val(data.mcc);
        $('[name="merchant_criteria"]').val(data.merchant_criteria);
        $('[name="merchant_status"]').val(data.merchant_status);
        $('[name="activation_peroid"]').val(data.activation_peroid);

        $('#modal_qris_merchant').modal('show');
        $('.modal-title').text('Update QRIS Merchant');
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert('Error get data from ajax');
      }
    });
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
function save_merchant() {
    var url;
    if (save_method == 'add') {
      url = "<?php echo site_url('clean/add_qris_merchant') ?>";
    } else {
      url = "<?php echo site_url('clean/update_qris_merchant') ?>";
    }
    // ajax adding data to database
    $.ajax({
      url: url,
      type: "POST",
      data: $('#qris_merchant').serialize(),
      dataType: "JSON",
      success: function(data, response) {
        if (data.status) //if success close modal and reload ajax table
        {
          $('#btnSave').text('save'); //change button text
          $('#btnSave').attr('disabled', false); //set button enable 
          //if success close modal and reload ajax table
          $('#modal_qris_merchant').modal('hide');
          iziToast.success({
            title: 'Success !',
            message: 'Data saved successfully ',
            position: 'topRight'
          });
          reload_table_merchant();
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

  function delete_qris_merchant(id) {
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
            url: "<?php echo site_url('clean/delete_qris_merchant') ?>/" + id,
            type: "post",
            complete: function() {
              swal("Your data has been deleted!", {
                icon: "success",
              }).then(function() {
                reload_table_merchant();
              });
            }
          });

        } else {
          swal("Data failed deleted !");
        }
      });
  }


</script>