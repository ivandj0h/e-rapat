<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
  <meta name="generator" content="Jekyll v4.0.1">
  <title><?= $title; ?></title>

  <!-- Bootstrap core CSS -->
  <link href="<?= base_url('assets/'); ?>css/bootstrap-4.5.min.css" rel="stylesheet" type="text/css">

  <!-- Favicons -->
  <link rel="shortcut icon" href="<?= base_url('assets/'); ?>img/calendar.svg">

  <!-- Custom fonts for this template-->
  <link href="<?= base_url('assets/'); ?>vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="<?= base_url('assets/'); ?>css/front-customs.css" rel="stylesheet">
</head>

<body>
  <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow fixed-top">
    <h5 class="my-0 mr-md-auto font-weight-normal"><i class="fas fa-calendar-alt"></i> <?= $title; ?></h5>
    <nav class="my-2 my-md-0 mr-md-3">
      <a class="p-2 text-dark" href="<?= base_url('home') ?>">Home</a>
      <a class="p-2 text-dark" href="<?= base_url('about') ?>">About</a>
      <a class="p-2 text-dark" href="<?= base_url('calendar') ?>">Calendar</a>
    </nav>
    <a class="btn btn-primary" href="<?= base_url('auth') ?>">Login</a>
  </div>

  <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">

    <!-- Start of flash messages -->
    <?= $this->session->flashdata('messages'); ?>
    <!-- End of flash messages -->

  </div>

  <div class="container">
    <h1 class="display-4">e-rapat</h1>
    <p class="lead"><small class="small-fonts"> <strong>e-rapat</strong> application is a platform developed by the Ministry of Transportation of the Republic of Indonesia to facilitate arranging meeting activities because it is well scheduled according to what has been made by each user of this system..</small></p>
  </div>




  <!-- <footer class="pt-4 my-md-5 pt-md-5 border-top">
      <div class="row">
        <div class="col-12 col-md">
          <img class="mb-2" src="/docs/4.5/assets/brand/bootstrap-solid.svg" alt="" width="24" height="24">
          <small class="d-block mb-3 text-muted">Copyright &copy; e-rapat <?= date('Y'); ?></small>
        </div>
        <div class="col-6 col-md">
          <h5>Features</h5>
          <ul class="list-unstyled text-small">
            <li><a class="text-muted" href="#">Cool stuff</a></li>
            <li><a class="text-muted" href="#">Random feature</a></li>
            <li><a class="text-muted" href="#">Team feature</a></li>
            <li><a class="text-muted" href="#">Stuff for developers</a></li>
            <li><a class="text-muted" href="#">Another one</a></li>
            <li><a class="text-muted" href="#">Last time</a></li>
          </ul>
        </div>
        <div class="col-6 col-md">
          <h5>Resources</h5>
          <ul class="list-unstyled text-small">
            <li><a class="text-muted" href="#">Resource</a></li>
            <li><a class="text-muted" href="#">Resource name</a></li>
            <li><a class="text-muted" href="#">Another resource</a></li>
            <li><a class="text-muted" href="#">Final resource</a></li>
          </ul>
        </div>
        <div class="col-6 col-md">
          <h5>About</h5>
          <ul class="list-unstyled text-small">
            <li><a class="text-muted" href="#">Team</a></li>
            <li><a class="text-muted" href="#">Locations</a></li>
            <li><a class="text-muted" href="#">Privacy</a></li>
            <li><a class="text-muted" href="#">Terms</a></li>
          </ul>
        </div>
      </div>
    </footer> -->


  <!-- Bootstrap core JavaScript-->
  <script src="<?= base_url('assets/'); ?>vendor/jquery/jquery.min.js"></script>
  <script src="<?= base_url('assets/'); ?>vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Customs scripts -->
  <script src="<?= base_url('assets/'); ?>js/customsjs/customsjs-demo.js"></script>
</body>

</html>