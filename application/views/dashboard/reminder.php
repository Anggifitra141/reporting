<section class="section">
  <div class="section-header">
    <h1>Report</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Report <?= $title ?></h2>

    <div class="row">
      <div class="col-12">
        <div class="form-group">
          <!-- <a href="#" onclick="add_campaign()" class="btn btn-icon icon-left btn-outline-primary"><i class="far fa-plus-square"></i> Add</a> -->
        </div>
        <div class="card">
          <div class="card-body">
            <div class="">
              <table class="table table-striped" id="table" style="width: 100%;">
                <thead>
                  <tr>
                    <th>Date</th>
                    <th>Name</th>
                    <th>Period</th>
                    <th>Regulator</th>
                    <th>Status</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($query as $row) { ?>
                    <tr>
                      <td><?php echo $row['date'] ?></td>
                      <td><?php echo $row['name'] ?></td>
                      <td><?php echo $row['period'] ?></td>
                      <td><?php echo $row['regulator'] ?></td>
                      <td><?php echo $row['status'] ?></td>
                      <!-- <?php if ($row['status_rep'] == "active") { ?>
                          <td>
                            <a href="<?php echo base_url('app/download_today/' . $row['link']); ?>" class="btn btn-xl btn-primary" title="Download"> <i class="fa fa-file"></i></a>
                            <a href="#" class="btn btn-xl btn-primary" title="List Report"> <i class="fa fa-pen"></i> </a>
                            <a target="_blank" class="btn btn-xl btn-primary" href="<?php echo base_url('report/' . $row['link']); ?>" title="Printed Report"><span class="fa fa-print"></span></a>
                          </td>
                        <?php } else if ($row['status_rep'] == "inactive") { ?>
                          <td>
                            <a href="#" class="btn btn-xl btn-danger" enable title="Download"> <i class="fa fa-file"></i></a>
                            <a href="#" class="btn btn-xl btn-danger" enable title="List Report"> <i class="fa fa-pen"></i> </a>
                            <a class="btn btn-xl btn-danger" href="" enable title="Printed Report"><span class="fa fa-print"></span></a>
                          </td>
                        <?php } ?> -->
                      <td>
                        <a href="<?php echo base_url('report/' . $row['link'] . '?type_report=' . $row['name'] . '&daterange=' . date('d-m-Y', strtotime($row['date'])) . ' - ' . date('d-m-Y', strtotime($row['date'])) . ''); ?>" class="btn btn-xl btn-success" title="Download"> <i class="fa fa-file-excel"></i></a>
                        <?php if ($row['name'] == "G001" || $row['name'] == "G002" || $row['name'] == "G003") { ?>
                          <a href="<?php echo base_url('report/' . str_replace('excel', 'txt', $row['link']) . '?type_report=' . $row['name'] . '&daterange=' . date('d-m-Y', strtotime($row['date'])) . ' - ' . date('d-m-Y', strtotime($row['date'])) . ''); ?>" class="btn btn-xl btn-primary" title="Download"> <i class="fa fa-file-alt"></i></a>
                          <a href="<?php echo site_url('report/ltdbb/' . $row['name']) ?>" class="btn btn-xl btn-primary" title="List Report"> <i class="fa fa-list"></i> </a>
                        <?php }else { ?>
                        <a href="<?php echo site_url('report/' . $row['name']) ?>" class="btn btn-xl btn-primary" title="List Report"> <i class="fa fa-list"></i> </a>
                        <?php  }?>
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
  <div class="modal fade" id="lap_G3" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h3 class="modal-title" id="myModalLabel">Pilih Bulan</h3>
        </div>
        <!--ADMIN-->
        <form class="form-horizontal" method="post" action="<?php echo base_url('report/cetakg3') ?>" target="_blank">
          <!--ADMIN-->
          <div class="modal-body">
            <div class="form-group">
              <label class="control-label col-xs-3">Bulan</label>
              <div class="col-xs-9">
                <select name="bln" class="selectpicker show-tick form-control" data-live-search="true" title="Pilih Bulan" data-width="80%" required />
                <?php foreach ($bulan as $row) { ?>
                  <option value="<?php echo $row['bulan'] ?>"><?php echo $row['bulan'] ?></option>
                <?php } ?>
                </select>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">Tutup</button>
            <button class="btn btn-info"><span class="fa fa-print"></span> Cetak</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</section>