<section class="section">
  <div class="section-header">
    <h1>Upload Source</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Upload Source</h2>
    <p class="section-lead">
        For the sample file upload, click the button download
    </p>

    <div class="row">
      <div class="col-12">
        <div class="card">
          <div class="card-header">
            <h4>Form Upload</h4>
            <div class="card-header-action">
            <button class="btn btn-lg btn-outline-info" onclick="download_example('sample-xlsx.xlsx')"> <i class="fas fa-download"></i> Sample .xlsx </button>
            <button class="btn btn-lg btn-outline-info" onclick="download_example('sample-xls.xls')"> <i class="fas fa-download"></i> Sample .xls </button>
            <button class="btn btn-lg btn-outline-info" onclick="download_example('sample-csv.csv')"> <i class="fas fa-download"></i> Sample .csv </button>
            </div>
            
          </div>
          <div class="card-body">
            <form action="" id="form_import" enctype="multipart/form-data" >
              <div class="col-md-12">
              <div class="form-group">
                <select name="campaign" id="campaign" class="form-control select2">
                  <option value="">-- Select Campaign --</option>
                  <?php foreach( $campaign as $key ) : ?>
                    <option value="<?= $key->campaign ?>"><?= $key->campaign ?></option>
                  <?php endforeach; ?>
                </select>
                <span class="text-danger"></span>
                </div>
              </div>
              <div class="col-md-12">
                <input type="file" class="dropify" name="file_import" />
              </div>
              <br>
              <div class="text-center">
                <button type="submit" class="btn btn-icon icon-left btn-outline-info" id="btnSaveImport" onClick="save_import()"> <i class="fas fa-upload"></i> Upload </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>


<script>

var base_url = "<?= base_url() ?>";

function save_import()
{
  $('#btnSaveImport').html('<i class="fa fa-spinner fa-spin"></i> saving...');
  $('#btnSaveImport').attr('disabled',true);
  var formData = new FormData($('#form_import')[0]);
  if($('[name="campaign"]').val() && $('[name="file_import"]').val()){
    loading();
  }
  $.ajax({
    url : base_url+`source/import_source`,
    type: "POST",
    data: formData,
    contentType: false,
    processData: false,
    dataType: "JSON",
    success: function(data){
      if(data.status){
        // notifikasi('success', data.message);
        $('.dropify-clear').click();
        swal({
          title: 'Success',
          text: data.message,
          icon: 'warning',
          icon: 'success',
        });
      }else{
        for (var i = 0; i < data.inputerror.length; i++) {
            $('[name="'+data.inputerror[i]+'"]').parent().addClass('has-error'); 
            $('[name="'+data.inputerror[i]+'"]').next().text(data.error_string[i]);
            }
      }
      $('#btnSaveImport').html('<i class="fas fa-upload"></i> Upload');
      $('#btnSaveImport').attr('disabled',false);
    }
  });
}

function download_example(file)
{
  fetch(base_url + 'assets/template-excel/' + file)
  .then(resp => resp.blob())
  .then(blob => {
    const url = window.URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.style.display = 'none';
    a.href = url;
    // the filename you want
    a.download = file;
    document.body.appendChild(a);
    a.click();
    window.URL.revokeObjectURL(url);
    alert('your file has downloaded!'); // or you know, something with better UX...
  })
  .catch(() => alert('oh no!'));
}
function loading()
{
  swal({
          title:"Please Wait.", 
          text:"Loading...",
          icon: base_url + 'assets/img/loading.gif',
          buttons: false,      
          // closeOnClickOutside: false,
          // timer: 3000,
          //icon: "success"
      })
}
</script>
