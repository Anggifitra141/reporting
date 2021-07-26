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
                <table class="table table-striped" id="table-data" style="width: 100%;"> 
                  <thead>
                    <tr>
                      <th>Campaign</th>
                      <th>Sender City</th>
                      <th>Receipt Country</th>
                      <th>Receipt Name</th>
                      <th>Sender Name</th>
                      <th>Trx Volume</th>
                      <th>Trx Nominal</th>
                    </tr>
                  </thead>
                  <tbody id="data-source"></tbody>
                  
                </table>
              
              </div>
            </div>
            <div class="row mt-4" id="notif-available" style="display: none;">
              <div class="col-md-12">
                <div class="alert alert-warning">
                  <i class="fa fa-info"></i> Data Not Available
                </div>
              
              </div>
            </div>

        </div>
      </div>
    </div>
  </div>
</section>


<script src="<?php echo base_url(); ?>assets/modules/jquery.min.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.html5.min.js"></script>
<script>
  var base_url = "<?= base_url() ?>";
  
  function dataTable()
  {
    $('#table-data').DataTable( {
      "pageLength": 20,
          dom: 'Bfrtip',
          buttons: [
              'copyHtml5',
              'excelHtml5',
              'csvHtml5',
              'pdfHtml5'
          ]
      });
  }

  $("input").change(function(){
      $(this).removeClass('is-invalid');
      $(this).next().empty();
  });

  $('#btn-view').click(function(){
    $('#notif-available').hide();
    $('#result-data').hide();
    $('#table-data').DataTable().destroy();
    // $('#data-source').html(``);
    var setting_report = $('[name="setting_report"]').val();
    var start_date = $('[name="start_date"]').val();
    var end_date = $('[name="end_date"]').val();
    if(setting_report && start_date && end_date){
      loading();
      $.ajax({
        url : base_url +'report/get_report_range',
        type : 'POST',
        asyc : true,
        data : {
          setting_report : setting_report,
          start_date : start_date,
          end_date : end_date
        },
        dataType : 'JSON',
        success : function(response)
        {
          if(response.length > 0 ){
            var str;
            $.each(response, function(index, val){
              str += `
                <tr>
                  <td>${val.campaign}</td>
                  <td>${val.sendercity}</td>
                  <td>${val.receiptcountry}</td>
                  <td>${val.receiptname}</td>
                  <td>${val.sendername}</td>
                  <td>${val.trxvolume}</td>
                  <td>${val.trxnominal}</td>
                </tr>
              `;
            })
            $('#data-source').html(str);
            dataTable();
            $('#result-data').slideDown('slow');
          }else{
            $('#notif-available').slideDown('slow');
          }
          swal.close();
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
          // timer: 1000,
          //icon: "success"
      })
}


</script>
