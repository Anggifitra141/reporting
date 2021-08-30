<section class="section">
  <div class="section-header">
    <h1>Report</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Management Report SIPESAT</h2>

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
                <a href="" target="_blank" class="btn btn-icon btn-outline-success btn-block" style="margin-top:27px;" id="btn-download-excel"><i class="fas fa-file-excel"></i> Download Excel </a>
              </div>
            </div>

            <div class="row mt-4" id="result-data" style="display: none;">
              <div class="col-md-12">
                <div class="row">
                  <div class="col-md-6 mb-3">
                    <a href="javascript:void(0)" onclick="rollback_selected()" class="btn btn-warning"><i class="fas fa-redo-alt"></i> Rollback Selected</a>
                    <a href="javascript:void(0)" onclick="delete_selected()" class="btn btn-danger"><i class="fas fa-times"></i> Delete Selected</a>
                  </div>
                </div>
                <table class="table table-striped" id="table-data" style="width: 100%;">
                  <thead>
                    <tr>
                      <th class="text-center" width="1px">
                        No
                      </th>
                      <th>Action</th>
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
<div class="modal fade" tabindex="-1" role="dialog" id="modal_modify_sipesat">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header  bg-primary text-white">
        <b class="modal-title">Sipesat </b>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form class="form-horizontal" id="form" method="POST">
        <div class="modal-body">
          <div class="alert alert-info">
            <i class="fas fa-info-circle"></i> Verify manual data on your system
          </div>

          <div class="form-body">

            <input type="hidden" name="id" value="">
            <div class="row">
              <div class="col-6">
                <div class="form-group">
                  <label for="lastName">Customer code</label>
                    <input class="form-control" name="sender_name" placeholder="" value="" type="text">
                  <span class="text-danger"></span>
                </div>
                <div class="form-group">
                  <label for="">Kota/Kabupaten Asal Pengiriman</label>
                  <select name="sender_city" class="form-control" id="">
                    <?php foreach ($city as $key) : ?>
                      <option value="<?= $key->bi_code . ' - ' . $key->city ?>"><?= $key->bi_code . ' - ' . $key->city ?></option>
                    <?php endforeach; ?>
                  </select>
                  <span class="text-danger"></span>
                </div>
                <div class="form-group">
                  <label for="firstName">Nama Pengirim</label>
                  <input class="form-control" name="sender_name" placeholder="" value="" type="text">
                </div>
                <div class="form-group">
                  <label for="firstName">Telepon Pengirim</label>
                  <input class="form-control" name="sender_phone" placeholder="" value="" type="text">
                  <span class="text-danger"></span>
                </div>
                <div class="form-group">
                  <label for="firstName">Nominal</label>
                  <input class="form-control" name="amount" placeholder="" value="" type="text" readonly>
                  <span class="text-danger"></span>
                </div>

              </div>
              <div class="col-6">
                <div class="form-group">
                  <label for="lastName">Negara Penerima</label>
                  <select name="recept_country" class="form-control" id="">
                    <?php foreach ($country as $key) : ?>
                      <option value="<?= $key->country ?>"><?= $key->country ?></option>
                    <?php endforeach; ?>
                  </select>
                  <span class="text-danger"></span>
                </div>
                <div class="form-group">
                  <label for="firstName">Kota/Kabupaten Asal Pengiriman</label>
                  <select name="recept_city" class="form-control" id="">
                    <?php foreach ($city as $key) : ?>
                      <option value="<?= $key->bi_code . ' - ' . $key->city ?>"><?= $key->bi_code . ' - ' . $key->city ?></option>
                    <?php endforeach; ?>
                  </select>
                  <span class="text-danger"></span>
                </div>
                <div class="form-group">
                  <label for="lastName">Nama Penerima</label>
                  <input class="form-control" name="recept_name" placeholder="" value="" type="text">
                </div>
                <div class="form-group">
                  <label for="lastName">Telepon Penerima</label>
                  <input class="form-control" name="recept_phone" placeholder="" value="" type="text">
                  <span class="text-danger"></span>
                </div>
                <div class="form-group">
                  <label for="lastName">Status</label>
                  <select name="status" class="form-control" required>
                    <option value="verified">Verified</option>
                    <option value="unverified">Unverified</option>
                  </select>
                  <span class="text-danger"></span>
                </div>
              </div>
              <div class="col-md-12 form-group">
                <label for="lastName">Description</label>
                <textarea class="form-control" name="description" type="text" readonly></textarea>
                <span class="text-danger"></span>
              </div>
            </div>






          </div>

        </div>
        <div class="modal-footer bg-whitesmoke br">
          <button type="button" class="btn btn-secondary float-left" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-outline-primary float-right">Save</button>
        </div>
      </form>
    </div>
  </div>
