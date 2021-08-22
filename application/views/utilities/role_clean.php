<section class="section">
  <div class="section-header">
    <h1>Roles Clean</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Manage Roles Clean</h2>

    <div class="row">
      <div class="col-6">
        <div class="card">
          <div class="card-header">
            <b>Sender Country</b>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="table" >
                <thead>
                  <tr>
                    <th>Action</th>
                    <th width="70%">List</th>                  
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($sender_country as $row) { 
                    $sender = str_replace(" ", "_",$row['sender_country']);
                  ?>
                  <tr>                
                    <td >
                      <a href="<?php echo base_url('utilities/listscountry/'.$sender); ?>" class="btn btn-success btn-icon btn-sm" data-toggle="tooltip" data-original-title="See Sender"> <i class="fas fa-eye"></i> </a>
                      <a href="javascript:void(0)" onClick="sender_country('<?= $row['sender_country'] ?>')" class="btn btn-primary btn-sm" data-toggle="tooltip" data-original-title="Edit Sender"> <i class="far fa-edit"></i> </a>
                    </td>
                    <td><?php echo $row['sender_country'] ?></td>
                  </tr>
                  <?php } ?>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
      <div class="col-6">
        <div class="card">
          <div class="card-header">
            <b>Receipt Country</b>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="table" >
                <thead>
                  <tr>
                    <th>Action</th>
                    <th width="70%">List</th>                   
                  </tr>
                </thead>
                <tbody>
                <?php foreach ($recept_country as $row) { 
                  $receipt = str_replace(" ", "_",$row['recept_country']);
                ?>
                <tr>                 
                  <td>
                    <a href="<?php echo base_url('utilities/listreceipt/'.$receipt); ?>" class="btn btn-success btn-sm" data-toggle="tooltip" data-original-title="See Receipt"> <i class="fas fa-eye"></i> </a>
                    <a href="javascript:void(0)" onClick="recept_country('<?= $row['recept_country'] ?>')" class="btn btn-primary btn-sm" data-toggle="tooltip" data-original-title="Edit Receipt"> <i class="far fa-edit"></i> </a>
                  </td>
                  <td><?php echo $row['recept_country'] ?></td>
                </tr>
                <?php } ?>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
      
    </div>
  </div>
</section>

<div class="modal fade" tabindex="-1" role="dialog" id="modal_sender_country">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header  bg-primary text-white">
        <b class="modal-title">Sender Country </b>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form class="form-horizontal" method="POST" id="form" action="<?php echo base_url();?>utilities/uscountry" method="POST" >
      <div class="modal-body">
        <div class="alert alert-info">
          <i class="fas fa-info-circle"></i> Verify manual data on your system
        </div>
        
          <div class="form-body">
						<input type="hidden" name="id" value="">
            <div class="form-group">
              <label>Sender Before</label>
              <input type="text" class="form-control" name="senderbefore" readonly >
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label for="">Sender After</label>
              <select class="form-control" name="name">
                <option value="">Choice City</option>
                <?php foreach($country as $key) :  ?>
                  <option value="<?= $key->name ?>"><?= $key->name ?></option>
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
<div class="modal fade" tabindex="-1" role="dialog" id="modal_receipt_country">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header  bg-primary text-white">
        <b class="modal-title">Receipt Country </b>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form class="form-horizontal" method="POST" id="form" action="<?php echo base_url();?>utilities/urcountry" method="POST" >
      <div class="modal-body">
        <div class="alert alert-info">
          <i class="fas fa-info-circle"></i> Verify manual data on your system
        </div>
        
          <div class="form-body">
						<input type="hidden" name="id" value="">
            <div class="form-group">
              <label>Receipt Before</label>
              <input type="text" class="form-control" name="receiptbefore" readonly >
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label for="">Receipt After</label>
              <select class="form-control" name="name">
                <option value="">Choice Country</option>
                <?php foreach($country as $key) :  ?>
                  <option value="<?= $key->name ?>"><?= $key->name ?></option>
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


<script>
  $('#nav-utilities-source').addClass('dropdown active');
  $('#nav-role-clean').addClass('active');
  function sender_country(sender_country)
  {
   $('#modal_sender_country').modal('show');
   $('[name="senderbefore"]').val(sender_country);
   $('[name="id"]').val(sender_country);
  }
  function recept_country(recept_country)
  {
    $('#modal_receipt_country').modal('show');
    $('[name="receiptbefore"]').val(recept_country);
    $('[name="id"]').val(recept_country);
  }
</script>