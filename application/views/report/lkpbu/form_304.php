<style>
  .modal-title {
    margin-top: -10px;
  }
</style>

<section class="section">
  <div class="section-header">
    <h1>LKPBU</h1>
  </div>

  <div class="section-body">Manage Report LKPBU FORM 304</h2>

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
              <div class="col-md-2">
                <button class="btn btn-icon btn-outline-warning btn-block" style="margin-top:27px;" id="btn-view"><i class="fas fa-eye"></i> View </button>
              </div>
              <div class="col-md-2">
                <a href="" download class="btn btn-icon btn-outline-success btn-block" style="margin-top:27px;" id="btn-download-excel"><i class="fas fa-file-excel"></i> Download Excel </a>
              </div>
            </div>
            <div class="row mt-4" id="result-data" style="display: none;">
              <div class="col-md-12">
                <div class="table-responsive">
                  <table class="table table-striped" id="table" style="width: 100%;">
                    <thead>
                      <tr>
                        <th class="text-center" width="1px">
                          No
                        </th>
                        <th>Jenis Mesin</th>
                        <th>Jumlah Mesin</th>
                        <th>Jumlah Pedagang</th>
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
  $("input").change(function() {
    $(this).removeClass('is-invalid');
    $(this).next().empty();
  });
  $('#nav-report').addClass('active');
  $('#nav-lkpbu-report').addClass('active');
  $('#nav-lkpbu-report-304').addClass('active');
  $(document).ready(function() {

    $('#btn-download-excel').hide();

    $('#btn-view').click(function() {
      $('#notif-available').hide();
      $('#result-data').hide();
      $('#btn-download-excel').show();
      $('#btn-download-excel').show();
      $('#table-data').DataTable().destroy();

      var daterange = $('[name="daterange"]').val();

      if (daterange) {

        //
        table = $('#table').DataTable({
          "deferRender": true,
          "ordering": false,
          "scrollCollapse": true,
          "scrollX": true,
          "processing": true,
          "serverSide": true,
          "order": [],
          "ajax": {
            url: "<?php echo site_url('report/ajax_list_lkpbu_304') ?>", // json datasource
            type: "POST",
            data: function(data) {
              data.daterange = $('[name="daterange"]').val();
            }
          },
          "columnDefs": [{
            "orderable": false
          }],

        });
        $('#result-data').slideDown('slow');

        $('#btn-download-excel').attr('href', base_url + 'report/download_excel_lkpbu_304?daterange=' + daterange);

      } else {
        alert('Fields Is Required');
      }
      // loading();  
      // setTimeout(function(){
      //   $('#result-data').show();

      // }, 1000)

    });



  });



  /* -- Action -- */
  function add_form_304() {
    cek_privileges('add', event);
    save_method = 'add';
    $('.form-control').removeClass('is-invalid'); // clear error class
    $('#form_304')[0].reset();
    $('#modal_form_304').modal('show'); // show bootstrap modal
    $('.modal-title').text('Add LKPBU (form 304)'); // Set Title to Bootstrap modal title
  }

  function get_form_304(id) {
    cek_privileges('update', event);
    save_method = 'update';
    $('#form_304')[0].reset();
    $.ajax({
      url: "<?php echo site_url('report/get_form_304') ?>/" + id,
      type: "GET",
      dataType: "JSON",
      success: function(data) {
        $('[name="id"]').val(data.id);
        $('[name="machine_code"]').val(data.machine_code);
        $('[name="total_machine"]').val(data.total_machine);
        $('[name="total_seller"]').val(data.total_seller);
        $('[name="trx_date"]').val(data.trx_date);

        $('#modal_form_304').modal('show');
        $('.modal-title').text('Update LKPBU (form 304)');
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert('Error get data from ajax');
      }
    });
  }

  $('[name="daterange"]').change(function() {
    reload_table();
  })

  function reload_table() {
    table.ajax.reload(null, false);
  }

  function save() {
    var url;
    if (save_method == 'add') {
      url = "<?php echo site_url('clean/add_form_304') ?>";
    } else {
      url = "<?php echo site_url('clean/update_form_304') ?>";
    }
    // ajax adding data to database
    $.ajax({
      url: url,
      type: "POST",
      data: $('#form_304').serialize(),
      dataType: "JSON",
      success: function(data, response) {
        if (data.status) //if success close modal and reload ajax table
        {
          $('#btnSave').text('save'); //change button text
          $('#btnSave').attr('disabled', false); //set button enable 
          //if success close modal and reload ajax table
          $('#modal_form_304').modal('hide');
          iziToast.success({
            title: 'Success !',
            message: 'Data saved successfully ',
            position: 'topRight'
          });
          $('#table').DataTable().ajax.reload();
          // location.reload();// for reload a page
        } else {
          for (var i = 0; i < data.inputerror.length; i++) {
            $('[name="' + data.inputerror[i] + '"]').addClass('is-invalid'); //select parent twice to select div form-group class and add has-error class
            $('[name="' + data.inputerror[i] + '"]').next().text(data.error_string[i]); //select span help-block class set text error string
          }
        }
      },
      error: function(jqXHR, textStatus, errorThrown) {
        iziToast.danger({
          title: 'Error !',
          message: 'Please try again',
          position: 'topRight'
        });
      }
    });
  }

  function delete_form_304(id) {
    cek_privileges('delete', event);
      swal({
          title: "Are you sure ?",
          text: "Once deleted, you will not be able to recover this data !",
          icon: "warning",
          buttons: true,
          dangerMode: true,
        })
        .then((willDelete) => {
          if (willDelete) {
            $.ajax({
              url: "<?php echo site_url('clean/delete_form_304') ?>/" + id,
              type: "post",
              complete: function() {
                swal("Your data has been deleted!", {
                  icon: "success",
                }).then(function() {
                  $('#table').DataTable().ajax.reload();
                });
              }
            });

          } else {
            swal("Data failed deleted !");
          }
        });
  }
</script>