</div>

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
  var table;

  $("input").change(function() {
    $(this).removeClass('is-invalid');
    $(this).next().empty();
  });

  $('#btn-view').click(function() {
    $('#notif-available').hide();
    $('#result-data').hide();
    $('#table-data').DataTable().destroy();

    var daterange = $('[name="daterange"]').val();

    if (daterange) {

      //
      table = $('#table-data').DataTable({
        "deferRender": true,
        "ordering": false,
        "scrollCollapse": true,
        "scrollX": true,
        "processing": true,
        "serverSide": true,
        "order": [],
        "ajax": {
          url: "<?php echo site_url('report/ajax_list_sipesat') ?>", // json dataclean
          type: "POST",
          data: function(data) {
            data.daterange = daterange
          }
        },
        "columnDefs": [{
          "orderable": false
        }],


      });

      $('#result-data').slideDown('slow');
      $("#check-all").click(function() {
        $(".data-check").prop('checked', $(this).prop('checked'));
      });
      $('#btn-download-excel').attr('href', base_url + 'report/download_excel_sipesat?daterange=' + daterange);

    } else {
      alert('Fields Is Required');
    }
    // loading();  
    // setTimeout(function(){
    //   $('#result-data').show();

    // }, 1000)

  })

  $('#btn-download-excel').click(function() {
    var daterange = $('[name="daterange"]').val();

    if (type_report && daterange) {
      $.ajax({
        url: base_url + 'report/download_excel_sipesat',
        type: 'POST',
        dataType: 'JSON',
        data: {
          daterange: daterange
        },
        success: function(response) {
          console.log(response);
        }
      })
    } else {
      alert('Fields Is Required');
    }
  });

  function reload_table() {
    table.ajax.reload(null, false);
  }


  function delete_selected() {
    var list_id = [];
    $(".data-check:checked").each(function() {
      list_id.push(this.value);
    });
    if (list_id.length > 0) {
      swal({
          title: 'Are you sure?',
          text: 'Are you sure delete ' + list_id.length + ' data?',
          icon: 'warning',
          timerProgressBar: true,
          buttons: true,
          dangerMode: true,
        })
        .then((willDelete) => {
          if (willDelete) {
            loading();
            $.ajax({
              url: "<?php echo site_url('clean/ajax_bulk_delete_sipesat') ?>",
              data: {
                id: list_id
              },
              type: 'POST',
              dataType: 'JSON',
              success: function(response) {
                reload_table();
                swal({
                  title: 'Success',
                  text: list_id.length + ' Deleted',
                  icon: 'warning',
                  icon: 'success',
                });
              }
            })
          } else {
            swal('Delete Data Canceled');
          }
        });
    } else {
      swal('no data selected');
    }
  }

  function rollback_selected() {
    var list_id = [];
    $(".data-check:checked").each(function() {
      list_id.push(this.value);
    });
    if (list_id.length > 0) {
      swal({
          title: 'Are you sure?',
          text: 'Are you sure rollback this ' + list_id.length + ' data?',
          icon: 'warning',
          timerProgressBar: true,
          buttons: true,
          dangerMode: true,
        })
        .then((willDelete) => {
          if (willDelete) {
            loading();
            $.ajax({
              url: "<?php echo site_url('clean/ajax_bulk_rollback_sipesat') ?>",
              data: {
                id: list_id
              },
              type: 'POST',
              dataType: 'JSON',
              success: function(response) {
                reload_table();
                swal({
                  title: 'Success',
                  text: response.rollback + ' data rollback',
                  icon: 'warning',
                  icon: 'success',
                });
              }
            })
          } else {
            swal('Rollback Data Canceled');
          }
        });
    } else {
      swal('No data selected');
    }
  }

  function delete_row(id) {
    swal({
        title: 'Are you sure?',
        text: 'Are you sure delete this data?',
        icon: 'warning',
        timerProgressBar: true,
        buttons: true,
        dangerMode: true,
      })
      .then((willDelete) => {
        if (willDelete) {
          loading();
          $.ajax({
            url: "<?php echo site_url('clean/ajax_delete_sipesat') ?>",
            data: {
              id: id
            },
            type: 'POST',
            dataType: 'JSON',
            success: function(response) {
              reload_table();
              swal({
                title: 'Success',
                text: 'Deleted Successfuly',
                icon: 'warning',
                icon: 'success',
              });
            }
          })
        } else {
          swal('Deleted Data Canceled');
        }
      });
  }

  function edit_sipesat(id) {
    $('#form')[0].reset();
    $.ajax({
      url: "<?php echo site_url('clean/get_sipesat_by_id') ?>/" + id,
      type: "GET",
      dataType: "JSON",
      success: function(data) {
        $('[name="id"]').val(data.id);
        $('[name="sender_country"]').val(data.sender_country);
        $('[name="sender_city"]').val(data.sender_city);
        $('[name="sender_name"]').val(data.sender_name);
        $('[name="sender_phone"]').val(data.sender_phone);
        $('[name="amount"]').val(data.amount);
        $('[name="recept_country"]').val(data.recept_country);
        $('[name="recept_city"]').val(data.recept_city);
        $('[name="recept_name"]').val(data.recept_name);
        $('[name="recept_phone"]').val(data.recept_phone);
        $('[name="status"]').val(data.status);
        $('[name="description"]').val(data.description);

        $('#modal_modify_sipesat').modal('show');
        $('.modal-title').text('Update sipesat');
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert('Error get data from ajax');
      }
    });
  }



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