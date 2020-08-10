<body>
  <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow fixed-top">
    <h5 class="my-0 mr-md-auto font-weight-normal"><i class="fas fa-calendar-alt"></i> <?= $title; ?></h5>
    <nav class="my-2 my-md-0 mr-md-3">
      <a class="p-2 text-dark" href="<?= base_url('home') ?>">Home</a>
      <a class="p-2 text-dark" href="<?= base_url('about') ?>">About</a>
    </nav>
    <a class="btn btn-primary" href="<?= base_url('auth') ?>">Login</a>
  </div>

  <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">

    <!-- Start of flash messages -->
    <?= $this->session->flashdata('messages'); ?>
    <!-- End of flash messages -->

  </div>

  <div class="container">
    <div class="row justify-content-center">
      <div class="col-12 col-md-10 col-lg-8">
        <form class="card card-sm">
          <div class="card-body row no-gutters align-items-center">
            <div class="col-auto">
              <i class="fas fa-search h4 text-body"></i>
            </div>
            <!--end of col-->
            <div class="col">
              <input class="form-control form-control-lg form-control-borderless" type="search" placeholder="Search topics or keywords">
            </div>
            <!--end of col-->
            <div class="col-auto">
              <button class="btn btn-lg btn-success" type="submit">Search</button>
            </div>
            <!--end of col-->
          </div>
        </form>
      </div>
      <!--end of col-->
    </div>
  </div>

  <div id="calendar"></div>