<style>
  .modal-title {
    margin-top: -10px;
  }
</style>

<section class="section">
  <div class="section-header">
    <h1>Master Data</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Ltdbb BI City</h2>

    <div class="row">
      <div class="col-12">
        <div class="form-group">
          <a href="#" onclick="add_ltdbb_bi_city()" class="btn btn-icon icon-left btn-outline-primary"><i class="far fa-plus-square"></i> Add</a>
        </div>
        <div class="card">
          <div class="card-body">
            <div class="">
              <table class="table table-striped" id="table" style="width: 100%;">
                <thead>
                  <tr>
                    <th class="text-center" width="1px">
                      No
                    </th>
                    <th style="width: 80px;">Action</th>
                    <th>BI Code</th>
                    <th>City</th>
                    <th>BI City</th>
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

<!-- Modal -->
<div class="modal fade" tabindex="-1" role="dialog" id="modal_ltdbb_bi_city">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header  bg-primary text-white">
        <h5 class="modal-title"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" id="form_ltdbb_bi_city">
          <input type="hidden" name="id">
          <div class="form-body">
            <div class="form-group">
              <label>BI Code</label>
              <input type="text" class="form-control" name="bi_code">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>city</label>
              <input type="text" class="form-control" name="city">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>BI city</label>
              <input type="text" class="form-control" name="bi_city">
              <span class="invalid-feedback"></span>
            </div>
          </div>
        </form>
      </div>
      <div class="modal-footer bg-whitesmoke br">
        <button type="button" class="btn btn-secondary float-left" data-dismiss="modal">Close</button>
        <button type="button" onclick="save();" class="btn btn-outline-primary float-right">Save</button>
      </div>
    </div>
  </div>
</div>

<script src="<?php echo base_url(); ?>assets/modules/jquery.min.js"></script>
<script>
  $("input").change(function() {
    $(this).removeClass('is-invalid');
    $(this).next().empty();
  });
  $(document).ready(function() {

    var table = $('#table').DataTable({
      "deferRender": true,
      "ordering": false,
      "scrollCollapse": false,
      "scrollX": false,
      "processing": true,
      "serverSide": true,
      "order": [],
      "ajax": {
        url: "<?php echo site_url('master/ajax_list_ltdbb_bi_city') ?>", // json datasource
        type: "POST"
      },
      "columnDefs": [{
        "orderable": false
      }],
    });

  });

  /* -- Action -- */
  function add_ltdbb_bi_city() {
    cek_privileges('add', event);
    save_method = 'add';
    $('.form-control').removeClass('is-invalid'); // clear error class
    $('#form_ltdbb_bi_city')[0].reset();
    $('#modal_ltdbb_bi_city').modal('show'); // show bootstrap modal
    $('.modal-title').text('Add ltdbb bi city'); // Set Title to Bootstrap modal title
  }

  function get_ltdbb_bi_city(id) {
    cek_privileges('update', event);
    save_method = 'update';
    $('#form_ltdbb_bi_city')[0].reset();
    $.ajax({
      url: "<?php echo site_url('master/get_ltdbb_bi_city') ?>/" + id,
      type: "GET",
      dataType: "JSON",
      success: function(data) {
        $('[name="id"]').val(data.id);
        $('[name="bi_code"]').val(data.bi_code);
        $('[name="city"]').val(data.city);
        $('[name="bi_city"]').val(data.bi_city);

        $('#modal_ltdbb_bi_city').modal('show');
        $('.modal-title').text('Update ltdbb bi city');
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert('Error get data from ajax');
      }
    });
  }

  function save() {
    var url;
    if (save_method == 'add') {
      url = "<?php echo site_url('master/add_ltdbb_bi_city') ?>";
    } else {
      url = "<?php echo site_url('master/update_ltdbb_bi_city') ?>";
    }
    // ajax adding data to database
    $.ajax({
      url: url,
      type: "POST",
      data: $('#form_ltdbb_bi_city').serialize(),
      dataType: "JSON",
      success: function(data, response) {
        if (data.status) //if success close modal and reload ajax table
        {
          $('#btnSave').text('save'); //change button text
          $('#btnSave').attr('disabled', false); //set button enable 
          //if success close modal and reload ajax table
          $('#modal_ltdbb_bi_city').modal('hide');
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

  function delete_ltdbb_bi_city(id) {
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
            url: "<?php echo site_url('master/delete_ltdbb_bi_city') ?>/" + id,
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