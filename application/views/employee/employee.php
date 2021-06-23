<style>
  .modal-title{
    margin-top: -10px;
  }
</style>

<section class="section">
  <div class="section-header">
    <h1>employee</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Manage employee</h2>

    <div class="row">
      <div class="col-12">
        <div class="form-group">
          <?php if($this->session->userdata('level') != 'guest'){ ?>
          <a href="#" onclick="add_employee()" class="btn btn-icon icon-left btn-primary"><i class="far fa-plus-square"></i> Add</a>
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
                    <th>Action</th>
                    <th>Nik</th>
                    <th>Name</th>
                    <th>Position</th>
                    <th>Place, Date Of Brith</th>
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
<div class="modal fade" tabindex="-1" role="dialog" id="modal_employee">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header  bg-primary text-white">
        <h5 class="modal-title">Add Employee</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" id="form_employee">
          <div class="form-body">
            <input type="hidden" class="form-control" name="employee_id">
            <div class="form-group">
              <label>NIK</label>
              <input type="number" class="form-control" name="nik">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Name</label>
              <input type="text" class="form-control" name="name">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Gender</label>
              <select class="form-control" name="gender">
                <option value="">-- Select Gender --</option>
                <option value="M">Male</option>
                <option value="F">Female</option>
              </select>
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Position</label>
              <input type="text" class="form-control" name="position">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Departemen</label>
              <select class="form-control" name="departemen">
                <option value="">-- Select Departemen --</option>
                <?php foreach($departemen as $key) : ?>
                  <option value="<?= $key->head_of_departement ?>"><?= $key->departement_name . ' - '. $key->head_of_departement ?></option>
                <?php endforeach; ?>
              </select>
              <span class="invalid-feedback"></span>
            </div>
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label>Place Of Birth</label>
                    <input type="text" class="form-control" name="place_of_birth">
                    <span class="invalid-feedback"></span>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label>Date Of Birth</label>
                    <input type="date" class="form-control" name="date_of_birth">
                    <span class="invalid-feedback"></span>
                </div>
              </div>
            </div>
            <div class="form-group">
              <label>Email</label>
              <input type="text" class="form-control" name="email">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Phone</label>
              <input type="text" class="form-control" name="phone">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Join Date</label>
                <input type="date" class="form-control" name="join_date">
                <span class="invalid-feedback"></span>
            </div>
            
            <div class="form-group">
              <label>Province</label>
              <input type="text" class="form-control" name="province">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>City</label>
              <input type="text" class="form-control" name="city">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Address Line</label>
                <textarea class="form-control" name="addres_line"></textarea>
                <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>ZIP</label>
              <input type="number" class="form-control" name="zip">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Religion</label>
              <select class="form-control" name="religion">
                <option value="">-- Select Gender --</option>
                <option value="Islam">Islam</option>
								<option value="Protestan" >Protestan</option>
								<option value="Katolik" >Katolik</option>
								<option value="Hindu" >Hindu</option>
								<option value="Budha" >Budha</option>
								<option value="Kong Hu Cu" >Kong Hu Cu</option>
              </select>
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Citizen</label>
              <select class="form-control" name="wn">
                <option value="">-- Select Citizen --</option>
                <option value="Indonesia">Indonesia</option>
								<option value="Luar Negeri" >Luar Negeri</option>
              </select>
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Marital Status</label>
              <select class="form-control" name="marital_status">
                <option value="">-- Select Marital Status --</option>
                <option value="TK" >TK</option>
								<option value="K/0" >K/0</option>
								<option value="K/1" >K/1</option>
								<option value="K/2">K/2</option>
								<option value="K/3" >K/3</option>
              </select>
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Status Pph</label>
              <select class="form-control" name="pph_status">
                <option value="">-- Select Status Pph --</option>
                <option value="TK" >TK</option>
								<option value="K/0" >K/0</option>
								<option value="K/1" >K/1</option>
								<option value="K/2">K/2</option>
								<option value="K/3" >K/3</option>
              </select>
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Blood Group</label>
              <select class="form-control" name="blood_group">
                <option value="">-- Select Blood Group --</option>
                <option value="A" >A</option>
								<option value="AB">AB</option>
								<option value="B" >B</option>
								<option value="O" >O</option>
              </select>
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Npwp</label>
              <input type="text" class="form-control" name="npwp">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>BPJS Healty Number</label>
              <input type="text" class="form-control" name="bpjs_healt_number">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>BPJS Employee Number</label>
              <input type="text" class="form-control" name="bpjs_employment_number">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>BPJS Pension Number</label>
              <input type="text" class="form-control" name="bpjs_pension_number">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Bank Account Name</label>
              <input type="text" class="form-control" name="bank_account_name">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Bank Account Number</label>
              <input type="text" class="form-control" name="bank_account_number">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Remaining Days Of</label>
              <input type="text" class="form-control" name="remaining_days_off">
              <span class="invalid-feedback"></span>
            </div>
          </div>
        </form>
      </div>
      <div class="modal-footer bg-whitesmoke br">
        <button type="button" class="btn btn-secondary float-left" data-dismiss="modal">Close</button>
        <button type="button" onclick="save();" class="btn btn-primary float-right">Save</button>
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
  $("select").change(function(){
      $(this).removeClass('is-invalid');
      $(this).next().empty();
  });
  $("textare").change(function(){
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
          url: "<?php echo site_url('employee/ajax_list')?>", // json datasource
          type: "POST"
        },
        "columnDefs": [{
          "orderable": false
        }],
      });

  });

  /* -- Action -- */
  function add_employee() {
    save_method = 'add';
    $('.form-control').removeClass('is-invalid'); // clear error class
    $('#form_employee')[0].reset();
    $('#modal_employee').modal('show'); // show bootstrap modal
    $('.modal-title').text('Add employee'); // Set Title to Bootstrap modal title
  }

  function get_employee(employee_id) {
    save_method = 'update';
    $('#form_employee')[0].reset();
    $.ajax({
      url: "<?php echo site_url('employee/get_employee')?>/" + employee_id,
      type: "GET",
      dataType: "JSON",
      success: function(data) {
        $('[name="employee_id"]').val(data.employee_id);
        $('[name="nik"]').val(data.nik);
        $('[name="name"]').val(data.name);
        $('[name="gender"]').val(data.gender);
        $('[name="departemen"]').val(data.departemen);
        $('[name="position"]').val(data.position);
        $('[name="date_of_birth"]').val(data.date_of_birth);
        $('[name="place_of_birth"]').val(data.place_of_birth);
        $('[name="join_date"]').val(data.join_date);
        $('[name="addres_line"]').val(data.addres_line);
        $('[name="city"]').val(data.city);
        $('[name="province"]').val(data.province);
        $('[name="zip"]').val(data.zip);
        $('[name="religion"]').val(data.religion);
        $('[name="wn"]').val(data.wn);
        $('[name="marital_status"]').val(data.marital_status);
        $('[name="pph_status"]').val(data.pph_status);
        $('[name="blood_group"]').val(data.blood_group);
        $('[name="email"]').val(data.email);
        $('[name="phone"]').val(data.phone);
        $('[name="npwp"]').val(data.npwp);
        $('[name="bpjs_healt_number"]').val(data.bpjs_healt_number);
        $('[name="bpjs_employment_number"]').val(data.bpjs_employment_number);
        $('[name="bpjs_pension_number"]').val(data.bpjs_pension_number);
        $('[name="bank_account_name"]').val(data.bank_account_name);
        $('[name="bank_account_number"]').val(data.bank_account_number);
        $('[name="remaining_days_off"]').val(data.remaining_days_off);

        $('#modal_employee').modal('show');
        $('.modal-title').text('Update employee');
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert('Error get data from ajax');
      }
    });
  }

  function save() {
    var url;
    if (save_method == 'add') {
      url = "<?php echo site_url('employee/add_employee')?>";
    } else {
      url = "<?php echo site_url('employee/update_employee')?>";
    }
    // ajax adding data to database
    $.ajax({
      url: url,
      type: "POST",
      data: $('#form_employee').serialize(),
      dataType: "JSON",
      success: function(data, response) {
        console.log(data)
        if(data.status) //if success close modal and reload ajax table
        {
          $('#btnSave').text('save'); //change button text
          $('#btnSave').attr('disabled',false); //set button enable 
          //if success close modal and reload ajax table
          $('#modal_employee').modal('hide');
          iziToast.success({
            title: 'Success !',
            message: 'Data saved successfully ',
            position: 'topRight'
          });
          $('#table').DataTable().ajax.reload();
          // location.reload();// for reload a page
        }
        else
        {
            for (var i = 0; i < data.inputerror.length; i++) 
            {
                $('[name="'+data.inputerror[i]+'"]').addClass('is-invalid'); //select parent twice to select div form-group class and add has-error class
                $('[name="'+data.inputerror[i]+'"]').next().text(data.error_string[i]); //select span help-block class set text error string
            }
        }
      },
      error: function(jqXHR, textStatus, errorThrown) {
        iziToast.success({
          title: 'Error !',
          message: 'Please try again',
          position: 'topRight'
        });
      }
    });
  }

  function delete_employee(employee_id) {

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
            url: "<?php echo site_url('employee/delete_employee')?>/" + employee_id,
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
