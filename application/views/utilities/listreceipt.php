<section class="section">
  <div class="section-header">
    <h1>List Receipt</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Manage List Receipt</h2>

    <div class="row">
      <div class="col-12">
        <div class="card">
          <div class="card-header">
            <b>List Receipt</b>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="table" >
                <thead>
                  <tr>
                    <th>List Receipt</th>
										<th width="125px">Action</th>
                  </tr>
                </thead>
                <tbody>
									<?php foreach ($receptcountry as $row) : $city = str_replace(" ", "_",$row['recept_city']); ?>
										<tr>
                      <td width="100%"><?php echo $row['recept_city'] ?></td>
											<td>
                        <a href="javascript:void(0)" onClick="modal_list('<?= $row['recept_city']."','".$row['recept_country'] ?>')"  class="btn btn-success btn-xs" title="Edit Data"> <i class="fas fa-pen"></i></a>
                      </td>
                    </tr>
									<?php endforeach; ?>
									</tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<div class="modal fade" tabindex="-1" role="dialog" id="modal_list">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header  bg-primary text-white">
        <b class="modal-title">Sender City </b>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form class="form-horizontal" method="POST" id="form" action="<?php echo base_url();?>utilities/urcity" method="POST" >
      <div class="modal-body">
        <div class="alert alert-info">
          <i class="fas fa-info-circle"></i> Verify manual data on your system
        </div>
        
          <div class="form-body">
            <input type="hidden" name="contry" value="">
						<input type="hidden" name="id" value="">
            <div class="form-group">
              <label>Sender Before</label>
              <input type="text" class="form-control" name="senderbefore" >
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label for="">Sender After</label>
              <select class="form-control select2" name="name">
                <option value="">Choice City</option>
                <?php foreach($recept as $key) :  ?>
                  <option value="<?= $key->bi_code .' - '. $key->bi_city ?>"><?= $key->bi_code .' - '. $key->bi_city ?></option>
                <?php endforeach; ?>
              
              </select>
            </div>
          </div>
        
      </div>
      <div class="modal-footer bg-whitesmoke br">
        <button type="button" class="btn btn-secondary float-left" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-outline-primary float-right">Save</button>
      </div>
      </form>
    </div>
  </div>
</div>

<script src="<?php echo base_url(); ?>assets/modules/jquery.min.js"></script>
<?php if($this->session->flashdata('msg')) : ?>
  <script>
    $(document).ready(function(){
      swal({
      title: 'Success',
      text: 'Updated Done' ,
      icon: 'warning',
      icon: 'success',
    });
    })
  </script>
<?php endif; ?>
<script>
  $('#nav-utilities-source').addClass('dropdown active');
  $('#nav-role-clean').addClass('active');
   $(document).ready(function() {
    var table = $('#table').DataTable({
        "deferRender": true,
        "scrollCollapse": true,
        "scrollX": true,
        "processing": true,
        
      });
   })

   function modal_list(recept_city, recept_country) {
      save_method = 'update';
      $('#form')[0].reset();
      $('#modal_list').modal('show');
      $('[name="id"]').val(recept_city);
      $('[name="senderbefore"]').val(recept_city);
      $('[name="contry"]').val(recept_country);
    }
</script>