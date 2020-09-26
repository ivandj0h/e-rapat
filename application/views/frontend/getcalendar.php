<!DOCTYPE html>
<html lang="en">

<head>
    <title>E-RAPAT | Documentation</title>
    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Ivandi Djoh Gah">
    <link rel="shortcut icon" href="http://localhost/rapat/assets/img/transport.svg">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <!-- FontAwesome JS -->
    <script defer src="<?= base_url('assets/vendor/docs/fontawesome/js/all.js') ?>"></script>
    <!-- Global CSS -->
    <link rel="stylesheet" href="<?= base_url('assets/vendor/docs/plugins/bootstrap/css/bootstrap.min.css') ?>">
    <!-- Plugins CSS -->
    <link rel="stylesheet" href="<?= base_url('assets/vendor/docs/plugins/prism/prism.css') ?>">
    <link rel="stylesheet" href="<?= base_url('assets/vendor/docs/plugins/elegant_font/css/style.css') ?>">

    <!-- Theme CSS -->
    <link id="theme-style" rel="stylesheet" href="<?= base_url('assets/vendor/docs/css/styles.css') ?>">

</head>

<body class="body-green">
    <div class="page-wrapper">
        <!-- ******Header****** -->
        <header id="header" class="header">
            <div class="container">
                <div class="branding">
                    <h1 class="logo">
                        <a href="">
                            <span aria-hidden="true" class="fas fa-calendar-alt"></span>
                            <span class="text-highlight">Kalender </span> <span class="text-bold">E-RAPAT</span>
                        </a>
                    </h1>
                </div>
                <!--//branding-->

                <!--                 <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="">Home</a></li>
                    <li class="breadcrumb-item active">Memulai Aplikasi E-RAPAT</li>
                </ol> -->
            </div>
            <!--//container-->
        </header>
        <!--//header-->
        <div class="doc-wrapper">
            <div class="row">
                <div id="contextMenu" class="dropdown clearfix"></div>
                <div class="panel panel-default hidden-print mx-auto" style="width: 90%;">
                    <div class="panel-heading">
                        <h3 class="panel-title">Pengaturan Tampilan kalender</h3>
                    </div>
                    <div class="panel-body vertical-align">
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="calendar_view">Pilih Mode Tampilan</label>
                                <select class="form-control" id="calendar_view">
                                    <option value="month">Tampilkan Kalendar Berdasarkan Bulan</option>
                                    <option value="agendaWeek">Tampilkan Kalendar Berdasarkan Minggu</option>
                                    <option value="agendaDay">Tampilkan Kalendar Berdasarkan Hari</option>
                                    <option value="listWeek">Tampilkan Kalendar Berdasarkan List Agenda Rapat</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="calendar_start_time">Jam Awal Rapat :</label>
                                <select class="form-control" id="calendar_start_time">
                                    <?php get_dropdown_time(); ?>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="calendar_end_time">Jam Akhir Rapat :</label>
                                <select class="form-control" id="calendar_end_time">
                                    <?php get_dropdown_time(); ?>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <input class='showHideWeekend' type="checkbox" checked>
                                <label for="ShowWeekends">Tampilkan/Sembunyikan Kalender Akhir Pekan</label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default hidden-print mx-auto" style="width: 92%;">
                <div class="panel-heading">
                    <h3 class="panel-title">Filter Kalender</h3>
                </div>
                <div class="panel-body">
                    <div class="col-lg-4">
                        <label for="calendar_view">Berdasarkan Media Meeting</label>
                        <div class="input-group">
                            <select class="filter" id="type_filter" multiple="multiple">
                                <option value='all'>Semua Media Meeting</option>
                                <?php
                                echo "<option value='0' disabled>-- Media Online --</option>";
                                get_dropdown_media_online();
                                echo "<option value='0' disabled>-- Media Offline --</option>";
                                get_dropdown_media_offline();
                                ?>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <label for="calendar_view">Berdasarkan Esalon 2</label>
                        <div class="input-group">
                            <select class="filter" id="bagian_filter" multiple="multiple">
                                <option value='all'>Semua Esalon 2</option>
                                <?= get_dropdown_esalon_2(); ?>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <label for="calendar_view">Berdasarkan Tipe Media</label>
                        <div class="input-group">
                            <label class="checkbox-inline"><input class='filter' type="checkbox" value="Online" checked><span class="chksuccess">Media Online</span></label>
                            <label class="checkbox-inline"><input class='filter' type="checkbox" value="Offline" checked><span class="chkdanger">Media Offline</span></label>
                        </div>
                    </div>
                </div>
            </div>
            <div id="wrapper">
                <div id="loading"></div>
                <div class="print-visible mx-auto" style="width: 92%;" id="calendar"></div>
            </div>
        </div>
    </div>
    <!-- DETAIL EVENT MODAL -->

    <div class="modal fade" tabindex="-1" role="dialog" id="editEventModal" data-backdrop="static">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Detail Rapat Tanggal : <span class="eventDate"></span> Pukul <span class="eventHourStart"></span> s/d <span class="eventHourEnd"></span></h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="row">
                            <div class="row">
                                <div class="col-xs-12">
                                    <label class="col-xs-4" for="title">Nama Bagian</label>
                                    <input class="inputModal" disabled id="editTitle" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <label class="col-xs-4" for="edit-event-desc">Agenda Rapat</label>
                                    <textarea rows="4" cols="50" class="inputModal" disabled id="edit-event-desc"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-event-desc">Agenda Rapat</label>
                                <textarea rows="4" cols="50" class="inputModal" disabled id="edit-event-desc"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
        <footer id="footer" class="footer text-center">
            <div class="container">
                <small class="copyright">Designed with <i class="fas fa-heart"></i> by <a href="https://github.com/ivandi1980" target="_blank">Ivandi Djoh Gah</a> &copy; 2020. Allright reserved</small>
            </div>
        </footer>
        <!-- Main Javascript -->
        <script type="text/javascript" src="<?= base_url('assets/vendor/docs/plugins/jquery-3.4.1.min.js') ?>"></script>
        <script type="text/javascript" src="<?= base_url('assets/vendor/docs/plugins/bootstrap/js/bootstrap.min.js') ?>"></script>
        <script type="text/javascript" src="<?= base_url('assets/vendor/docs/plugins/prism/prism.js') ?>"></script>
        <script type="text/javascript" src="<?= base_url('assets/vendor/docs/plugins/jquery-scrollTo/jquery.scrollTo.min.js') ?>"></script>
        <script type="text/javascript" src="<?= base_url('assets/vendor/docs/plugins/stickyfill/dist/stickyfill.min.js') ?>"></script>
        <script type="text/javascript" src="<?= base_url('assets/vendor/docs/js/main.js') ?>"></script>

</body>

</html>