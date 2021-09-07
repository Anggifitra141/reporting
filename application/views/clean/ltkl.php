<!-- <style>
  .modal-title{
    margin-top: -10px;
  }
</style> -->

<section class="section">
  <div class="section-header">
    <h1>LTKL</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Transfer Dana Internasional Luar Ke Dalam Negeri</h2>

    <div class="row">
      <div class="col-12">
        <div class="card">
          <div class="card-header">
            <h4></h4>
            <div class="card-body">
              <div class="">
                <table class="table table-striped" id="table" style="width: 100%;">
                  <thead>
                    <tr>
                      <th class="text-center" width="1px">
                        No
                      </th>
                      <th>Trx Date</th>
                      <th>Nama Pengirim</th>
                      <th>Negara Pengirim</th>
                      <th>No Rek Pengirim</th>
                      <th>Bank Pengirim</th>
                      <th>Swift Pengirim</th>
                      <th>Status Pengirim</th>
                      <th>Nama Penerima</th>
                      <th>No Rek Penerima</th>
                      <th>Bank Penerima</th>
                      <th>Swift Penerima</th>
                      <th>Status Penerima</th>
                      <th>Nilai Uang</th>
                      <th>Trans Mode Code</th>
                      <th>To Founds Code</th>
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
</section>


<script src="<?php echo base_url(); ?>assets/modules/jquery.min.js"></script>
<script>
  var base_url = "<?= base_url() ?>";
  $('#nav-data-clean').addClass('dropdown active');
  $('#nav-raw-data').addClass('active');

  $("input").change(function() {
    $(this).removeClass('is-invalid');
    $(this).next().empty();
  });
  $(document).ready(function() {

    var table = $('#table').DataTable({
      "deferRender": true,
      "ordering": false,
      "scrollCollapse": true,
      "scrollX": true,
      "processing": true,
      "serverSide": true,
      "order": [],
      "ajax": {
        url: "<?php echo site_url('clean/ajax_list_ltkl') ?>", // json dataclean
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




  function loading() {
    swal({
      title: "Please Wait.",
      text: "Loading...",
      icon: base_url + 'assets/img/loading.gif',
      buttons: false,
      // closeOnClickOutside: false,
      // timer: 3000,
      //icon: "success"
    })
  }
</script>