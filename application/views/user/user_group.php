<style>
  .modal-title {
    margin-top: -10px;
  }
</style>

<section class="section">
  <div class="section-header">
    <h1>User Group</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Manage User Group</h2>

    <div class="row">
      <div class="col-12">
        <div class="form-group">
          <a href="#" onclick="add_user_group()" class="btn btn-icon icon-left btn-outline-primary"><i class="far fa-plus-square"></i> Add</a>
          <!-- <a href="#" class="btn btn-icon icon-left btn-outline-warning"><i class="fa fa-filter"></i> Filter</a> -->
          <!-- <a href="#" class="btn btn-icon icon-left btn-outline-success"><i class="fas fa-download"></i> Download </a> -->
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
                    <th>Group Name</th>
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
<div class="modal fade" tabindex="-1" role="dialog" id="modal_user_group">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header  bg-primary text-white">
        <h5 class="modal-title">Add User Group</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" id="form_user_group">
          <div class="form-body">
            <input type="hidden" class="form-control" name="id">
            <div class="form-group">
              <label>Group Name</label>
              <input type="text" class="form-control" name="group_name">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Allowed Actions :</label><br>
              <label for="add-action"><input type="checkbox" id="add-action" name="action[]" value="add"> Add&ensp;</label>
              <label for="update-action"><input type="checkbox" id="update-action" name="action[]" value="update"> Edit&ensp;</label>
              <label for="delete-action"><input type="checkbox" id="delete-action" name="action[]" value="delete"> Delete&ensp;</label>
              <label for="view-action"><input type="checkbox" id="view-action" name="action[]" value="view"> View Only&ensp;</label>
              <label for="download-action"><input type="checkbox" id="download-action" name="action[]" value="download"> Download&ensp;</label>
            </div>
            <div class="row">
              <div class="col-sm-2">
                <div class="form-group">
                  <label>Allowed Menus :</label>
                </div>
              </div>
              <div class="col-sm-6">
                <label>Regulator Management </label><br>
                ?????????<input type="checkbox" id="dashboard" name="access[]" value="dashboard"> Dashboard<br>
                ?????????<input type="checkbox" id="ltdbb" name="access[]" value="ltdbb"> LTDBB<br>
                ?????????<input type="checkbox" id="ltkl" name="access[]" value="ltkl"> LTKL<br>
                ?????????<input type="checkbox" id="qris" name="access[]" value="qris"> QRIS<br>
                ?????????<input type="checkbox" id="dana_float" name="access[]" value="dana_float"> Dana Float<br>
                ?????????<input type="checkbox" id="payment_gateway" name="access[]" value="payment_gateway"> Payment Gateway<br>
                ?????????<input type="checkbox" id="sipesat" name="access[]" value="sipesat"> Si Pesat<br>
                ????????? LKPBU <br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?????????<input type="checkbox" id="lkpbu_302" name="access[]" value="lkpbu_302"> LKPBU 302<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?????????<input type="checkbox" id="lkpbu_303" name="access[]" value="lkpbu_303"> LKPBU 303<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?????????<input type="checkbox" id="lkpbu_304" name="access[]" value="lkpbu_304"> LKPBU 304<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?????????<input type="checkbox" id="lkpbu_306" name="access[]" value="lkpbu_306"> LKPBU 306<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?????????<input type="checkbox" id="lkpbu_309_310_311" name="access[]" value="lkpbu_309_310_311"> LKPBU 309, 310 & 311<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?????????<input type="checkbox" id="lkpbu_312" name="access[]" value="lkpbu_312"> LKPBU 312<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?????????<input type="checkbox" id="lkpbu_313" name="access[]" value="lkpbu_313"> LKPBU 313<br>
                <input type="checkbox" id="sys_availability" name="access[]" value="sys_availability"> System Availability<br>
                </label>
              </div>
              <div class="col-sm-3">
                <label>Cleansing </label><br>
                ?????????<input type="checkbox" id="cleansing_ltdbb" name="access[]" value="cleansing_ltdbb"> LTDBB<br>
                ?????????<input type="checkbox" id="cleansing_ltkl" name="access[]" value="cleansing_ltkl"> LTKL<br>
                </label>
                <br><br>
                <label>System Setting </label><br>
                ?????????<input type="checkbox" id="master_data" name="access[]" value="master_data"> Master Data<br>
                ?????????<input type="checkbox" id="user_group" name="access[]" value="user_group"> User Group<br>
                ?????????<input type="checkbox" id="user" name="access[]" value="user"> User<br>
                ?????????<input type="checkbox" id="user_activity" name="access[]" value="user_activity"> User Activity<br />
                ?????????<input type="checkbox" id="archive" name="access[]" value="archive"> Archive<br>
                </label>
              </div>


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
  $('#nav-user-group').addClass('active');
  $("input").change(function() {
    $(this).removeClass('is-invalid');
    $(this).next().empty();
  });
  $(document).ready(function() {

    var table = $('#table').DataTable({
      "deferRender": true,
      "scrollCollapse": true,
      "scrollX": true,
      "processing": true,
      "serverSide": true,
      "order": [],
      "ajax": {
        url: "<?php echo site_url('user_group/ajax_list') ?>", // json datasource
        type: "POST"
      },
      "columnDefs": [{
        "orderable": false
      }],
    });

  });

  /* -- Action -- */
  function add_user_group() {
    save_method = 'add';
    cek_privileges('add', event);
    $('.form-control').removeClass('is-invalid'); // clear error class
    $('#form_user_group')[0].reset();
    $('#modal_user_group').modal('show'); // show bootstrap modal
    $('.modal-title').text('Add User Group'); // Set Title to Bootstrap modal title
  }

  function get_user_group(id) {
    save_method = 'update';
    cek_privileges('update', event);
    $('#form_user_group')[0].reset();
    $.ajax({
      url: "<?php echo site_url('user_group/get_user_group') ?>/" + id,
      type: "GET",
      dataType: "JSON",
      success: function(data) {
        var access = data.access.split('#');
        var actions = data.action;
        $('[name="access[]"]').attr('checked', false)
        for (i = 0; i < access.length; i++) {
          $('#' + access[i]).attr('checked', true)
        }



        $('[name="id"]').val(data.id);
        $('[name="group_name"]').val(data.group_name);

        if (actions.match(/add/g)) {
          $('#add-action').attr('checked', true);
        } else {
          $('#add-action').attr('checked', false);
        }
        if (actions.match(/update/g)) {
          $('#update-action').attr('checked', true);
        } else {
          $('#update-action').attr('checked', false);
        }
        if (actions.match(/delete/g)) {
          $('#delete-action').attr('checked', true);
        } else {
          $('#delete-action').attr('checked', false);
        }
        if (actions.match(/view/g)) {
          $('#view-action').attr('checked', true);
        } else {
          $('#view-action').attr('checked', false);
        }
        if (actions.match(/download/g)) {
          $('#download-action').attr('checked', true);
        } else {
          $('#download-action').attr('checked', false);
        }

        $('#modal_user_group').modal('show');
        $('.modal-title').text('Update user_group');
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert('Error get data from ajax');
      }
    });
  }

  function save() {
    var url;
    if (save_method == 'add') {
      url = "<?php echo site_url('user_group/add_user_group') ?>";
    } else {
      url = "<?php echo site_url('user_group/update_user_group') ?>";
    }
    // ajax adding data to database
    $.ajax({
      url: url,
      type: "POST",
      data: $('#form_user_group').serialize(),
      dataType: "JSON",
      success: function(data, response) {
        if (data.status) //if success close modal and reload ajax table
        {
          $('#btnSave').text('save'); //change button text
          $('#btnSave').attr('disabled', false); //set button enable 
          //if success close modal and reload ajax table
          $('#modal_user_group').modal('hide');
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

  function delete_user_group(id) {
    var event = "<?php echo $this->session->userdata('action'); ?>";
    console.log(event)
    if (event.match(/delete/g)) {
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
              url: "<?php echo site_url('user_group/delete_user_group') ?>/" + id,
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
    } else {
      iziToast.error({
        title: 'Error !',
        message: 'You have no right to this action.',
        position: 'bottomCenter'
      });
    }
  }
</script>