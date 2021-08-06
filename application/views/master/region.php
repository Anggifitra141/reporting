<style>
  .modal-title{
    margin-top: -10px;
  }
</style>

<section class="section">
  <div class="section-header">
    <h1>Region</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Master Region</h2>

    <div class="row">
      <div class="col-12">
        <div class="form-group">
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
                    <th>ltdb</th>
                    <th>Name</th>
                    <th>Alto</th>
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



<script src="<?php echo base_url(); ?>assets/modules/jquery.min.js"></script>
<script>
  
  $('#nav-master-data').addClass('dropdown active');
  $('#nav-region').addClass('active');
  $("input").change(function(){
      $(this).removeClass('is-invalid');
      $(this).next().empty();
  });
  $(document).ready(function() {

    var table = $('#table').DataTable({
        "deferRender": true,
        "scrollCollapse": false,
        "scrollX": false,
        "processing": true,
        "serverSide": true,
        "order": [],
        "ajax": {
          url: "<?php echo site_url('master/ajax_list_region')?>", // json datasource
          type: "POST"
        },
        "columnDefs": [{
          "orderable": false
        }],
      });

  });

</script>
