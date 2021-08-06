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
              <div class="col-md-3">
                <div class="form-group">
                  <label> Select Campaign </label>
                  <select class="form-control select2" name="campaign">
                    <option value="">--- Select ---</option>
                      <?php foreach($campaign as $key): ?>
                        <?php if($key['campaign']) : ?>
                        <option value="<?= $key['campaign'] ?>"><?= $key['campaign'] ?></option>
                        <?php endif; ?>
                      <?php endforeach; ?>
                  </select>
                </div>
              </div>
              <div class="col-md-3">
                <div class="form-group">
                  <label> Select Report </label>
                  <select class="form-control select2" name="report_type">
                    <option value="">--- Select ---</option>
                      <?php foreach($report_type as $key): ?>
                        <?php if($key['code']) : ?>
                        <option value="<?= $key['code'] ?>">Laporan <?= $key['code'] ?></option>
                        <?php endif; ?>
                      <?php endforeach; ?>
                  </select>
                </div>
              </div>
              <div class="col-md-4">
                <div class="form-group">
                  <label>Date Range Picker</label>
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
                <button class="btn btn-icon btn-outline-primary btn-block" style="margin-top:27px;" id="btn-view"  ><i class="fas fa-sync"></i> Process </button>
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
  $('#nav-sub-report').addClass('dropdown active');
  $('#nav-report').addClass('active');
  function dataTable()
  {
      var table = $('#table-data').DataTable( {
      "pageLength": 20,
          dom: 'Bfrtip',
          buttons: [
            { extend: 'copyHtml5', text: '<i class="fas fa-copy"> </i> Copy', className: 'btn btn-icon btn-outline-primary m-1' },
            { extend: 'excelHtml5', text: '<i class="fas fa-file-excel"> </i> Excel', className: 'btn btn-icon btn-outline-success m-1' },
            { extend: 'csvHtml5', text: '<i class="fas fa-file-csv"> </i> CSV', className: 'btn btn-icon btn-outline-success m-1' },
            { extend: 'pdfHtml5', text: '<i class="fas fa-file-pdf"> </i> PDF', className: 'btn btn-icon btn-outline-danger m-1' },
        ]
      });

      $('div').removeClass("btn-group");
      $('button').removeClass("btn-secondary");

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
    var campaign = $('[name="campaign"]').val();
    var report_type = $('[name="report_type"]').val();
    var daterange = $('[name="daterange"]').val();

    if(campaign && report_type && daterange){
      loading();
      $.ajax({
        url : base_url +'report/get_report_range',
        type : 'POST',
        asyc : true,
        data : {
          campaign : campaign,
          report_type : report_type,
          daterange : daterange
        },
        dataType : 'JSON',
        success : function(response)
        {
          console.log(response)
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
