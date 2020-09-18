<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="contents">

        <!-- Start Breadcumb -->
        <div class="breadcrumb"></div>
        <!-- End of Breadcumb -->

        <!-- Start Content Table -->
        <div class="row">
            <div class="col-lg-12">
                <?php if ($this->session->userdata('role_id') == '1') { ?>
                    <iframe src="http://localhost/app/user/admin/index" style="position: fixed; left:107px;bottom:0; right: 0; width: 101%; height: 101%; border: none; margin:0; overflow:hidden;z-index:1;">
                        Your browser doesn't support iframes
                    </iframe>
                <?php } else {
                    echo restricted_area();
                } ?>
            </div>
        </div>
        <!-- End of Content Table -->
    </div>
</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->