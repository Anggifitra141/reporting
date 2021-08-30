<style>
  .modal-title {
    margin-top: -10px;
  }
</style>

<section class="section">
  <div class="section-header">
    <h1>User Acitivity</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">User Activity</h2>

    <div class="row">
      <div class="col-12">
        <div class="card">
          <div class="card-body">
            <div class="row">
              <div class="col-md-4">
                <div class="form-group">
                  <label>Date Range</label>
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <div class="input-group-text">
                        <i class="fas fa-calendar"></i>
                      </div>
                    </div>
                    <input type="text" class="form-control daterange-picker" name="daterange" id="daterange">
                  </div>
                </div>
              </div>
              <div class="col-md-3">
                <div class="form-group">
                  <label>Type Log</label>
                  <select class="form-control" name="event_type" id="event_type">
                    <option value=""> --- Select ---</option>
                    <option value="LOGIN"> LOGIN</option>
                    <option value="LOGOUT"> LOGOUT</option>
                    <option value="ADD"> ADD</option>
                    <option value="UPDATE"> UPDATE</option>
                    <option value="DELETE"> DELETE</option>
                    <option value="DOWNLOAD"> DOWNLOAD</option>
                    <option value="OTHER"> OTHER</option>
                  </select>
                </div>
              </div>
              <div class="col-md-3">
                <div class="form-group">
                  <label>User</label>
                  <select class="form-control" name="user" id="user">
                    <option value=""> --- Select ---</option>
                    <?php foreach ($user as $key) : ?>
                      <option value="<?= $key->id ?>"><?= $key->username ?></option>
                    <?php endforeach; ?>
                  </select>
                </div>
              </div>
              <div class="col-md-2">
                <div class="form-group pt-4 mt-2">
                  <label></label>
                  <button class="btn btn-outline-primary" id="btn-filter"> <i class="fas fa-sync"></i> Proscess </button>

                </div>
              </div>
            </div><br />
            <div class="">
              <table class="table table-striped" id="table" style="width: 100%;">
                <thead>
                  <tr>
                    <th class="text-center" width="1px">
                      No
                    </th>
                    <th>Event Time</th>
                    <th>User</th>
                    <th>IP Address</th>
                    <th>Event Modul</th>
                    <th>Event Type</th>
                    <th>Record ID</th>
                    <th>Event Notes</th>
                  </tr>
                </thead>

              </table>
            </div>
          </div>

        </div>
      </div>
    </div>
</section>


<script src="<?php echo base_url(); ?>assets/modules/jquery.min.js"></script>
<script>
  var base_url = "<?= base_url() ?>";
  $('#nav-user-activity').addClass('active');

  $("input").change(function() {
    $(this).removeClass('is-invalid');
    $(this).next().empty();
  });

  $(document).ready(function() {

    var daterange = $('#daterange').val();
    var event_type = $('#event_type').val();
    var user = $('#user').val();

    var table = $('#table').DataTable({
      "deferRender": true,
      "scrollCollapse": true,
      "scrollX": true,
      "processing": true,
      "serverSide": true,
      "order": false,
      "ordering": false,
      "ajax": {
        url: "<?php echo site_url('user_activity/ajax_list') ?>", // json user_activity
        type: "POST",
        data: function(data) {
          data.daterange = $('#daterange').val();
          data.event_type = $('#event_type').val();
          data.user = $('#event_type').val();
        }
      },
      "columnDefs": [{
        "orderable": false
      }],
    });


    $('#btn-filter').click(function() {
      table.ajax.reload();
    });



  });
</script>