        <!-- Begin Page Content -->
        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="contents">

                <!-- Start Breadcumb -->
                <div class="breadcrumb"></div>
                <!-- End of Breadcumb -->

                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between">
                    <h1 class="h3 mb-0 text-gray-800"><?= $title; ?></h1>
                </div>
                <!-- Content Row -->
            </div>
            <!-- <div class="col-md-12 mb-3"> -->
            <hr class="sidebar-divider my-3">
            <!-- </div> -->
            <div class="row form-heigt">
                <div class="col">
                    <div class="card mb-3">
                        <div class="card-header">
                            Hello <?= greetings(); ?> <strong><?= $profiles['name']; ?></strong>, Selamat datang di Dashboard Aplikasi <strong>e-rapat</strong>.
                        </div>
                        <div class="row no-gutters">
                            <div class="col-md-12">
                                <div class="card-body">
                                    <div class="row h-100 justify-content-center align-items-center">
                                        <form class="form-inline" action="#">
                                            <input type="date" class="form-control mb-2 mr-sm-2" placeholder="Enter email" id="date_issues">
                                            <select class="form-control mb-2 mr-sm-2" name="place_id" required>
                                                <option value="">Pilih Lokasi</option>
                                                <?php foreach ($place as $p) : ?>
                                                    <option value="<?= $p['id']; ?>"><?= $p['place_name']; ?></option>
                                                <?php endforeach; ?>
                                            </select>
                                            <button type="submit" class="btn btn-success mb-2">Cek Ketersediaan</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>



            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->