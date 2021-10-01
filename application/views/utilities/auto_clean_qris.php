<style>
  .modal-title{
    margin-top: -10px;
  }
  .modal {
    top: 20%;
  }
</style>

<section class="section">
  <div class="section-header">
    <h1>Auto Clean</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Manage Auto clean</h2>
    <div class="row" style="display: none;" id="alert-available">
    
      <div class="col-md-12">
        <div class="alert alert-warning">
          <i class="fa fa-info"></i>  Data Not Available
        </div>
      </div>
    </div>
    <div class="row" style="display: none;" id="raw_data">
      <div class="col-12">
        
        <div class="card">
          <div class="card-header">
            <h4>
              <button class="btn btn-danger pull-right" id="auto-clean" style="border-radius: 2px !important;"><i class="fas fa-check"></i> Cleansing Data </button>
            </h4>
            <div class="card-header-form">
            <a href="<?= base_url('role_model') ?>" target="_blank" class="btn btn-success pull-right" id="auto-clean" style="border-radius: 2px !important;"><i class="fas fa-rules"></i> Role Model </a>
            </div>
          </div>
          <div class="card-body" >
            <div class="">
              <table class="table table-striped" id="table" style="width: 100%;">
                <thead>
                  <tr>
                  <th>Merchant Name</th>
                        <th>City</th>
                        <th>Mcc</th>
                        <th>Merchant Criteria</th>
                        <th>Merchant Status</th>
                        <th>Activation Period</th>
                        <th>TRX Date</th>
                  </tr>
                </thead>
                <tbody id="result-source"></tbody>

              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<div class="modal fade" tabindex="-1" role="dialog" id="modal_add_role">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header  bg-primary text-white">
        <h5 class="modal-title">Add Automatic Model</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" id="form_role_model">
          <input type="hidden" name="id">
          <div class="form-body">
            <div class="form-group">
              <label>Before City</label>
              <input type="text" class="form-control" name="before_city" readonly>
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>To City</label>
              <input type="text" class="form-control" name="to_city">
              <span class="invalid-feedback"></span>
            </div>
          </div>
        </form>
      </div>
      <div class="modal-footer bg-whitesmoke br">
        <button type="button" class="btn btn-secondary mr-auto" data-dismiss="modal">Close</button>
        <button type="button" onclick="cleansing_data('clean');" class="btn btn-primary float-right">Cleansing</button>
        <button type="button" onclick="cleansing_data('save');" class="btn btn-success float-right">Cleansing & Save</button>
      </div>
    </div>
  </div>
</div>

<script src="<?= base_url() ?>assets/js/stisla.js"></script>
<script src="<?php echo base_url(); ?>assets/modules/jquery.min.js"></script>
<script>

var base_url = "<?= base_url() ?>";
$('#nav-utilities-source').addClass('dropdown active');
  $('#nav-auto-clean-qris').addClass('active');
var table;
const failed_cleansing = [];
  $(document).ready(function(){
    table = $('#table').DataTable({
      "deferRender": true,
      "scrollCollapse": false,
      "scrollX": false,
      "processing": true,
      "serverSide": true,
      "order": [],
      "ajax": {
        url: "<?php echo site_url('utilities/ajax_rawdata_qris')?>", // json datasource
        type: "POST",
        "dataSrc": function(response) {
          if (response.status == false) {
            alert(response.msg);
            return [];
          }
          if(response.data.length > 0 ){
            $('#raw_data').slideDown();
            $('#alert-available').slideUp();
          }else{
            $('#raw_data').slideUp();
            $('#alert-available').slideDown();
            return [];
          }
          return response.data;
          
        }
      },
      "columnDefs": [{
        "orderable": false
      }],
    });
  })
  

  $("input").change(function(){
      $(this).removeClass('is-invalid');
      $(this).next().empty();
  });
  function reload_table()
  {
    table.ajax.reload(null,false);
  }
  

  $("#auto-clean").click(function() {
  swal({
      title: 'Are you sure?',
      text: 'Do you want to cleansing this data ?',
      icon: 'warning',
      timerProgressBar: true,
      buttons: true,
      dangerMode: true,
    })
    .then((willDelete) => {
      if (willDelete) {
        loading();
        $.ajax({
          url : base_url + 'utilities/json_auto_clean_qris',
          type : 'POST',
          dataType : 'JSON',
          success : function(response){
            if(response.fail_clean.length > 0 ){
              swal({
                title: 'Success',
                text: response.success + ' Data Cleaned, ' + response.false + ' Failed' ,
                icon: 'warning',
                icon: 'success',
                buttons: ['No', "Save Automatic Role"],
              }).then((isCofirm) => {
                $.each(response.fail_clean, function(index, val){
                  failed_cleansing.push(val)
                });
                $('[name="before_city"]').val(failed_cleansing[0])
                $('[name="to_city"]').val('')
                failed_cleansing.shift();
                $('#modal_add_role').modal('show');
              })
          }else{
            swal({
                title: 'Success',
                text: response.success + ' Data Cleaned, ' + response.false + ' Failed' ,
                icon: 'warning',
                icon: 'success'
              })
          }
            reload_table();
          }
        })
      } else {
      swal('Cleansing Data Canceled');
      }
    });
});

function cleansing_data(status){
  // $('#modal_add_role').modal('hide');
  $.ajax({
    url : "<?= base_url('utilities/save_role_model') ?>",
    type : 'POST',
    data : {
      report : 'QRIS',
      before_city : $('[name="before_city"]').val(),
      to_city : $('[name="to_city"]').val(),
      status_clean : status
    },
    dataType : 'JSON',
    success : function(response){
      console.log(response)
      reload_table();
      swal({
        title: 'Success',
        text: response.success + ' Data Cleaned, ' + response.false + ' Failed' ,
        icon: 'warning',
        icon: 'success',
      });
      if(response.fail_clean.length > 0){
        $('[name="before_city"]').val(response.fail_clean[0])
        $('[name="to_city"]').val('')
        $('#modal_add_role').modal('show');
      }else{
        $('#modal_add_role').modal('hide');
      }
      // iziToast.success({
      //   title: 'Success !',
      //   message: 'Data saved successfully ',
      //   position: 'topRight'
      // });
      // if(failed_cleansing[0]){
      //   $('[name="before_city"]').val(failed_cleansing[0])
      //   $('[name="to_city"]').val('')
      //   failed_cleansing.shift();
      //   $('#modal_add_role').modal('show');
      // }else{
      //   $('#modal_add_role').modal('hide');
      // }
      
    }
  })
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
