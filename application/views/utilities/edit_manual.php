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
                    <label for="lastName">Negara Asal Pengiriman</label>
                    <input class="form-control" name="sender_country" placeholder="" value="<?= $source->sender_country ?>" type="text">
                    <span class="text-danger"></span>
                  </div>
                  <div class="form-group">
                    <label for="">Kota/Kabupaten Asal Pengiriman</label>
                    <input type="text" name="sender_city" class="form-control" value="<?= $source->sender_city ?>" >
                    <span class="text-danger"></span>
                  </div>
                  <div class="form-group">
                    <label for="firstName">Nama Pengirim</label>
                    <input class="form-control" name="sender_name" placeholder="" value="<?php echo $source->sender_name ?>" type="text">
                  </div>
                  <div class="form-group">
                    <label for="firstName">Telepon Pengirim</label>
                    <input class="form-control" name="sender_phone" placeholder="" value="<?php echo $source->sender_phone ?>" type="text">
                    <span class="text-danger"></span>
                  </div>
                  <div class="form-group">
                    <label for="firstName">Nominal</label>
                    <input class="form-control" name="amount" placeholder="" value="<?php echo $this->lib->rupiah($source->amount) ?>" type="text" readonly>
                    <span class="text-danger"></span>
                  </div>
											          
                </div>
                <div class="col-6">
                  <div class="form-group">
                    <label for="lastName">Negara Penerima</label>
                    <input class="form-control" name="recept_country" placeholder="" value="<?php echo $source->recept_country ?>" type="text">
                    <span class="text-danger"></span>
                  </div>
                  <div class="form-group">
                    <label for="firstName">Kota/Kabupaten Asal Pengiriman</label>
                    <input class="form-control" name="recept_city" placeholder="" value="<?php echo $source->recept_city ?>" type="text">
                    <span class="text-danger"></span>
                  </div>
                  <div class="form-group">
                    <label for="lastName">Nama Penerima</label>
                    <input class="form-control" name="recept_name" placeholder="" value="<?php echo $source->recept_name ?>" type="text">
                  </div>
                  <div class="form-group">
                    <label for="lastName">Telepon Penerima</label>
                    <input class="form-control" name="recept_phone" placeholder="" value="<?php echo $source->recept_phone ?>" type="text">
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
                  <button type="submit" name="rollback" value="Y" class="btn btn-primary mr-2 float-right"><i class="fas fa-redo-alt"></i> Rollback Data</button> &nbsp;
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
