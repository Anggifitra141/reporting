<style>
  .modal-title{
    margin-top: -10px;
  }
  


</style>

<section class="section">
  <div class="section-header">
    <h1>Data LKPBU</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Manage Data LKPBU (302)</h2>
    
    <div class="row">
      <div class="col-12 ">
        <div class="card">
          <div class="card-header">
            <ul class="nav nav-pills" id="myTab3" role="tablist">
              <li class="nav-item">
                <a class="nav-link active" id="card-tab3" data-toggle="tab" href="#card3" role="tab" aria-controls="card" aria-selected="true">Card</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="dana-float-tab3" data-toggle="tab" href="#dana-float3" role="tab" aria-controls="dana-float" aria-selected="false">Dana Float</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="trx-tab3" data-toggle="tab" href="#trx3" role="tab" aria-controls="trx" aria-selected="false">Transaksi</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="vol-tab3" data-toggle="tab" href="#vol3" role="tab" aria-controls="vol" aria-selected="false">Volume</a>
              </li>
            </ul>
          </div>
          <div class="card-body mb-2">
            <div class="tab-content" id="myTabContent2">
              <div class="tab-pane fade show active" id="card3" role="tabpanel" aria-labelledby="card-tab3">
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
                        <input type="text" class="form-control daterange-picker" name="daterange_card">
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row mt-4" >
                  <div class="col-md-12">
                    <div class="">
                      <table class="table table-striped" id="table-card" style="width: 100%;">
                        <thead>
                          <tr>
                            <th class="text-center" width="1px">
                              No
                            </th>
                            <th>Cust Code</th>
                            <th>Cust Type</th>
                            <th>City</th>
                            <th>Status Card</th>
                            <th>Register Date</th>
                          </tr>
                        </thead>

                      </table>
                    </div>
                  </div>
                </div>
              </div>
              <div class="tab-pane fade" id="dana-float3" role="tabpanel" aria-labelledby="dana-float-tab3">
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
                        <input type="text" class="form-control daterange-picker" name="daterange_dana_float">
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row mt-4" >
                  <div class="col-md-12">
                    <div class="">
                      <table class="table table-striped" id="table-dana-float" style="width: 100%;">
                        <thead>
                          <tr>
                            <th class="text-center" width="1px">
                              No
                            </th>
                            <th>Cust Code</th>
                            <th>Cust Type</th>
                            <th>City</th>
                            <th>Curr Balance</th>
                            <th>Trx Date Time</th>
                          </tr>
                        </thead>

                      </table>
                    </div>
                  </div>
                </div>
              </div>
              <div class="tab-pane fade" id="trx3" role="tabpanel" aria-labelledby="trx-tab3">
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
                        <input type="text" class="form-control daterange-picker" name="daterange_trx">
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row mt-4" >
                  <div class="col-md-12">
                    <div class="">
                      <table class="table table-striped" id="table-trx" style="width: 100%;">
                        <thead>
                          <tr>
                            <th class="text-center" width="1px">
                              No
                            </th>
                            <th>Cust Code</th>
                            <th>Cust Type</th>
                            <th>City</th>
                            <th>Transaksi Value</th>
                            <th>Transaksi Code</th>
                            <th>Wstransfertype</th>
                            <th>Trx Date Time</th>
                          </tr>
                        </thead>

                      </table>
                    </div>
                  </div>
                </div>
              </div>
              <div class="tab-pane fade" id="vol3" role="tabpanel" aria-labelledby="vol-tab3">
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
                        <input type="text" class="form-control daterange-picker" name="daterange_vol">
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row mt-4" >
                  <div class="col-md-12">
                    <div class="">
                      <table class="table table-striped" id="table-vol" style="width: 100%;">
                        <thead>
                          <tr>
                            <th class="text-center" width="1px">
                              No
                            </th>
                            <th>Cust Code</th>
                            <th>Cust Type</th>
                            <th>City</th>
                            <th>Transaksi Value</th>
                            <th>Init Amount</th>
                            <th>Trx Date Time</th>
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

<script src="<?php echo base_url(); ?>assets/modules/jquery.min.js"></script>
<script>
var table_card;
var table_dana_float;
var table_trx;
var table_vol;
var base_url = "<?= base_url() ?>";
$('#nav-data-source').addClass('dropdown active');
$('#nav-lkpbu-source').addClass('active');
$('#nav-lkpbu-source-302').addClass('active');

  $("input").change(function(){
      $(this).removeClass('is-invalid');
      $(this).next().empty();
  });
  $(document).ready(function() {

     table_card = $('#table-card').DataTable({
      "deferRender": true,
      "scrollCollapse": true,
      "scrollX": false,
      "processing": true,
      "serverSide": true,
      "order": [],
      "ajax": {
        url: "<?php echo site_url('source/ajax_list_lkpbu_card')?>", // json datasource
        type: "POST",
        data: function(data) {
              data.daterange = $('[name="daterange_card"]').val();
          }
      },
      "columnDefs": [{
        "orderable": false
      }],
    });

    table_dana_float = $('#table-dana-float').DataTable({
      "deferRender": true,
      "scrollCollapse": true,
      "scrollX": false,
      "processing": true,
      "serverSide": true,
      "order": [],
      "ajax": {
        url: "<?php echo site_url('source/ajax_list_lkpbu_dana_float')?>", // json datasource
        type: "POST",
        data: function(data) {
              data.daterange = $('[name="daterange_dana_float"]').val();
          }
      },
      "columnDefs": [{
        "orderable": false
      }],
    });

    table_trx = $('#table-trx').DataTable({
      "deferRender": true,
      "scrollCollapse": true,
      "scrollX": false,
      "processing": true,
      "serverSide": true,
      "order": [],
      "ajax": {
        url: "<?php echo site_url('source/ajax_list_lkpbu_trx')?>", // json datasource
        type: "POST",
        data: function(data) {
              data.daterange = $('[name="daterange_trx"]').val();
          }
      },
      "columnDefs": [{
        "orderable": false
      }],
    });

    table_vol = $('#table-vol').DataTable({
      "deferRender": true,
      "scrollCollapse": true,
      "scrollX": false,
      "processing": true,
      "serverSide": true,
      "order": [],
      "ajax": {
        url: "<?php echo site_url('source/ajax_list_lkpbu_vol')?>", // json datasource
        type: "POST",
        data: function(data) {
              data.daterange = $('[name="daterange_vol"]').val();
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

$('[name="daterange_card"]').change(function(){
  reload_table_card();
})
$('[name="daterange_dana_float"]').change(function(){
  reload_table_dana_float();
})
$('[name="daterange_trx"]').change(function(){
  reload_table_trx();
})
$('[name="daterange_vol"]').change(function(){
  reload_table_vol();
})
function reload_table_card() {
  table_card.ajax.reload(null, false);
}
function reload_table_dana_float() {
  table_dana_float.ajax.reload(null, false);
}
function reload_table_trx() {
  table_trx.ajax.reload(null, false);
}
function reload_table_vol() {
  table_vol.ajax.reload(null, false);
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


</script>