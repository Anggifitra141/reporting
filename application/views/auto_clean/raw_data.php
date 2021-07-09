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
                  <select class="form-control">
                    <option value="">--- Select ---</option>
                    <?php foreach($campaign as $key): ?>
                    <option value="<?= $key->campaign ?>"><?= $key->campaign ?></option>
                    <?php endforeach; ?>
                  </select>
                </div>
              </div>
              <div class="col-md-2">
              <button class="btn btn-danger"><i class="fas fa-check"></i> Cleansing Data </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <div class="row">
      <div class="col-12">
        <div class="card">
          <div class="card-body" >
            <div class="">
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
      "scrollX": true,
      "processing": true,
      "serverSide": true,
      "order": [],
      "ajax": {
        url: "<?php echo site_url('regulatory/ajax_list_raw_data')?>", // json datasource
        type: "POST"
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

  $("#swal-6").click(function() {
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
          url : base_url + 'regulatory/cleansing_data',
          type : 'GET',
          dataType : 'JSON',
          success : function(response){
            console.log('hi')
            swal({
              title: 'Success',
              text: response.length + ' data cleaned',
              icon: 'warning',
              icon: 'success',
            });
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
