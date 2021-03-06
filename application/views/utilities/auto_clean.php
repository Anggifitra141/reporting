<style>
  .modal-title{
    margin-top: -10px;
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
                    <th>Trxdate</th>
                    <th>Status</th>
                    <th>Sender Country</th>
                    <th>Sender City</th>
                    <th>Receipt Country</th>
                    <th>Receipt City</th>
                    <th>Sender Name</th>
                    <th>Receipt Name</th>
                    <th>Nominal</th>
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
      <form class="form-horizontal" method="POST" id="form_role_model">
        <div class="modal-body">
          <div class="alert alert-info">
            <i class="fa fa-info"></i> To More Info Code Country Click <a href="<?= base_url('master/ltdbb_bi_country') ?>" target="_blank" >Here</a> <br>
          </div>
          <div class="alert alert-info">
            <i class="fa fa-info"></i> To More Info Code City Click <a href="<?= base_url('master/ltdbb_bi_city') ?>" target="_blank" >Here</a>
          </div>
          <input type="hidden" name="report" value="LTDBB">
          <div class="form-body" id="html-result"></div>
        </div>
        </form>
        <div class="modal-footer bg-whitesmoke br">
          <button type="button" class="btn btn-secondary mr-auto" data-dismiss="modal">Close</button>
          <button type="button" onclick="cleansing_data('clean');" class="btn btn-primary float-right">Cleansing</button>
          <button type="button" onclick="cleansing_data('save');" class="btn btn-success float-right">Cleansing & Save</button>
        </div>
    </div>
  </div>
</div>

<script src="<?php echo base_url(); ?>assets/modules/jquery.min.js"></script>
<script>

var base_url = "<?= base_url() ?>";
$('#nav-utilities-source').addClass('dropdown active');
  $('#nav-auto-clean').addClass('active');
var table;
  $(document).ready(function(){
    table = $('#table').DataTable({
      "deferRender": true,
      "scrollCollapse": false,
      "scrollX": false,
      "processing": true,
      "serverSide": true,
      "order": [],
      "ajax": {
        url: "<?php echo site_url('utilities/ajax_raw_data')?>", // json datasource
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
          url : base_url + 'utilities/json_auto_clean',
          type : 'POST',
          dataType : 'JSON',
          success : function(response){
            console.log(response)
            if(response.fail_clean.length > 0 ){
              swal({
                title: 'Success',
                text: response.success + ' Data Cleaned, ' + response.false + ' Failed' ,
                icon: 'warning',
                icon: 'success',
                buttons: ['No', "Save Automatic Role"],
              }).then((isCofirm) => {
                $('#html-result').html(``);
                if(response.false > 0 ){
                  $('#html-result').html(response.fail_clean);
                  $('#modal_add_role').modal('show');
                }
                
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
  var formData = $('#form_role_model').serializeArray();
  formData.push({name : 'status', value : status});
  $.ajax({
    url : "<?= base_url('utilities/save_role_model') ?>",
    type : 'POST',
    data: formData,
    dataType : 'JSON',
    success : function(response){
      reload_table();
      swal({
        title: 'Success',
        text: response.success + ' Data Cleaned, ' + response.false + ' Failed' ,
        icon: 'warning',
        icon: 'success',
      });
      if(response.false > 0){
        $('#html-result').html(response.fail_clean);
        $('#modal_add_role').modal('show');
      }else{
        $('#modal_add_role').modal('hide');
      }
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
