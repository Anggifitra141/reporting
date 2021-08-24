<section class="section">
  <div class="section-header">
    <h1>Report</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title"><?= $header['title'] ?></h2>

    <div class="row">
      <div class="col-12">
        <div class="form-group">

        </div>
        <div class="card">
          <div class="card-body">
            <div class="row">
              <div class="col-md-6">
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
                <button class="btn btn-icon btn-outline-warning btn-block" style="margin-top:27px;" id="btn-view"><i class="fas fa-eye"></i> View </button>
              </div>
              <div class="col-md-2">
                <button class="btn btn-icon btn-outline-success btn-block" style="margin-top:27px;" id="btn-download-excel"><i class="fas fa-file-excel"></i> Download Excel </button>
              </div>
              <div class="col-md-2">
                <button class="btn btn-icon btn-outline-primary btn-block" style="margin-top:27px;" id="btn-download-txt"><i class="fas fa-file-alt"></i> Download Txt </button>
              </div>
            </div>

            <div class="row mt-4" id="result-data" style="display: none;">
              <div class="col-md-12">
                <table class="table table-striped" id="table-data" style="width: 100%;">
                  <thead>
                    <tr>
                      <th class="text-center" width="1px">
                        No
                      </th>
                      <?php foreach ($header['header'] as $key) : ?>
                        <th><?= $key; ?></th>
                      <?php endforeach; ?>
                    </tr>
                  </thead>

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


  $("input").change(function() {
    $(this).removeClass('is-invalid');
    $(this).next().empty();
  });

  $('#btn-view').click(function() {
    $('#notif-available').hide();
    $('#result-data').hide();
    $('#table-data').DataTable().destroy();

    var type_report = "<?= $this->uri->segment(3); ?>";
    var daterange = $('[name="daterange"]').val();

    if (type_report && daterange) {
      
      //
      var table = $('#table-data').DataTable({
        "deferRender": true,
        "scrollCollapse": true,
        "scrollX": true,
        "processing": true,
        "serverSide": true,
        "order": [],
        "ajax": {
          url: "<?php echo site_url('report/ajax_list_ltdbb') ?>", // json dataclean
          type: "POST",
          data: function(data) {
            data.type_report = type_report,
            data.daterange = daterange
          }
        },
        "columnDefs": [{
          "orderable": false
        }],
        

      });

      $('#result-data').slideDown('slow');
      

    } else {
      alert('Fields Is Required');
    }
    // loading();  
    // setTimeout(function(){
    //   $('#result-data').show();

    // }, 1000)



  })

  function loading() {
    swal({
      title: "Please Wait.",
      text: "Loading...",
      icon: base_url + 'assets/img/loading.gif',
      buttons: false,
      // closeOnClickOutside: false,
      // timer: 1000,
      //icon: "success"
    })
  }
</script>