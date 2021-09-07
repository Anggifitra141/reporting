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
    <h2 class="section-title">Manage Data Si Pesat</h2>

    <div class="row">
      <div class="col-12">
        <div class="card">
          <div class="card-body">
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label>Trx Date </label>
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
            </div>
            <div class="row mt-4">
              <div class="col-md-12">
                <div class="">
                  <table class="table table-striped" id="table" style="width: 100%;">
                    <thead>
                      <tr>
                        <th class="text-center" width="1px">
                          No
                        </th>
                        <th>Nama Nasabah</th>
                        <th>Tempat Lahir</th>
                        <th>Tanggal Lahir</th>
                        <th>Alamat</th>
                        <th>No KTP</th>
                        <th>No Identitas Lain</th>
                        <th>No Cif</th>
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
  </div>
</section>


<script src="<?php echo base_url(); ?>assets/modules/jquery.min.js"></script>
<script>
  var base_url = "<?= base_url() ?>";
  var table;
  $('#nav-data-clean').addClass('dropdown active');
  $('#nav-sipesat-clean').addClass('active');

  $("input").change(function() {
    $(this).removeClass('is-invalid');
    $(this).next().empty();
  });
  $(document).ready(function() {

     table = $('#table').DataTable({
      "deferRender": true,
      "ordering": false,
      "scrollCollapse": true,
      "scrollX": true,
      "processing": true,
      "serverSide": true,
      "order": [],
      "ajax": {
        url: "<?php echo site_url('clean/ajax_list_si_pesat') ?>", // json dataclean
        type: "POST",
        data: function(data) {
          data.daterange = $('[name="daterange"]').val();
        }
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
  $('[name="daterange"]').change(function() {
    reload_table();
  })

  function reload_table() {
    table.ajax.reload(null, false);
  }

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
            url: base_url + 'clean/ajax_list_si_pesat',
            type: 'GET',
            dataType: 'JSON',
            success: function(response) {
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