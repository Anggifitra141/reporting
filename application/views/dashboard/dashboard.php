<section class="section">
  <div class="section-header">
    <h1>Dashboard</h1>
  </div>
  <div class="row">
    <div class="col-lg-3 col-md-6 col-sm-6 col-12">
      <div class="card card-statistic-1">
        <div class="card-icon bg-primary">
          <i class="far fa-user"></i>
        </div>
        <div class="card-wrap">
          <div class="card-header">
            <h4>Total Campaign</h4>
          </div>
          <div class="card-body">
            <?= $campaign ?>
          </div>
        </div>
      </div>
    </div>
    <div class="col-lg-3 col-md-6 col-sm-6 col-12">
    <a href="<?= base_url('app/unprocessed') ?>">
      <div class="card card-statistic-1">
        <div class="card-icon bg-danger">
          <i class="far fa-newspaper"></i>
        </div>
        <div class="card-wrap">
          <div class="card-header">
            <h4>Unprocess</h4>
          </div>
          <div class="card-body">
            <?= $totalunprocessed ?>
          </div>
        </div>
      </div>
      </a>
    </div>
    <div class="col-lg-3 col-md-6 col-sm-6 col-12">
      <a href="<?= base_url('app/next') ?>">
        <div class="card card-statistic-1">
          <div class="card-icon bg-warning">
            <i class="far fa-file"></i>
          </div>
          <div class="card-wrap">
            <div class="card-header">
              <h4>Next</h4>
            </div>
            <div class="card-body">
              <?= $totalnext ?>
            </div>
          </div>
        </div>
      </a>
    </div>
    <div class="col-lg-3 col-md-6 col-sm-6 col-12">
    <a href="<?= base_url('app/month') ?>">
      <div class="card card-statistic-1">
        <div class="card-icon bg-success">
          <i class="fas fa-circle"></i>
        </div>
        <div class="card-wrap">
          <div class="card-header">
            <h4>This Month</h4>
          </div>
          <div class="card-body">
            <?= $totalmonth ?>
          </div>
        </div>
      </div>
    </a>
    </div>
  </div>
  <div class="row">
    <div class="col-lg-8 col-md-12 col-12 col-sm-12">
      <div class="card">
        <div class="card-header">
          <h4>Calendar </h4>
        </div>
        <div class="card-body">
          <div class="fc-overflow">                            
            <div id="myEvent"></div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-lg-4 col-md-12 col-12 col-sm-12">
      <div class="card">
        <div class="card-header">
          <h4>Recent Activities</h4>
        </div>
        <div class="card-body">
          <ul class="list-unstyled list-unstyled-border">
          <?php foreach ($activity as $row) : ?>
            
            <?php $avatar = $row['avatar'] ? $row['avatar'] : 'avatar-1.png'; ?>
            <li class="media">
              <img class="mr-3 rounded-circle" width="50" src="<?= base_url('assets/img/avatar/') . $avatar ?>" alt="avatar">
              <div class="media-body">
                <div class="float-right text-primary"><?= $this->lib->waktu_lalu($row['datestamp']) ?></div>
                <div class="media-title"><?= $row['username'] ?></div>
                <span class="text-small text-muted"><?= $row['actlog'] ?></span>
              </div>
            </li>
          <?php endforeach; ?>
            <!-- <li class="media">
              <img class="mr-3 rounded-circle" width="50" src="assets/img/avatar/avatar-2.png" alt="avatar">
              <div class="media-body">
                <div class="float-right">12m</div>
                <div class="media-title">Ujang Maman</div>
                <span class="text-small text-muted">Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
                  scelerisque ante sollicitudin.</span>
              </div>
            </li>
            <li class="media">
              <img class="mr-3 rounded-circle" width="50" src="assets/img/avatar/avatar-3.png" alt="avatar">
              <div class="media-body">
                <div class="float-right">17m</div>
                <div class="media-title">Rizal Fakhri</div>
                <span class="text-small text-muted">Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
                  scelerisque ante sollicitudin.</span>
              </div>
            </li>
            <li class="media">
              <img class="mr-3 rounded-circle" width="50" src="assets/img/avatar/avatar-4.png" alt="avatar">
              <div class="media-body">
                <div class="float-right">21m</div>
                <div class="media-title">Alfa Zulkarnain</div>
                <span class="text-small text-muted">Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
                  scelerisque ante sollicitudin.</span>
              </div>
            </li> -->
          </ul>
          <div class="text-center pt-1 pb-1">
            <a href="#" class="btn btn-primary btn-lg btn-round">
              View All
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>


</section>

<script src="<?php echo base_url(); ?>assets/modules/jquery.min.js"></script>

<script>
  $('li#nav-dashboard').addClass('active');
  $(document).ready(function() {

    // $("#myEvent").fullCalendar({
    //   height: 'auto',
    //   header: {
    //     left: 'prev,next today',
    //     center: 'title',
    //     right: 'month,agendaWeek,agendaDay,listWeek'
    //   },
    //   editable: true

    // });
    
    var drag =  function() {
			$('.calendar-event').each(function() {

			// store data so the calendar knows to render an event upon drop
			$(this).data('event', {
				title: $.trim($(this).find('p').text()), // use the element's text as the event title
				stick: true // maintain when user navigates (see docs on the renderEvent method)
			});

			// make the event draggable using jQuery UI
			$(this).draggable({
				zIndex: 1111999,
				revert: true,      // will cause the event to go back to its
				revertDuration: 0  //  original position after the drag
			});
		});
		};
		
		var removeEvent =  function() {
			$(document).on('click','.remove-calendar-event',function(e) {
				$(this).closest('.calendar-event').fadeOut();
			return false;
		});
		};
		$(document).on('click','#add_event',function(e) {
			$('<div class="calendar-event alert alert-success alert-dismissible fade show"><p>' + $('#inputEvent').val() + '</p><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>').insertAfter(".calendar-event:last-child");
			$(this).parents('.modal').find('.close').trigger('click');
			return false;
		});
	  
		
		
		drag();
		removeEvent();
    	
		var events = <?php echo json_encode($calender) ?>;
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth();
		var year = date.getFullYear();
  

    $('#myEvent').fullCalendar({
      // themeSystem: 'bootstrap3',
      customButtons: {
        calendarSidebar: {
          text: 'icon',
        }
      },
      height: 'auto',
      header: {
      left: 'calendarSidebar ,today',
      center: 'prev,title,next',
      right: 'month,agendaWeek,agendaDay,listMonth'
      },
      droppable: false,//true,	
      editable: false,//true,
      // height: 'parent',
      eventLimit: true, // allow "more" link when too many events
      windowResizeDelay:500,
      events: events,
        drop: function() {
          if($("#remove_event").is(':checked'))
            $(this).remove();
        }
    });

  });

</script>