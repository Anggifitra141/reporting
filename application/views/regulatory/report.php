<section class="section">
  <div class="section-header">
    <h1>Report</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Manage Report</h2>

    <div class="row">
      <div class="col-12">
        <div class="form-group">

        </div>
        <div class="card">
          <div class="card-body">
            <div class="row">
              <div class="col-md-4">
                <div class="form-group">
                  <label> Select Report </label>
                  <select class="form-control">
                    <option value="">--- Select ---</option>
                    <option value="">Laporan G0001</option>
                    <option value="">Laporan G0002</option>
                    <option value="">Laporan G0003</option>
                  </select>
                </div>
              </div>
              <div class="col-md-4">
                <div class="form-group">
                  <label>Start time</label>
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <div class="input-group-text">
                        <i class="fas fa-calendar"></i>
                      </div>
                    </div>
                    <input type="text" class="form-control">
                  </div>
                </div>
              </div>
              <div class="col-md-4">
                <div class="form-group">
                  <label>End time</label>
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <div class="input-group-text">
                        <i class="fas fa-calendar"></i>
                      </div>
                    </div>
                    <input type="text" class="form-control">
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-4"></div>
              <div class="col-md-5">
                <button class="btn btn-icon btn-outline-warning m-2"><i class="fas fa-eye"></i> View </button>
                <button class="btn btn-icon btn-outline-success m-2"><i class="fas fa-file-excel"></i> Excel </button>
                <button class="btn btn-icon btn-outline-success m-2"><i class="fas fa-file-csv"></i> Csv </button> 
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>


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
      "serverSide": false,
      "order": [],
      "columnDefs": [{
        "orderable": false
      }],
    });

  });


</script>
