<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>Management Report</title>

  <!-- General CSS Files -->
  <link rel="stylesheet" href="<?php echo base_url(); ?>assets/modules/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="<?php echo base_url(); ?>assets/modules/fontawesome/css/all.min.css">

  <!-- CSS Libraries -->
  <link rel="stylesheet" href="<?php echo base_url(); ?>assets/modules/bootstrap-daterangepicker/daterangepicker.css">
  <link rel="stylesheet" href="<?php echo base_url(); ?>assets/modules/izitoast/css/iziToast.min.css">
  <link rel="stylesheet" href="<?php echo base_url(); ?>assets/modules/datatables/datatables.min.css">
  <link rel="stylesheet" href="<?php echo base_url(); ?>assets/modules/dropify/css/dropify.min.css">
  <link rel="stylesheet" href="<?php echo base_url(); ?>assets/modules/fullcalendar/fullcalendar.min.css">
  <link rel="stylesheet" href="<?php echo base_url(); ?>assets/modules/select2/dist/css/select2.min.css">
  <link rel="stylesheet" href="<?php echo base_url(); ?>assets/modules/bootstrap-daterangepicker/daterangepicker.css">
  <!-- Template CSS -->
  <link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/style.css">
  <link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/components.css">
  <!-- Start GA -->
  <script async src="https://www.googletagmanager.com/gtag/js?id=UA-94034622-3"></script>

  <script src="<?php echo base_url(); ?>assets/modules/jquery.min.js"></script>
  <script>var access = "<?= $this->session->userdata('access') ?>";var event = "<?php echo $this->session->userdata('action'); ?>";</script>
  
  <script>
    window.dataLayer = window.dataLayer || [];

    function gtag() {
      dataLayer.push(arguments);
    }
    gtag('js', new Date());

    gtag('config', 'UA-94034622-3');

    function convertToRupiah(angka) {
      var rupiah = '';
      var angkarev = angka.toString().split('').reverse().join('');
      for (var i = 0; i < angkarev.length; i++)
        if (i % 3 == 0) rupiah += angkarev.substr(i, 3) + '.';
      return 'Rp. ' + rupiah.split('', rupiah.length - 1).reverse().join('');
    }

    function convertToAngka(rupiah) {
      return parseInt(rupiah.replace(/,.*|[^0-9]/g, ''), 10);
    }
    function cek_privileges(action, session){
    if(action == 'add'){
      if(!session.match(/add/g)){
          iziToast.error({
            title: 'Error !',
            message: 'You have no right to this action.',
            position: 'bottomCenter'
          });
        exit();
      }
    }
    if(action == 'delete'){
      if(!session.match(/delete/g)){
          iziToast.error({
            title: 'Error !',
            message: 'You have no right to this action.',
            position: 'bottomCenter'
          });
        exit();
      }
    }
    if(action == 'update'){
      if(!session.match(/update/g)){
          iziToast.error({
            title: 'Error !',
            message: 'You have no right to this action.',
            position: 'bottomCenter'
          });
        exit();
      }
    }
  }
  </script>

  <style>
    .fc button.fc-state-active {
      background-color: #FF0000;
      color: #fff;
    }

    .select2-container--default .select2-selection--multiple .select2-selection__choice,
    .select2-container--default .select2-results__option[aria-selected=true],
    .select2-container--default .select2-results__option--highlighted[aria-selected] {
      background-color: #FC545C;
      color: white;
    }

    .nav-pills .nav-item .nav-link.active {
      box-shadow: 0 2px 6px #ffbaba;
      color: #fff;
      background-color: #ff0000;
    }

    .nav-pills .nav-item .nav-link {
      color: #ff0000;
      padding-left: 15px !important;
      padding-right: 15px !important;
    }
  </style>
  <!-- /END GA -->
</head>

