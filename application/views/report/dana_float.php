<section class="section">
  <div class="section-header">
    <h1>Report</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Dana Float</h2>

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
                <a href=""  class="btn btn-icon btn-outline-success btn-block" style="margin-top:27px;" id="btn-download-excel"><i class="fas fa-file-excel"></i> Download Excel </a>
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
                      <th>
                        <input type="checkbox" id="check-all" name="check_all">
                      </th>
                      <th>Action</th>
                      <th>Tanggal</th>
                      <th>Time</th>
                      <th>Wallet Code</th>
                      <th>Type TRX</th>
                      <th>keterangan</th>
                      <th>Trx Value</th>
                      <th>Trx Code</th>
                      <th>ID</th>
                      <th>Kredit</th>
                      <th>Debit</th>
                      <th>Syslogno</th>
                      <th>Channel Id</th>
                      <th>Srac</th>
                      <th>Dsac</th>
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
<div class="modal fade" tabindex="-1" role="dialog" id="modal_modify_danafloat">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header  bg-primary text-white">
        <b class="modal-title">Sender Country </b>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form class="form-horizontal" action="" id="form-danafloat" method="POST">
        <div class="modal-body">
          <div class="alert alert-info">
            <i class="fas fa-info-circle"></i> Verify manual data on your system
          </div>

          <div class="form-body">

            <input type="hidden" name="id" value="">
            <div class="row">
              <div class="col-12">
                <div class="form-group">
                  <label for="wallet_code">Wallet Code</label>
                  <input class="form-control" name="wallet_code" placeholder="" value="" type="text">
                </div>
                <div class="form-group">
                  <label for="trx_code">Trx Code</label>
                  <input class="form-control" name="trx_code" placeholder="" value="" type="text">
                </div>
                <div class="form-group">
                  <label for="trx_id">Trx ID</label>
                  <input class="form-control" name="trx_id" placeholder="" value="" type="text">
                </div>
                <div class="form-group">
                  <label for="trx_type">Trx Type</label>
                  <input class="form-control" name="trx_type" placeholder="" value="" type="text">
                </div>
                <div class="form-group">
                  <label for="trx_value">Trx Value</label>
                  <input class="form-control" name="trx_value" placeholder="" value="" type="text">
                </div>
                <div class="form-group">
                  <label for="description">Description</label>
                  <textarea class="form-control" name="description" placeholder="" value="" ></textarea>
                </div>
                <div class="form-group">
                  <label for="credit">Credit</label>
                  <input class="form-control" name="credit" placeholder="" value="" type="text">
                  <span class="text-danger"></span>
                </div>
                <div class="form-group">
                  <label for="debit">Debit</label>
                  <input class="form-control" name="debit" placeholder="" value="" type="text">
                  <span class="text-danger"></span>
                </div>
                <div class="form-group">
                  <label for="syslogno">Syslogno</label>
                  <input class="form-control" name="syslogno" placeholder="" value="" type="text">
                  <span class="text-danger"></span>
                </div>
                <div class="form-group">
                  <label for="channel_id">Channel ID</label>
                  <input class="form-control" name="channel_id" placeholder="" value="" type="text">
                  <span class="text-danger"></span>
                </div>
                <div class="form-group">
                  <label for="srac">Srac</label>
                  <input class="form-control" name="srac" placeholder="" value="" type="text">
                  <span class="text-danger"></span>
                </div>
                <div class="form-group">
                  <label for="dsac">Drac</label>
                  <input class="form-control" name="dsac" placeholder="" value="" type="text">
                  <span class="text-danger"></span>
                </div>
              </div>
            </div>






          </div>

        </div>
        <div class="modal-footer bg-whitesmoke br">
          <button type="button" class="btn btn-secondary float-left" data-dismiss="modal">Close</button>
          <button type="button" onclick="save_modify()" id="btnSave" class="btn btn-outline-primary float-right">Save</button>
        </div>
      </form>
    </div>
  </div>
