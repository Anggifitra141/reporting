<section class="section">
  <div class="section-header">
    <h1>Default Manual</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Default Manual</h2>
    <p class="section-lead">
      Verify manual data on your system
    </p>

    <div class="row">
      <div class="col-12">
        <div class="card">
          <div class="card-header">
            <h4>Source Data</h4>
          </div>
          <div class="card-body">
            <form action="<?= base_url('utilities/udata') ?>" id="form_import" enctype="multipart/form-data" method="POST">
            <input type="hidden" name="id" value="<?= $source->id ?>"> 
              <div class="row">
                <div class="col-6">
                  <div class="form-group">
                    <label for="lastName">Sender Country</label>
                    <input class="form-control" name="sendercountry" placeholder="" value="<?= $source->sendercountry ?>" type="text">
                    <span class="text-danger"></span>
                  </div>
                  <div class="form-group">
                    <label for="">Sender City</label>
                    <input type="text" name="sendercity" class="form-control" value="<?= $source->sendercity ?>" >
                    <span class="text-danger"></span>
                  </div>
                  <div class="form-group">
                    <label for="firstName">Sendername</label>
                    <input class="form-control" name="sendername" placeholder="" value="<?php echo $source->sendername ?>" type="text">
                  </div>
                  <div class="form-group">
                    <label for="firstName">Sender Phone</label>
                    <input class="form-control" name="senderphone" placeholder="" value="<?php echo $source->senderphone ?>" type="text">
                    <span class="text-danger"></span>
                  </div>
                  <div class="form-group">
                    <label for="firstName">Nominal</label>
                    <input class="form-control" name="nominal" placeholder="" value="<?php echo $this->lib->rupiah($source->nominal) ?>" type="text" readonly>
                    <span class="text-danger"></span>
                  </div>
											          
                </div>
                <div class="col-6">
                  <div class="form-group">
                    <label for="lastName">Receipt Country</label>
                    <input class="form-control" name="receiptcountry" placeholder="" value="<?php echo $source->receiptcountry ?>" type="text">
                    <span class="text-danger"></span>
                  </div>
                  <div class="form-group">
                    <label for="firstName">Receipt City</label>
                    <input class="form-control" name="receiptcity" placeholder="" value="<?php echo $source->receiptcity ?>" type="text">
                    <span class="text-danger"></span>
                  </div>
                  <div class="form-group">
                    <label for="lastName">Receiptname</label>
                    <input class="form-control" name="receiptname" placeholder="" value="<?php echo $source->receiptname ?>" type="text">
                  </div>
                  <div class="form-group">
                    <label for="lastName">Receipt Phone</label>
                    <input class="form-control" name="receiptphone" placeholder="" value="<?php echo $source->receiptphone ?>" type="text">
                    <span class="text-danger"></span>
                  </div>
                  <div class="form-group">
                    <label for="lastName">Status</label>
                    <select name="status" class="form-control" required>
                      <option value="verified" <?= ($source->status == 'verified') ? 'selected' : '' ?>>Verified</option>
                      <option value="unverified" <?= ($source->status == 'unverified') ? 'selected' : '' ?>>Unverified</option>
                    </select>
                    <span class="text-danger"></span>
                  </div>
                </div>
                <div class="col-md-12 form-group">
                  <label for="lastName">Description</label>
                  <textarea class="form-control" name="description" type="text" readonly><?php echo $source->description ?></textarea>
                  <span class="text-danger"></span>
                </div>
                <div class="col-md-12 mt-3">
                  <a href="<?= base_url('utilities/manual') ?>" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Back</a>
                  <button type="submit" class="btn btn-primary float-right"><i class="fas fa-save"></i> Save</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
