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
                    <a href="<?php echo base_url('utilities/sendercountry/'.$sender); ?>" class="btn btn-success btn-xs" data-toggle="tooltip" data-original-title="Edit Sender"> <i class="fa fa-pen"></i> </a>
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
                    <a href="<?php echo base_url('utilities/listrcountry/'.$receipt); ?>" class="btn btn-info btn-xs" data-toggle="tooltip" data-original-title="See Receipt"> <i class="fa fa-eye"></i> </a>
                    <a href="<?php echo base_url('utilities/receiptcountry/'.$receipt); ?>" class="btn btn-success btn-xs" data-toggle="tooltip" data-original-title="Edit Receipt"> <i class="fa fa-pen"></i> </a>
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