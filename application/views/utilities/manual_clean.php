<style>
  .modal-title{
    margin-top: -10px;
  }
  
</style>

<section class="section">
  <div class="section-header">
    <h1>Manual Clean</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Manage Data Clean</h2>

    <div class="row">       
      <div class="col-12">
        <div class="form-group">

        </div>
        <div class="card">
          <div class="card-header">
            <div class="col-md-5">
              <div class="form-group">
                <label for="">Campaign</label>
                <select class="form-control select2" name="campaign_id">
                  <option value="">--- All Campaign ---</option>
                  <?php foreach($campaign as $key): ?>
                  <option value="<?= $key->campaign ?>"><?= $key->campaign ?></option>
                  <?php endforeach; ?>
                </select>
              </div>
            </div>
            <div class="col-md-5">
              <div class="form-group">
                <label>Date Upload</label>
                <input type="text" class="form-control daterange-picker" name="daterange" style="height: 38px;font-size: 13px;border-radius: 4px">
              </div>
            </div>
            <div class="col-md-2">
              <button class="btn btn-flat btn-danger btn-block" style="margin-top:27px;" id="btn-filter"  ><i class="fas fa-filter"></i> Filter </button>
            </div>
          </div>
          <div class="card-body">
            <div class="row">
              <div class="col-md-6 mb-3">
                <a href="" class="btn btn-warning"><i class="far fa-edit"></i> Edit Selected</a>
                <a href="javascript:void(0)" onclick="delete_selected()" class="btn btn-danger"><i class="fas fa-times"></i> Delete Selected</a>
              </div>
            </div>
            <!-- <div class="table-responsive"> -->
              
              <table class="table table-bordered table-striped" id="table" >
                <thead>
                  <tr>
                    <th>
                    <input type="checkbox" id="check-all" name="check_all">
                    </th>
                    <th width="8%">Action</th>
                    <th>Trxdate</th>
                    <th>Campaign</th>
                    <th>Sender Country</th>
                    <th>Sender City</th>
                    <th>Receipt Country</th>
                    <th>Receipt City</th>
                    <th>Sender Name</th>
                    <th>Receipt Name</th>
                    <th>Nominal</th>
                  </tr>
                </thead>

              </table>
            <!-- </div> -->
          </div>
        </div>
      </div>
    </div>
  </div>
</section>


<script src="<?php echo base_url(); ?>assets/modules/jquery.min.js"></script>
<script>
  var table;

  $("input").change(function(){
      $(this).removeClass('is-invalid');
      $(this).next().empty();
  });
  $(document).ready(function() {

    table = $('#table').DataTable({
      "deferRender": true,
      "scrollCollapse": true,
      "scrollX": true,
      "processing": true,
      "serverSide": true,
      "order": [],
      "ajax": {
        url: "<?php echo site_url('utilities/ajax_manual_clean')?>", // json datasource
        type: "POST",
        data : function(data){
          data.campaign = $('[name="campaign_id"]').val(),
          data.daterange = $('[name="daterange"]').val()
        },
      },
      "columnDefs": [{
        "orderable": false,
        "targets": 0
      }]
    });
     //check all
     $("#check-all").click(function () {
        $(".data-check").prop('checked', $(this).prop('checked'));
    });

  });
  function reload_table()
  {
    table.ajax.reload(null,false);
  }
  $('#btn-filter').click(function(){
    reload_table();
  })
  function delete_selected()
  {
    var list_id = [];
    $(".data-check:checked").each(function() {
      list_id.push(this.value);
    });
    if(list_id.length > 0)
    {
      if(confirm('Are you sure delete this '+list_id.length+' data?'))
      {
        $.ajax({
          type: "POST",
          data: {id:list_id},
          url: "<?php echo site_url('utilities/ajax_bulk_delete_manual')?>",
          dataType: "JSON",
          success: function(data)
          {
            if(data.status)
            {
              reload_table();
            }
            else
            {
              alert('Failed.');
            }
                
          },
          error: function (jqXHR, textStatus, errorThrown)
          {
            alert('Error deleting data');
          }
        });
      }
    }
    else
    {
      alert('no data selected');
    }
  }

</script>
