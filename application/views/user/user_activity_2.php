<section class="section">
  <div class="section-header">
    <h1>User Activity</h1>
    <div class="section-header-breadcrumb">
      <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
      <div class="breadcrumb-item">Activities</div>
    </div>
  </div>
  <div class="section-body">
    <div class="row">
      <div class="col-md-2">
        <h2 class="section-title">User Activity</h2>
      </div>
      <div class="col-md-3">
        <div class="form-group">
          <label>Date Range</label>
          <div class="input-group">
            <div class="input-group-prepend">
              <div class="input-group-text">
                <i class="fas fa-calendar"></i>
              </div>
            </div>
            <input type="text" class="form-control daterange-picker" name="daterange" id="daterange">
          </div>
        </div>
      </div>

      <div class="col-md-3">
        <div class="form-group">
          <label>Type Log</label>
          <select class="form-control" name="event_type" id="event_type">
            <option value=""> --- Select ---</option>
            <option value="LOGIN"> LOGIN</option>
            <option value="LOGOUT"> LOGOUT</option>
            <option value="ADD"> ADD</option>
            <option value="UPDATE"> UPDATE</option>
            <option value="DELETE"> DELETE</option>
            <option value="DOWNLOAD"> DOWNLOAD</option>
            <option value="OTHER"> OTHER</option>
          </select>
        </div>
      </div>
      <div class="col-md-2">
        <div class="form-group">
          <label>User</label>
          <select class="form-control" name="user" id="user">
            <option value=""> --- Select ---</option>
            <?php foreach ($user as $key) : ?>
              <option value="<?= $key->id ?>"><?= $key->username ?></option>
            <?php endforeach; ?>
          </select>
        </div>
      </div>

      <div class="col-md-2">
        <div class="form-group pt-4 mt-2">
          <label></label>
          <button class="btn btn-outline-primary" id="btn-filter"> <i class="fas fa-sync"></i> Proscess </button>

        </div>
      </div>

    </div>
    <br /><br />
    <div class="row">
      <div class="col-12">
        <div class="activities">
          <div id="user-activity">
          </div>
        </div>
        <div>
          <button class=" btn btn-icon btn-outline-primary" id="view-more"> <i class="fas fa-history"></i> View more </button>
          <input type="hidden" name="limit" id="limit" value="3" />
          <input type="hidden" name="offset" id="offset" value="3" />
        </div>
      </div>
    </div>
  </div>
</section>

<script>
  $(document).ready(function() {

    $('#nav-user-activity').addClass('active');

    //Get ajax user log
    $.ajax({
      url: "<?php echo site_url('user_activity/ajax_list'); ?>",
      dataType: "json",
      type: "GET",
      async: false,
      success: function(data) {
        if (data.length > 0) {
          var str = "";
          $.each(data, function(index, val) {
            str += `
              <div class="activity">
                <div class="activity-icon bg-primary text-white shadow-primary">
                  <i class="fas fa-comment-alt"></i>
                </div>
                <div class="activity-detail">
                  <div class="mb-2">
                    <span class="text-job text-primary">${val.event_time}</span>
                    <span class="bullet"></span>
                    <a class="text-job" href="#">${val.event_type}</a>
                    <span class="bullet"></span>
                    <a class="text-job text-primary" href="#">${val.id_user}</a>
                  </div>
                  <p${val.event_notes}</p>
                </div>
              </div>
            `;
          })
          $('#user-activity').html(str);
        }
      },
      error(jqXHR, textStatus, errorThrown) {
        alert('Something wrong happened because: ' + errorThrown)
      }
    });

    $('#btn-filter').click(function() {
      var daterange = $('#daterange').val();
      var event_type = $('#event_type').val();
      var user = $('#user').val();
      $.ajax({
        url: "<?php echo site_url('user_activity/ajax_list'); ?>",
        dataType: "json",
        type: "post",
        async: false,
        data: {
          daterange: daterange,
          event_type: event_type,
          user: user,
          filter: 'Y'
        },
        success: function(data) {
          if (data.length > 0) {
            var str = "";
            $.each(data, function(index, val) {
              str += `
              <div class="activity">
                <div class="activity-icon bg-primary text-white shadow-primary">
                  <i class="fas fa-comment-alt"></i>
                </div>
                <div class="activity-detail">
                  <div class="mb-2">
                    <span class="text-job text-primary">${val.event_time}</span>
                    <span class="bullet"></span>
                    <a class="text-job" href="#">${val.event_type}</a>
                    <span class="bullet"></span>
                    <a class="text-job text-primary" href="#">${val.id_user}</a>
                  </div>
                  <p${val.event_notes}</p>
                </div>
              </div>
            `;
            })
            $('#user-activity').html(str);
          }
        },
        error(jqXHR, textStatus, errorThrown) {
          alert('Something wrong happened because: ' + errorThrown)
        }
      });
    })

    $('#view-more').click(function() {

      var offset = $('#offset').val();
      var limit = $('#limit').val();
      $.ajax({
        url: "<?php echo site_url('user_activity/view_more_ajax_list'); ?>",
        dataType: "json",
        type: "post",
        async: false,
        data: {
          offset: offset,
          limit: limit,
        },
        success: function(data) {
          if (data.query.length > 0) {
            var str = "";
            $.each(data.query, function(index, val) {
              str += `
              <div class="activity">
                <div class="activity-icon bg-primary text-white shadow-primary">
                  <i class="fas fa-comment-alt"></i>
                </div>
                <div class="activity-detail">
                  <div class="mb-2">
                    <span class="text-job text-primary">${val.event_time}</span>
                    <span class="bullet"></span>
                    <a class="text-job" href="#">${val.event_type}</a>
                    <span class="bullet"></span>
                    <a class="text-job text-primary" href="#">${val.id_user}</a>
                  </div>
                  <p${val.event_notes}</p>
                </div>
              </div>
            `;
            })
            $('#user-activity').append(str);
            $('#offset').val(data.offset);
            $('#limit').val(data.limit);
          }
        },
        error(jqXHR, textStatus, errorThrown) {
          alert('Something wrong happened because: ' + errorThrown)
        }
      });
    })

  });
</script>