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
          <button class="btn btn-danger pull-right" id="auto-clean" style="margin-top: 6px; border-radius: 2px !important;"><i class="fas fa-check"></i> Cleansing Data </button>
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
          
        },
        beforeSend: function() {
          loading();
        },
        complete: function() {
          swal.close();
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
          url : base_url + 'utilities/proc_auto_clean',
          type : 'POST',
          dataType : 'JSON',
          success : function(response){
            swal({
              title: 'Success',
              text: response.success + ' Data Cleaned, ' + response.false + ' Failed' ,
              icon: 'warning',
              icon: 'success',
            });
            $('#alert-available').slideUp();
            $('#raw_data').slideUp();
          }
        })
      } else {
      swal('Cleansing Data Canceled');
      }
    });
});


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
