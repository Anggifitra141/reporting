<style>
  .modal-title {
    margin-top: -10px;
  }
</style>

<section class="section">
  <div class="section-header">
    <h1>Data Clean</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Manage Data Dana Float</h2>

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
                      <th>Wallet Code</th>
                      <th>Trx Code</th>
                      <th>Trx ID</th>
                      <th>Trx Type</th>
                      <th>Trx Value</th>
                      <th>Description</th>
                      <th>Status</th>
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
        url: "<?php echo site_url('clean/ajax_list_dana_float') ?>", // json dataclean
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