<body>
  <div id="app">
    <div class="main-wrapper main-wrapper-1">
      <div class="navbar-bg"></div>
      <nav class="navbar navbar-expand-lg main-navbar">
        <form class="form-inline mr-auto">
          <ul class="navbar-nav mr-3">
            <li><a href="<?php echo base_url(); ?>#" data-toggle="sidebar" class="nav-link nav-link-lg"><i class="fas fa-bars"></i></a></li>
            <li><a href="<?php echo base_url(); ?>#" data-toggle="search" class="nav-link nav-link-lg d-sm-none"><i class="fas fa-search"></i></a></li>
          </ul>
          <div class="search-element">

          </div>
        </form>
        <ul class="navbar-nav navbar-right">
         
          <li class="dropdown"><a href="<?php echo base_url(); ?>#" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user">
              <img alt="image" src="<?php echo base_url(); ?>assets/img/avatar/avatar-1.png" class="rounded-circle mr-1">
              <div class="d-sm-none d-lg-inline-block"><?php echo $this->session->userdata('fullname'); ?></div>
            </a>
            <div class="dropdown-menu dropdown-menu-right">
              <div class="dropdown-title" style="font-size: 8px;">Logged in <?php $looged = $this->db->query("SELECT event_time as time FROM t4log_user WHERE id_user = '". $this->session->userdata('id')."' ORDER BY id DESC")->row()->time; echo $this->lib->waktu_lalu($looged) ?></div>
              <!-- <a href="<?php echo base_url(); ?>features-profile.html" class="dropdown-item has-icon">
                <i class="far fa-user"></i> Profile
              </a>
              <a href="<?php echo base_url(); ?>features-activities.html" class="dropdown-item has-icon">
                <i class="fas fa-bolt"></i> Activities
              </a>
              <a href="<?php echo base_url(); ?>features-settings.html" class="dropdown-item has-icon">
                <i class="fas fa-cog"></i> Settings
              </a> -->
              <div class="dropdown-divider"></div>
              <a href="<?php echo site_url('login/signout'); ?>" class="dropdown-item has-icon text-danger">
                <i class="fas fa-sign-out-alt"></i> Logout
              </a>
            </div>
          </li>
        </ul>
      </nav>
      <div class="main-sidebar sidebar-style-2">
        <aside id="sidebar-wrapper">
          <div class="sidebar-brand">

            <a href="<?php echo base_url(); ?>"><img src="<?php echo base_url('assets/img/finnet.png') ?>" style="height:80px; width:200px; margin-left:-22px;"></a><br />
          </div><br /><br />
          <div class="sidebar-brand sidebar-brand-sm">
            <a href="<?php echo base_url(); ?>index.html">St</a>
          </div>
          <ul class="sidebar-menu">
            <li class="menu-header">Management Report</li>
            <li id="nav-dashboard">
              <a href="<?php echo site_url('app'); ?>" class="nav-link"><i class="fas fa-home"></i><span>Dashboard</span></a>
            </li>
            <li class="dropdown" id="nav-data-source">
              <a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i class="fas fa-layer-group"></i> <span>Data Source</span></a>
              <ul class="dropdown-menu">
                <li id="nav-ltdbb-source" class="access_ltdbb"><a class="nav-link" href="<?php echo site_url('source/tltdbb_source'); ?>"><i class="fas fa-database"></i> Ltdbb</a></li>
                <li id="nav-ltkl-source" class="access_ltkl"><a class="nav-link" href="<?php echo site_url('source/ltkl'); ?>"><i class="fas fa-database"></i> LTKL</a></li>
                <li class="dropdown access_qris" id="nav-qris">
                  <a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i class="fas fa-database"></i>QRIS</a>
                  <ul class="dropdown-menu">
                    <li id="nav-source-qris-merchant"><a class="nav-link" href="<?php echo site_url('source/qris_merchant'); ?>"><i class="fas fa-circle"></i> QRIS Merchant</a></li>
                    <li id="nav-source-qris-trx"><a class="nav-link" href="<?php echo site_url('source/qris_trx'); ?>"><i class="fas fa-circle"></i> QRIS Transaksi</a></li>
                  </ul>
                </li>
                <li id="nav-dana-float-source" class="access_dana_float"><a class="nav-link" href="<?php echo site_url('source/dana_float'); ?>"><i class="fas fa-database"></i> Dana Float</a></li>
                <li id="nav-sipesat-source" class="access_sipesat"><a class="nav-link" href="<?php echo site_url('source/si_pesat'); ?>"><i class="fas fa-database"></i> Si Pesat</a></li>
                <li class="dropdown" id="nav-lkpbu-source" class="access_lkpbu">
                  <a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i class="fas fa-database"></i>LKPBU</a>
                  <ul class="dropdown-menu">
                    <li id="nav-lkpbu-source-302" class="access_lkpbu_302"><a class="nav-link" href="<?php echo site_url('source/lkpbu_source302'); ?>"><i class="fas fa-circle"></i> Form 302</a></li>
                  </ul>
                </li>
                <li class="access_gangguan_system" id="nav-sipesat-source"><a class="nav-link" href="<?php echo site_url('source/si_pesat'); ?>"><i class="fas fa-database"></i> Gangguan Sistem</a></li>
              </ul>
            </li>
            <style>
              .sidebar-style-2 .sidebar-menu ul.dropdown-menu li a {
                padding-left: 55px !important;
              }
            </style>
            <li class="dropdown" id="nav-data-clean">
              <a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i class="fas fa-layer-group"></i> <span>Data Clean</span></a>
              <ul class="dropdown-menu">
                <li class="dropdown access_ltdbb" id="nav-ltdbb-clean">
                  <a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i class="fas fa-database"></i>LTDBB</a>
                  <ul class="dropdown-menu">
                    <li id="nav-ltdbb-clean-G001"><a class="nav-link" href="<?php echo site_url('clean/tltdbb_clean/G001'); ?>"><i class="fas fa-circle"></i> G001</a></li>
                    <li id="nav-ltdbb-clean-G002"><a class="nav-link" href="<?php echo site_url('clean/tltdbb_clean/G002'); ?>"><i class="fas fa-circle"></i> G002</a></li>
                    <li id="nav-ltdbb-clean-G003"><a class="nav-link" href="<?php echo site_url('clean/tltdbb_clean/G003'); ?>"><i class="fas fa-circle"></i> G003</a></li>
                  </ul>
                </li>
                <li id="nav-ltkl-clean" class="access_ltkl"><a class="nav-link" href="<?php echo site_url('clean/ltkl'); ?>"><i class="fas fa-database"></i> LTKL</a></li>
                <li class="dropdown access_qris" id="nav-clean-qris">
                  <a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i class="fas fa-database"></i>QRIS</a>
                  <ul class="dropdown-menu">
                    <li id="nav-clean-qris-merchant"><a class="nav-link" href="<?php echo site_url('clean/qris_merchant'); ?>"><i class="fas fa-circle"></i> QRIS Merchant</a></li>
                    <li id="nav-clean-qris-trx"><a class="nav-link" href="<?php echo site_url('clean/qris_trx'); ?>"><i class="fas fa-circle"></i> QRIS Transaksi</a></li>
                  </ul>
                </li>
                <li id="nav-dana-float-clean" class="access_dana_float"><a class="nav-link" href="<?php echo site_url('clean/dana_float'); ?>"><i class="fas fa-database"></i> Dana Float</a></li>
                <li id="nav-sipesat-clean" class="access_sipesat"><a class="nav-link" href="<?php echo site_url('clean/si_pesat'); ?>"><i class="fas fa-database"></i> Si Pesat</a></li>
                <li class="dropdown access_lkpbu" id="nav-lkpbu-clean">
                  <a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i class="fas fa-database"></i>LKPBU</a>
                  <ul class="dropdown-menu">
                    <li id="nav-lkpbu-clean-302" class="access_lkpbu_302"><a class="nav-link" href="<?php echo site_url('clean/form_302'); ?>"><i class="fas fa-circle"></i> Form 302</a></li>
                    <li id="nav-lkpbu-clean-304" class="access_lkpbu_304"><a class="nav-link" href="<?php echo site_url('clean/form_304'); ?>"><i class="fas fa-circle"></i> Form 304</a></li>
                    <li id="nav-lkpbu-clean-306" class="access_lkpbu_306"><a class="nav-link" href="<?php echo site_url('clean/form_306'); ?>"><i class="fas fa-circle"></i> Form 306</a></li>
                    <li id="nav-lkpbu-clean-309-310-311" class="access_lkpbu_309_310_311"><a class="nav-link" href="<?php echo site_url('clean/form_309_310_311'); ?>" style="font-size: 11px;"><i class="fas fa-circle"></i> Form 309 310 & 311</a></li>
                    <li id="nav-lkpbu-clean-312" class="access_lkpbu_312"><a class="nav-link" href="<?php echo site_url('clean/form_312'); ?>"><i class="fas fa-circle"></i> Form 312</a></li>
                    <li id="nav-lkpbu-clean-313" class="access_lkpbu_313"><a class="nav-link" href="<?php echo site_url('clean/form_313'); ?>"><i class="fas fa-circle"></i> Form 313</a></li>
                  </ul>
                </li>
                <!-- <li id="nav-sys-availability" class="access_sys_availability"><a class="nav-link" href="<?php echo site_url('clean/sys_availability'); ?>"><i class="fas fa-database"></i> System Availability</a></li> -->
              </ul>
            </li>
            <li class="dropdown" id="nav-utilities-source">
              <a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i class="fas fa-wrench"></i> <span>Utilities Source</span></a>
              <ul class="dropdown-menu">
                <!-- <li id="nav-role-clean"><a class="nav-link" href="<?php echo site_url('utilities/role_clean'); ?>"><i class="fas fa-align-center"></i> Role Clean</a></li> -->
                <li id="nav-auto-clean" class="access_cleansing_ltdbb"><a class="nav-link" href="<?php echo site_url('utilities/auto_clean'); ?>"><i class="fas fa-align-center"></i> Auto Clean LTDBB</a></li>
                <li id="nav-auto-clean-ltkl" class="access_cleansing_ltkl"><a class="nav-link" href="<?php echo site_url('utilities/auto_clean_ltkl'); ?>"><i class="fas fa-align-center"></i> Auto Clean LTKL</a></li>
                <li id="nav-auto-clean-qris" class="access_cleansing_qris"><a class="nav-link" href="<?php echo site_url('utilities/auto_clean_qris'); ?>"><i class="fas fa-align-center"></i> Auto Clean QRIS</a></li>
                <!-- <li id="nav-manual-clean"><a class="nav-link" href="<?php echo site_url('utilities/manual'); ?>"><i class="fas fa-database"></i> Manual Clean</a></li> -->
              </ul>
            </li>
            <li class="dropdown access_master_data" id="nav-master-data">
              <a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i class="fas fa-sliders-h"></i> <span>Master data</span></a>
              <ul class="dropdown-menu">
                <li id="nav-role-model"><a class="nav-link" href="<?php echo site_url('role_model'); ?>"><i class="fas fa-align-center"></i> Role Model</a></li>
                <li id="nav-ltdbb-bi-country"><a class="nav-link" href="<?php echo site_url('master/ltdbb_bi_country'); ?>"><i class="fas fa-align-center"></i> Ltdbb BI Country</a></li>
                <li id="nav-ltdbb-bi-city"><a class="nav-link" href="<?php echo site_url('master/ltdbb_bi_city'); ?>"><i class="fas fa-align-center"></i> Ltdbb BI City</a></li>
                <!-- <li id="nav-region"><a class="nav-link" href="<?php echo site_url('master/region'); ?>"><i class="fas fa-align-center"></i> Region</a></li> -->
                <!-- <li id="nav-country"><a class="nav-link" href="<?php echo site_url('master/country'); ?>"><i class="fas fa-align-center"></i> Country</a></li> -->
                <li id="nav-subtype"><a class="nav-link" href="<?php echo site_url('master/page/tltkl_subtype'); ?>"><i class="fas fa-align-center"></i> Subtype</a></li>
                <li id="nav-fundtype"><a class="nav-link" href="<?php echo site_url('master/page/tltkl_fundtype'); ?>"><i class="fas fa-align-center"></i> Fundtype</a></li>
                <li id="nav-acctype"><a class="nav-link" href="<?php echo site_url('master/page/tltkl_acctype'); ?>"><i class="fas fa-align-center"></i> Acctype</a></li>
                <li id="nav-accstat"><a class="nav-link" href="<?php echo site_url('master/page/tltkl_accstat'); ?>"><i class="fas fa-align-center"></i> Accstat</a></li>
                <li id="nav-idtype"><a class="nav-link" href="<?php echo site_url('master/page/tltkl_idtype'); ?>"><i class="fas fa-align-center"></i> Idtype</a></li>
                <li id="nav-trxmode"><a class="nav-link" href="<?php echo site_url('master/page/tltkl_trxmode'); ?>"><i class="fas fa-align-center"></i> Trxmode</a></li>
                <li id="nav-trxtype"><a class="nav-link" href="<?php echo site_url('master/page/tltkl_trxtype'); ?>"><i class="fas fa-align-center"></i> Trxtype</a></li>
                <li id="nav-reporttype"><a class="nav-link" href="<?php echo site_url('master/page/tltkl_reporttype'); ?>"><i class="fas fa-align-center"></i> Reporttype</a></li>
                <li id="nav-contactcat"><a class="nav-link" href="<?php echo site_url('master/page/tltkl_contactcat'); ?>"><i class="fas fa-align-center"></i> Contactcat</a></li>
                <li id="nav-commtype"><a class="nav-link" href="<?php echo site_url('master/page/tltkl_commtype'); ?>"><i class="fas fa-align-center"></i> Commtype</a></li>
                <li id="nav-companytype"><a class="nav-link" href="<?php echo site_url('master/page/tltkl_companytype'); ?>"><i class="fas fa-align-center"></i> Companytype</a></li>
                <li id="nav-stufftype"><a class="nav-link" href="<?php echo site_url('master/page/tltkl_stufftype'); ?>"><i class="fas fa-align-center"></i> Stufftype</a></li>
                <li id="nav-currency"><a class="nav-link" href="<?php echo site_url('master/page/tltkl_currency'); ?>"><i class="fas fa-align-center"></i> Currency</a></li>
                <li id="nav-country"><a class="nav-link" href="<?php echo site_url('master/page/tltkl_country'); ?>"><i class="fas fa-align-center"></i> Country</a></li>
                <li id="nav-personacc"><a class="nav-link" href="<?php echo site_url('master/page/tltkl_personacc'); ?>"><i class="fas fa-align-center"></i> Personacc</a></li>
                <li id="nav-personentity"><a class="nav-link" href="<?php echo site_url('master/page/tltkl_personentity'); ?>"><i class="fas fa-align-center"></i> Personentity</a></li>
                <li id="nav-partyrole"><a class="nav-link" href="<?php echo site_url('master/page/tltkl_partyrole'); ?>"><i class="fas fa-align-center"></i> Partyrole</a></li>
                <li id="nav-reportind"><a class="nav-link" href="<?php echo site_url('master/page/tltkl_reportind'); ?>"><i class="fas fa-align-center"></i> Reportind</a></li>
                <li id="nav-gender"><a class="nav-link" href="<?php echo site_url('master/page/tltkl_gender'); ?>"><i class="fas fa-align-center"></i> Gender</a></li>
                <li id="nav-setting-report"><a class="nav-link" href="<?php echo site_url('report/setting_report'); ?>"><i class="fas fa-align-center"></i> Setting Report</a></li>
              </ul>
            </li>
            <!-- <li id="nav-verify-data">
              <a href="<?php echo site_url('verify'); ?>" class="nav-link"><i class="fas fa-check"></i><span>Verify Data</span></a>
            </li> -->
            <li class="dropdown" id="nav-report">
              <a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i class="fas fa-file-alt"></i> <span>Report</span></a>
              <ul class="dropdown-menu">


                <li class="dropdown" id="nav-ltdbb-report">
                  <a href="#" class="nav-link has-dropdown access_ltdbb" data-toggle="dropdown"><i class="fas fa-list"></i>LTDBB</a>
                  <ul class="dropdown-menu">
                    <li id="nav-ltdbb-report-g001"><a class="nav-link" href="<?php echo site_url('report/ltdbb/G001'); ?>"><i class="fas fa-circle"></i> G001</a></li>
                    <li id="nav-ltdbb-report-g002"><a class="nav-link" href="<?php echo site_url('report/ltdbb/G002'); ?>"><i class="fas fa-circle"></i> G002</a></li>
                    <li id="nav-ltdbb-report-g003"><a class="nav-link" href="<?php echo site_url('report/ltdbb/G003'); ?>"><i class="fas fa-circle"></i> G003</a></li>
                  </ul>
                </li>
                <li id="nav-dana-float-report" class="access_ltkl"><a class="nav-link" href="<?php echo site_url('report/ltkl'); ?>"><i class="fas fa-list"></i> LTKL</a></li>
                <li id="nav-qris-report" class="access_qris"><a class="nav-link" href="<?php echo site_url('report/qris'); ?>"><i class="fas fa-list"></i> QRIS</a></li>
                <li id="nav-dana-float-report" class="access_dana_float"><a class="nav-link" href="<?php echo site_url('report/dana_float'); ?>"><i class="fas fa-list"></i> Dana Float</a></li>
                <li id="nav-sipesat-report" class="access_sipesat"><a class="nav-link" href="<?php echo site_url('report/sipesat'); ?>"><i class="fas fa-list"></i> Sipesat</a></li>
                <li class="dropdown access_lkpbu" id="nav-lkpbu-report">
                  <a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i class="fas fa-list"></i>LKPBU</a>
                  <ul class="dropdown-menu">
                    <li class="access_lkpbu_302" id="nav-lkpbu-report-302"><a class="nav-link" href="<?php echo site_url('report/lkpbu_302'); ?>"><i class="fas fa-circle"></i> Form 302</a></li>
                    <li class="access_lkpbu_303" id="nav-lkpbu-report-303"><a class="nav-link" href="<?php echo site_url('report/lkpbu_303'); ?>"><i class="fas fa-circle"></i> Form 303</a></li>
                    <li class="access_lkpbu_304" id="nav-lkpbu-report-304"><a class="nav-link" href="<?php echo site_url('report/lkpbu_304'); ?>"><i class="fas fa-circle"></i> Form 304</a></li>
                    <li class="access_lkpbu_306" id="nav-lkpbu-report-306"><a class="nav-link" href="<?php echo site_url('report/lkpbu_306'); ?>"><i class="fas fa-circle"></i> Form 306</a></li>
                    <li class="access_lkpbu_309_310_311" id="nav-lkpbu-report-309"><a class="nav-link" href="<?php echo site_url('report/lkpbu_309'); ?>"><i class="fas fa-circle"></i> Form 309</a></li>
                    <li class="access_lkpbu_309_310_311" id="nav-lkpbu-report-310"><a class="nav-link" href="<?php echo site_url('report/lkpbu_310'); ?>"><i class="fas fa-circle"></i> Form 310</a></li>
                    <li class="access_lkpbu_309_310_311" id="nav-lkpbu-report-311"><a class="nav-link" href="<?php echo site_url('report/lkpbu_311'); ?>"><i class="fas fa-circle"></i> Form 311</a></li>
                    <li class="access_lkpbu_312" id="nav-lkpbu-report-312"><a class="nav-link" href="<?php echo site_url('report/lkpbu_312'); ?>"><i class="fas fa-circle"></i> Form 312</a></li>
                    <li class="access_lkpbu_313" id="nav-lkpbu-report-313"><a class="nav-link" href="<?php echo site_url('report/lkpbu_313'); ?>"><i class="fas fa-circle"></i> Form 313</a></li>
                  </ul>
                </li>
                <li id="nav-sys-availability-report" class="access_sys_availability"><a class="nav-link" href="<?php echo site_url('report/sys_availability'); ?>"><i class="fas fa-list"></i> System Availability</a></li>
              </ul>
            </li>

            <li class="menu-header">System Setting</li>
            <li>
              <a href="<?php echo site_url('user_group'); ?>" class="nav-link access_user_group"><i class="fas fa-users"></i><span>User group</span></a>
            </li>
            <li>
              <a href="<?php echo site_url('user'); ?>" class="nav-link access_user"><i class="fas fa-user"></i><span>User</span></a>
            </li>
            <li id="nav-user-activity">
              <a href="<?php echo site_url('user_activity'); ?>" class="nav-link access_user_activity"><i class="fas fa-history"></i><span>User Activity</span></a>
            </li>
            <li id="nav-archive">
              <a href="<?php echo site_url('source/archive'); ?>" class="nav-link access_archive"><i class="fas fa-archive"></i><span>Archive</span></a>
            </li>
            <li>
              <a href="<?php echo site_url('login/signout'); ?>" class="nav-link"><i class="fas fa-sign-out-alt"></i><span>Logout</span></a>
            </li>
          </ul>

          <div class="mt-4 mb-4 p-3 hide-sidebar-mini">
            <!-- <a href="https://getstisla.com/docs" class="btn btn-danger btn-lg btn-block btn-icon-split">
              <i class="fas fa-rocket"></i> Documentation
            </a> -->
          </div>
        </aside>
      </div>

      <!-- Main Content -->
      <div class="main-content">
        <?php echo $content; ?>
      </div>

      <footer class="main-footer">
        <div class="footer-left">
          Copyright &copy; 2021 Report Management || By <a href="javascript:void(0)"> </a>
          <div class="bullet"></div> All Right Reserved
        </div>
        <div class="footer-right">

        </div>
      </footer>
    </div>
  </div>

  <!-- General JS Scripts -->

  <script src="<?php echo base_url(); ?>assets/modules/popper.js"></script>
  <script src="<?php echo base_url(); ?>assets/modules/tooltip.js"></script>
  <script src="<?php echo base_url(); ?>assets/modules/bootstrap/js/bootstrap.min.js"></script>
  <script src="<?php echo base_url(); ?>assets/modules/nicescroll/jquery.nicescroll.min.js"></script>
  <script src="<?php echo base_url(); ?>assets/modules/moment.min.js"></script>
  <script src="<?php echo base_url(); ?>assets/js/stisla.js"></script>

  <!-- JS Libraies -->
  <script src="<?php echo base_url(); ?>assets/modules/chart.min.js"></script>
  <script src="<?php echo base_url(); ?>assets/modules/datatables/datatables.min.js"></script>
  <script src="<?php echo base_url(); ?>assets/modules/bootstrap-daterangepicker/daterangepicker.js"></script>
  <script src="<?php echo base_url(); ?>assets/modules/izitoast/js/iziToast.min.js"></script>
  <script src="<?php echo base_url(); ?>assets/modules/sweetalert/sweetalert.min.js"></script>
  <script src="<?php echo base_url(); ?>assets/modules/dropify/js/dropify.min.js"></script>
  <script src="<?php echo base_url(); ?>assets/modules/fullcalendar/fullcalendar.min.js"></script>
  <script src="<?php echo base_url(); ?>assets/modules/select2/dist/js/select2.full.min.js"></script>
  <script src="<?php echo base_url(); ?>assets/modules/bootstrap-daterangepicker/daterangepicker.js"></script>
  <!-- Page Specific JS File -->
  <script src="<?php echo base_url(); ?>assets/js/page/index-0.js"></script>
  <!-- Template JS File -->

  <script src="<?php echo base_url(); ?>assets/js/scripts.js"></script>
  <script src="<?php echo base_url(); ?>assets/js/custom.js"></script>

  <script>
    
    

    $(document).ready(function() {
      $('.dropify').dropify();
      $('.select2').select2({
        width: '100%'
      });
      $('.daterange-picker').daterangepicker({
          startDate: moment().startOf('month'),
          endDate: moment().endOf('month'),
          showDropdowns: true,
          opens: 'left',
          ranges: {
            'Last 30 Days': [moment().subtract('days', 29), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')]
          },
          format: 'DD-MM-YYYY',
          buttonClasses: ['btn'],
          applyClass: 'btn-danger',
          cancelClass: 'default',
          locale: {
            format: 'DD-MM-YYYY'
          }
        },
        function(start, end) {
          $('#daterange-picker input').html(start.format('DD-MM-YYYY') + ' - ' + end.format('DD-MM-YYYY'));
        }
      );



    });

  </script>
  
  
</body>

</html>