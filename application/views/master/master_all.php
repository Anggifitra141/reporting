<style>
  .modal-title {
    margin-top: -10px;
  }
</style>

<section class="section">
  <div class="section-header">
    <h1 id="section-header">123</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title" id="section-title">Master </h2>

    <div class="row">
      <div class="col-12">
        <div class="form-group">
          <a href="#" onclick="add_master_all()" class="btn btn-icon icon-left btn-outline-primary"><i class="far fa-plus-square"></i> Add</a>
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
                    <th>Action</th>
                    <th>Code</th>
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
<!-- Modal -->
<div class="modal fade" tabindex="-1" role="dialog" id="modal_master_all">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header  bg-primary text-white">
        <h5 class="modal-title">Add Role Model</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" id="form_master_all">
          <input type="hidden" name="id">
          <div class="form-body">
            <div class="form-group">
              <label>Code</label>
              <input type="text" class="form-control" name="code">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Description</label>
              <textarea name="description" class="form-control"></textarea>
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Status</label>
              <select class="form-control" name="status">
                <option value="active" id="status-active">Active</option>
                <option value="no active" id="status-no-active" selected>No Active</option>
              </select>
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
  var table_query = "<?= $this->uri->segment(3) ?>";
  var table_query_split = table_query.split('_');
  $('#nav-master-data').addClass('dropdown active');
  $('#nav-' + table_query_split[1]).addClass('active');
  $('#section-header').text(table_query_split[1].toUpperCase());
  $('#section-title').text('Master ' + table_query_split[1]);

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
        url: "<?php echo site_url('master/ajax_master_all') ?>", // json datasource
        type: "POST",
        data: function(data) {
          data.table = table_query
        },
      },
      "columnDefs": [{
        "orderable": false
      }],
    });

  });



  /* -- Action -- */
  function add_master_all() {
    cek_privileges('add', event);
    save_method = 'add';
    $('.form-control').removeClass('is-invalid'); // clear error class
    $('#form_master_all')[0].reset();
    $('#modal_master_all').modal('show'); // show bootstrap modal
    $('.modal-title').text('Add ' + table_query_split[2].toUpperCase()); // Set Title to Bootstrap modal title
  }

  function get_master_all(id) {
    cek_privileges('update', event);
    save_method = 'update';
    $('#form_master_all')[0].reset();
    $.ajax({
      url: "<?php echo site_url('master/get_master_all') ?>/" + id + '/' + table_query,
      type: "GET",
      dataType: "JSON",
      success: function(data) {
        $('[name="id"]').val(data.id);
        $('[name="code"]').val(data.code);
        $('[name="description"]').val(data.description);
        if (data.status == 'active') {
          $('#status-active').attr('selected', true);
        } else {
          $('#status-no-active').attr('selected', true);
        }

        $('#modal_master_all').modal('show');
        $('.modal-title').text('Update '.table_query_split[2].toUpperCase());
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert('Error get data from ajax');
      }
    });
  }

  function save() {
    var url;
    if (save_method == 'add') {
      url = "<?php echo site_url('master/add_master_all/') ?>" + table_query;
    } else {
      url = "<?php echo site_url('master/update_master_all/') ?>" + table_query;
    }
    // ajax adding data to database
    $.ajax({
      url: url,
      type: "POST",
      data: $('#form_master_all').serialize(),
      dataType: "JSON",
      success: function(data, response) {
        if (data.status) //if success close modal and reload ajax table
        {
          $('#btnSave').text('save'); //change button text
          $('#btnSave').attr('disabled', false); //set button enable 
          //if success close modal and reload ajax table
          $('#modal_master_all').modal('hide');
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

  function delete_master_all(id) {
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
            url: "<?php echo site_url('master/delete_master_all') ?>/" + table_query + '/' + id,
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