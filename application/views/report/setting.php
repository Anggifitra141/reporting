<style>
  .modal-title {
    margin-top: -10px;
  }
</style>

<section class="section">
  <div class="section-header">
    <h1>Setting Report</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Manage Setting Report</h2>

    <div class="row">
      <div class="col-12">

        <div class="card">
          <div class="card-body">
            <div class="">
              <table class="table table-striped" id="table" style="width: 100%;">
                <thead>
                  <tr>
                    <th class="text-center" width="1px">
                      No
                    </th>
                    <!-- <th width="10px" style="width:90px;">Action</th> -->
                    <th>Code</th>
                    <th>Name</th>
                    <th>Period</th>
                    <th>Regulator</th>
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
<div class="modal fade" tabindex="-1" role="dialog" id="modal_report">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header  bg-primary text-white">
        <h5 class="modal-title">Add Report</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" id="form_report">
          <div class="form-body">
            <input type="hidden" class="form-control" name="report_id">
            <div class="form-group">
              <label>report</label>
              <input type="text" class="form-control" name="report">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Is Active :</label><br>
              <select name="is_active" id="is_active" class="form-control">
                <option value="Y"> ACTIVE </option>
                <option value="N"> NOT ACTIVE </option>
              </select>
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
  $('#nav-master-data').addClass('dropdown active');
  $('#nav-setting-report').addClass('active');

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
        url: "<?php echo site_url('report/ajax_setting_report') ?>", // json datasource
        type: "POST"
      },
      "columnDefs": [{
        "orderable": false
      }],
    });

  });

  /* -- Action -- */


  function get_report(report_id) {
    save_method = 'update';
    cek_privileges('update', event);
    $('#form_report')[0].reset();
    $.ajax({
      url: "<?php echo site_url('report/get_report') ?>/" + report_id,
      type: "GET",
      dataType: "JSON",
      success: function(data) {
        $('[name="report_id"]').val(data.report_id);
        $('[name="report"]').val(data.report);
        $('[name="is_active"]').val(data.is_active);

        $('#modal_report').modal('show');
        $('.modal-title').text('Update Report');
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert('Error get data from ajax');
      }
    });
  }

  function save() {
    var url;
    if (save_method == 'add') {
      url = "<?php echo site_url('report/add_report') ?>";
    } else {
      url = "<?php echo site_url('report/update_report') ?>";
    }
    // ajax adding data to database
    $.ajax({
      url: url,
      type: "POST",
      data: $('#form_report').serialize(),
      dataType: "JSON",
      success: function(data, response) {
        if (data.status) //if success close modal and reload ajax table
        {
          $('#btnSave').text('save'); //change button text
          $('#btnSave').attr('disabled', false); //set button enable 
          //if success close modal and reload ajax table
          $('#modal_report').modal('hide');
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

  function delete_report(report_id) {
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
            url: "<?php echo site_url('report/delete_report') ?>/" + report_id,
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