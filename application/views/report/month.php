<section class="section">
  <div class="section-header">
    <h1>Report</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Manage Report</h2>

    <div class="row">
      <div class="col-12">
        <div class="form-group">

        </div>
        <div class="card">
          <div class="card-body">
            <div class="row">
              <div class="col-md-4">
                <div class="form-group">
                  <label> Select Report </label>
                  <select class="form-control" name="setting_report">
                    <option value="">--- Select ---</option>
                      <?php foreach($setting as $key): ?>
                        <?php if($key['code']) : ?>
                        <option value="<?= $key['code'] ?>">Laporan <?= $key['code'] ?></option>
                        <?php endif; ?>
                      <?php endforeach; ?>
                  </select>
                </div>
              </div>
              <div class="col-md-4">
                <div class="form-group">
                  <label>Start time</label>
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <div class="input-group-text">
                        <i class="fas fa-calendar"></i>
                      </div>
                    </div>
                    <input type="date" class="form-control" name="start_date" value="<?= date('Y-m-d') ?>">
                  </div>
                </div>
              </div>
              <div class="col-md-4">
                <div class="form-group">
                  <label>End time</label>
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <div class="input-group-text">
                        <i class="fas fa-calendar"></i>
                      </div>
                    </div>
                    <input type="date" class="form-control" name="end_date" value="<?= date('Y-m-d') ?>">
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-4"></div>
              <div class="col-md-5">
                <button class="btn btn-icon btn-outline-warning m-2" id="btn-view"  ><i class="fas fa-eye"></i> View </button>
                <button class="btn btn-icon btn-outline-success m-2"><i class="fas fa-file-excel"></i> Excel </button>
                <button class="btn btn-icon btn-outline-success m-2"><i class="fas fa-file-csv"></i> Csv </button> 
              </div>
            </div>

            <div class="row mt-4" id="result-data" style="display: none;">
            <div class="col-md-12">
            <table class="table table-striped" id="table" style="width: 100%;"> 
              <thead>
                  <tr>
                    <th class="text-center" width="1px">
                      No
                    </th>
                    <th>Trxdate</th>
                    <th>Sender Country</th>
                    <th>Sender City</th>
                    <th>Receipt Country</th>
                    <th>Receipt City</th>
                    <th>Sender Name</th>
                    <th>Receipt Name</th>
                    <th>Nominal</th>
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


<script src="<?php echo base_url(); ?>assets/modules/jquery.min.js"></script>
<script>
  var base_url = "<?= base_url() ?>";

  $("input").change(function(){
      $(this).removeClass('is-invalid');
      $(this).next().empty();
  });
  $(document).ready(function() {

    var table = $('#table').DataTable({
      "deferRender": true,
      "scrollCollapse": true,
      "scrollX": false,
      "processing": true,
      "serverSide": true,
      "order": [],
      "ajax": {
        url: "<?php echo site_url('regulatory/ajax_list_clean_data')?>", // json datasource
        type: "POST"
      },
      "columnDefs": [{
        "orderable": false
      }],
    });

  });

  $('#btn-view').click(function(){
    var setting_report = $('[name="setting_report"]').val();
    var start_date = $('[name="start_date"]').val();
    var end_date = $('[name="end_date"]').val();
    if(setting_report && start_date && end_date){
      loading();
      $.ajax({
        url : base_url +'report/get_report_range',
        type : 'POST',
        data : {
          setting_report : setting_report,
          start_date : start_date,
          end_date : end_date
        },
        dataType : 'JSON',
        success : function(response)
        {
          console.log(response)
        }
      })
    }else{
      alert('Fields Is Required');
    }
    // loading();  
    // setTimeout(function(){
    //   $('#result-data').show();
      
    // }, 1000)
    
    

  })

  function loading()
{
  swal({
          title:"Please Wait.", 
          text:"Loading...",
          icon: base_url + 'assets/img/loading.gif',
          buttons: false,      
          // closeOnClickOutside: false,
          timer: 1000,
          //icon: "success"
      })
}


</script>
