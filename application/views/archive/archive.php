<style>
  .modal-title {
    margin-top: -10px;
  }
</style>

<section class="section">
  <div class="section-header">
    <h1>Archive</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Archive</h2>

    <div class="row">
      <div class="col-12">
        <div class="card">
          <div class="card-body">
            <div class="row">
              <div class="col-md-4">
                <h6>Please Select for the archive your data :</h6>
                <div class="col-md-3">
                  <div class="form-group">
                    <label for=""> <input type="checkbox" id="" name="" value=""> LTDBB</label><br />
                    <label for=""> <input type="checkbox" id="" name="" value=""> LTKL</label><br />
                    <label for=""> <input type="checkbox" id="" name="" value=""> QRIS</label></br>
                    <label for=""> <input type="checkbox" id="" name="" value=""> Dana Float</label></br>
                  </div>

                </div>
                <div class="col-md-12">
                  <div class="form-group">
                    <label for=""> <input type="checkbox" id="" name="" value=""> Payment Gateway</label></br>
                    <label for=""> <input type="checkbox" id="" name="" value=""> SIPESAT</label></br>
                    <label for=""> <input type="checkbox" id="" name="" value=""> LKPBU</label></br>
                    <label for=""> <input type="checkbox" id="" name="" value=""> Gangguan Sistem</label></br>
                  </div>
                </div>
              </div>



              <div class="col-md-2">
                <button class="btn btn-primary"><i class="fas fa-archive"></i> Archive</button>
              </div>
            </div>
            <br />
            <div class="">
              <table class="table table-striped" id="table" style="width: 100%;">
                <thead>
                  <tr>
                    <th class="text-center" width="1px">
                      No
                    </th>
                    <th>Last Backup</th>
                    <th>Event Modul</th>
                    <th>Event Type</th>
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