</div>

<script src="<?php echo base_url(); ?>assets/modules/jquery.min.js"></script>
<script>
  var base_url = "<?= base_url() ?>";
  $('#nav-sub-report').addClass('dropdown active');
  $('#nav-report').addClass('active');
  var table;

  $("input").change(function() {
    $(this).removeClass('is-invalid');
    $(this).next().empty();
  });
  $('#btn-download-excel').hide();
  $('#btn-download-txt').hide();
  $('#btn-view').click(function() {
    $('#notif-available').hide();
    $('#result-data').hide();
    $('#btn-download-excel').show();
    $('#btn-download-excel').show();
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
          url: "<?php echo site_url('report/ajax_list_dana_float') ?>", // json dataclean
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
      $('#btn-download-excel').attr('href', base_url + 'report/download_excel_dana_float?&daterange=' + daterange);

    } else {
      alert('Fields Is Required');
    }
    // loading();  
    // setTimeout(function(){
    //   $('#result-data').show();

    // }, 1000)

  });
  
  $('#btn-download-excel').click(function() {
    var daterange = $('[name="daterange"]').val();
    console.log(daterange);
    if (daterange) {
      $.ajax({
        url: base_url + 'report/download_excel_dana_float',
        type: 'POST',
        dataType: 'JSON',
        data: {
          daterange: daterange
        },
        success: function(response) {
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
              url: "<?php echo site_url('clean/ajax_bulk_delete_dana_float') ?>",
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
              url: "<?php echo site_url('clean/ajax_bulk_rollback_dana_float') ?>",
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
            url: "<?php echo site_url('clean/ajax_delete_dana_float') ?>",
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

  function edit_danafloat(id) {
    $('#form-danafloat')[0].reset();
    $.ajax({
      url: "<?php echo site_url('clean/get_danafloat_by_id') ?>/" + id,
      type: "GET",
      dataType: "JSON",
      success: function(data) {
        $('[name="id"]').val(data.id);
        $('[name="wallet_code"]').val(data.wallet_code);
        $('[name="trx_code"]').val(data.trx_code);
        $('[name="trx_id"]').val(data.trx_id);
        $('[name="trx_type"]').val(data.trx_type);
        $('[name="trx_value"]').val(data.trx_value);
        $('[name="description"]').val(data.description);
        $('[name="credit"]').val(data.credit);
        $('[name="debit"]').val(data.debit);
        $('[name="syslogno"]').val(data.syslogno);
        $('[name="channel_id"]').val(data.channel_id);
        $('[name="srac"]').val(data.srac);
        $('[name="dsac"]').val(data.dsac);

        $('#modal_modify_danafloat').modal('show');
        $('.modal-title').text('Update Dana Float');
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert('Error get data from ajax');
      }
    });
  }

  function save_modify() {
    $.ajax({
      url: "<?php echo site_url('clean/update_clean_danafloat') ?>",
      type: "POST",
      data: $('#form-danafloat').serialize(),
      dataType: "JSON",
      success: function(data, response) {
        if (data.status) //if success close modal and reload ajax table
        {
          $('#btnSave').text('save'); //change button text
          $('#btnSave').attr('disabled', false); //set button enable 
          //if success close modal and reload ajax table
          $('#modal_modify_danafloat').modal('hide');
          iziToast.success({
            title: 'Success !',
            message: 'Data updated successfully ',
            position: 'topRight'
          });
          reload_table()
          // location.reload();// for reload a page
        } else {
          for (var i = 0; i < data.inputerror.length; i++) {
            $('[name="' + data.inputerror[i] + '"]').addClass('is-invalid'); //select parent twice to select div form-group class and add has-error class
            $('[name="' + data.inputerror[i] + '"]').next().text(data.error_string[i]); //select span help-block class set text error string
          }
        }

      }
    })
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