<style>
  .modal-title{
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



<script src="<?php echo base_url(); ?>assets/modules/jquery.min.js"></script>
<script>
  var table_query = "<?= $this->uri->segment(3) ?>";
  var table_query_split = table_query.split('_');
  $('#nav-master-data').addClass('dropdown active');
  $('#nav-'+ table_query_split[2]).addClass('active');
  $('#section-header').text(table_query_split[2].toUpperCase());
  $('#section-title').text('Master ' +table_query_split[2]);

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
          url: "<?php echo site_url('master/ajax_master_all')?>", // json datasource
          type: "POST",
          data : function(data){
          data.table = table_query
        },
        },
        "columnDefs": [{
          "orderable": false
        }],
      });

  });

</script>
