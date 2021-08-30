<section class="section">
  <div class="section-header">
    <h1>List Sender Country</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Manage List Sender Country</h2>

    <div class="row">
      <div class="col-12">
        <div class="card">
          <div class="card-body">
            <div class="">
              <table class="table table-striped" id="table" style="width:100%">
                <thead>
                  <tr>
                    <th>No</th>
                    <th>Action</th>
                    <th>List Sender</th>										
                  </tr>
                </thead>
                <tbody>
									<?php 
                    $no = 1;
                    foreach ($sender_country as $row) : $city = str_replace(" ", "_",$row['sender_city']); ?>
										<tr>
                      <td> <?php echo $no++; ?> </td>
											<td>
                        <a href="javascript:void(0)" onClick="modal_list('<?= $row['sender_country']."','".$row['sender_city'] ?>')"  class="btn btn-primary btn-sm" title="Edit Data"> <i class="far fa-edit"></i></a>
                      </td>
                      <td width="100%"><?php echo $row['sender_city'] ?></td>
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

<div class="modal fade" role="dialog" id="modal_list">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header  bg-primary text-white">
        <b class="modal-title">Sender City </b>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form class="form-horizontal" method="POST" id="form" action="<?php echo base_url();?>utilities/uscity" method="POST" >
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
              <label>Sender After</label>
              <select class="form-control select2" name="sender">
                <option value="">Choice City</option>
                <?php foreach($city_result as $key) :  ?>
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

   function modal_list(sender_country, sender_city) {
      save_method = 'update';
      $('#form')[0].reset();
      $('#modal_list').modal('show');
      $('[name="id"]').val(sender_city);
      $('[name="senderbefore"]').val(sender_city);
      $('[name="contry"]').val(sender_country);
    }
</script>