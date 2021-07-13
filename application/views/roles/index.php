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
                    <th width="70%">List</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($sendercountry as $row) { 
                  $sender = str_replace(" ", "_",$row['sendercountry']);
                  ?>
                  <tr>
                    <td><?php echo $row['sendercountry'] ?></td>
                    <td >
                    <a href="<?php echo base_url('utilities/listscountry/'.$sender); ?>" class="btn btn-info btn-xs" data-toggle="tooltip" data-original-title="See Sender"> <i class="fa fa-eye"></i> </a>
                    <a href="javascript:void(0)" onClick="senderCountry('<?= $row['sendercountry'] ?>')" class="btn btn-success btn-xs" data-toggle="tooltip" data-original-title="Edit Sender"> <i class="fa fa-pen"></i> </a>
                    </td>
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
                    <th width="70%">List</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                <?php foreach ($receiptcountry as $row) { 
                $receipt = str_replace(" ", "_",$row['receiptcountry']);
                ?>
                <tr>
                  <td><?php echo $row['receiptcountry'] ?></td>
                  <td>
                    <a href="<?php echo base_url('utilities/listreceipt/'.$receipt); ?>" class="btn btn-info btn-xs" data-toggle="tooltip" data-original-title="See Receipt"> <i class="fa fa-eye"></i> </a>
                    <a href="javascript:void(0)" onClick="receiptCountry('<?= $row['receiptcountry'] ?>')" class="btn btn-success btn-xs" data-toggle="tooltip" data-original-title="Edit Receipt"> <i class="fa fa-pen"></i> </a>
                  </td>
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
          <i class="fa fa-info"></i> Verify manual data on your system
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
          <i class="fa fa-info"></i> Verify manual data on your system
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

  function senderCountry(sendercountry)
  {
   $('#modal_sender_country').modal('show');
   $('[name="senderbefore"]').val(sendercountry);
   $('[name="id"]').val(sendercountry);
  }
  function receiptCountry(receiptcountry)
  {
    $('#modal_receipt_country').modal('show');
    $('[name="receiptbefore"]').val(receiptcountry);
    $('[name="id"]').val(receiptcountry);
  }
</script>