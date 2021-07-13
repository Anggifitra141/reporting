<style>
  .modal-title{
    margin-top: -10px;
  }
</style>

<section class="section">
  <div class="section-header">
    <h1>Raw Data</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Manage Raw Data</h2>
    <div class="row">
      <div class="col-12">
        <div class="card">
          <div class="card-body">
            <div class="row">
              <div class="col-md-10">
                <div class="form-group">
                  <!-- <label for="">Campaign</label> -->
                  <select class="form-control" name="campaign_id">
                    <option value="">--- Select ---</option>
                    <?php foreach($campaign as $key): ?>
                    <option value="<?= $key->campaign ?>"><?= $key->campaign ?></option>
                    <?php endforeach; ?>
                  </select>
                </div>
              </div>
              <div class="col-md-2">
              <button class="btn btn-danger" id="auto-clean"><i class="fas fa-check"></i> Cleansing Data </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
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
          <div class="card-body" >
            <div class="">
              <table class="table table-striped" id="table" style="width: 100%;">
                <thead>
                  <tr>
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
  

  $("input").change(function(){
      $(this).removeClass('is-invalid');
      $(this).next().empty();
  });


  $('[name="campaign_id"]').change(function(){
    loading();
    $('#alert-available').slideUp();
    $('#raw_data').slideUp();
    var campaign_id = $(this).val();
    $.ajax({
      url : base_url + 'utilities/ajax_raw_data',
      type : 'POST',
      data : {
        campaign_id : campaign_id
      },
      dataType : 'JSON',
      success : function(response)
      {
        if(response.length > 0){
          $('#table').dataTable( {
            data : response,
            //data : response,
            columns: [
                      {"data" : "trxdate"},
                      {"data" : "sendercountry"},
                      {"data" : "sendercity"},
                      {"data" : "receiptcountry"},
                      {"data" : "receiptcity"},
                      {"data" : "sendername"},
                      {"data" : "receiptname"},
                      {"data" : "nominal"},
                      ],
            searching : true
        });
          $('#raw_data').slideDown();
        }else{
          $('#alert-available').slideDown();
        } 
        swal.close();
      }
    })
  })
  

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
          data : {
            campaign : $('[name="campaign_id"]').val()
          },
          success : function(response){
            swal({
              title: 'Success',
              text: response.success + ' Data Cleaned, ' + response.false + ' Failed' ,
              icon: 'warning',
              icon: 'success',
            });
            $('#alert-available').slideUp();
            $('#raw_data').slideUp();
            $('[name="campaign_id"]').val('');
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
