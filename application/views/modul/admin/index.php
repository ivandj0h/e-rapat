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
            <div class="row">
                <div class="col">
                    <div class="card mb-3 shadow">
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

            <div class="container">
                <div class="row justify-content-center form-heigt">
                    <div class="col-md-12">

                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">
                                <div class="accordion" id="accordion1">
                                    <div class="card shadow">
                                        <div class="card-body" id="heading1">
                                            <div class="d-flex justify-content-between">
                                                <div class="p-2 bd-highlight"><strong>Department Pertama</strong></div>
                                                <div class="p-2 bd-highlight"><strong>Ruangan Meeting Pertama</strong></div>
                                                <div class="p-2 bd-highlight"><span class="badge badge-danger">Booked</span></div>
                                                <div class="p-2 bd-highlight">
                                                    <i class="fas fa-angle-double-down pointer-link" data-toggle="collapse" data-target="#collapseOne"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <hr class="sidebar-divider mb-0">
                                        <div id="collapseOne" class="collapse mt-0 mb-3" aria-labelledby="heading1" data-parent="#accordion1">
                                            <div class="card-body">
                                                <p>HTML stands for HyperText Markup Language. HTML is the standard markup language for describing the structure of web pages. <a href="https://www.tutorialrepublic.com/html-tutorial/" target="_blank">Learn more.</a></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <div class="accordion" id="accordion2">
                                    <div class="card shadow">
                                        <div class="card-body" id="heading2">
                                            <div class="d-flex justify-content-between">
                                                <div class="p-2 bd-highlight"><strong>Department Pertama</strong></div>
                                                <div class="p-2 bd-highlight"><strong>Ruangan Meeting Pertama</strong></div>
                                                <div class="p-2 bd-highlight"><span class="badge badge-primary">Requested</span></div>
                                                <div class="p-2 bd-highlight">
                                                    <i class="fas fa-angle-double-down pointer-link" data-toggle="collapse" data-target="#collapse2"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <hr class="sidebar-divider mb-0">
                                        <div id="collapse2" class="collapse mt-0 mb-3" aria-labelledby="heading2" data-parent="#accordion2">
                                            <div class="card-body">
                                                <p>HTML stands for HyperText Markup Language. HTML is the standard markup language for describing the structure of web pages. <a href="https://www.tutorialrepublic.com/html-tutorial/" target="_blank">Learn more.</a></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>


                        </ul>






                    </div>
                </div>
            </div>
            <!-- End of Main Content -->