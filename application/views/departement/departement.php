<style>
  .modal-title{
    margin-top: -10px;
  }
</style>
<section class="section">
  <div class="section-header">
    <h1>Departement</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Manage Departement</h2>

    <div class="row">
      <div class="col-12">
        <div class="form-group">
          <?php if($this->session->userdata('level') != 'guest'){ ?>
          <a href="#" onclick="add_departement()" class="btn btn-icon icon-left btn-primary"><i class="far fa-plus-square"></i> Add</a>
          <?php }?>
          <a href="#" class="btn btn-icon icon-left btn-warning"><i class="fa fa-filter"></i> Filter</a>
          <a href="#" class="btn btn-icon icon-left btn-success"><i class="fas fa-download"></i> Download </a>
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
                    <th width="70px">Action</th>
                    <th>Departement Name</th>
                    <th>Head Of Departement</th>
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
<div class="modal fade" tabindex="-1" role="dialog" id="modal_departement">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header bg-primary text-white">
        <h5 class="modal-title">Add departement</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" id="form_departement">
          <div class="form-body">
            <input type="hidden" class="form-control" name="departement_id">
            <div class="form-group">
              <label>Departement Name</label>
              <input type="text" class="form-control" name="departement_name">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Head Of Departement</label>
              <input type="text" class="form-control" name="head_of_departement">
              <span class="invalid-feedback"></span>
            </div>
          </div>
        </form>
      </div>
      <div class="modal-footer bg-whitesmoke br">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" onclick="save();" class="btn btn-primary">Save</button>
      </div>
    </div>
  </div>
</div>
</div>
<script src="<?php echo base_url(); ?>assets/modules/jquery.min.js"></script>
<script>
  $("input").change(function(){
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
          url: "<?php echo site_url('departement/ajax_list')?>", // json datasource
          type: "POST"
        },
        "columnDefs": [{
          "orderable": false
        }],
      });

  });

  /* -- Action -- */
  function add_departement() {
    save_method = 'add';
    $('#form_departement')[0].reset();
    $('.form-control').removeClass('is-invalid'); // clear error class
    $('#modal_departement').modal('show'); // show bootstrap modal
    //$('.modal-title').text('Add Person'); // Set Title to Bootstrap modal title
  }

  function get_departement(departement_id) {
    save_method = 'update';
    $('#form_departement')[0].reset();
    $.ajax({
      url: "<?php echo site_url('departement/get_departement')?>/" + departement_id,
      type: "GET",
      dataType: "JSON",
      success: function(data) {

        $('[name="departement_id"]').val(data.departement_id);
        $('[name="departement_name"]').val(data.departement_name);
        $('[name="head_of_departement"]').val(data.head_of_departement);

        $('#modal_departement').modal('show');
        $('.modal-title').text('Update departement');
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert('Error get data from ajax');
      }
    });
  }

  function save() {
    var url;
    if (save_method == 'add') {
      url = "<?php echo site_url('departement/add_departement')?>";
    } else {
      url = "<?php echo site_url('departement/update_departement')?>";
    }
    // ajax adding data to database
    $.ajax({
      url: url,
      type: "POST",
      data: $('#form_departement').serialize(),
      dataType: "JSON",
      success: function(data, response) {
        if(data.status) //if success close modal and reload ajax table
        {
          //if success close modal and reload ajax table
          $('#modal_departement').modal('hide');
          iziToast.success({
            title: 'Success !',
            message: 'Data saved successfully ',
            position: 'topRight'
          });
          $('#table').DataTable().ajax.reload();
          // location.reload();// for reload a page
        }else{
            for (var i = 0; i < data.inputerror.length; i++) 
            {
                $('[name="'+data.inputerror[i]+'"]').addClass('is-invalid'); //select parent twice to select div form-group class and add has-error class
                $('[name="'+data.inputerror[i]+'"]').next().text(data.error_string[i]); //select span help-block class set text error string
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

  function delete_departement(departement_id) {

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
            url: "<?php echo site_url('departement/delete_departement')?>/" + departement_id,
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
