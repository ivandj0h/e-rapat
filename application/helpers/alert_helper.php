            <!-- Start of Modal Alert if empty upload file -->
            <?php
            function get_alert_empty_upload()
            {
                $ci = get_instance();
                $meeting = $ci->Meeting_model->get_all_meeting_by_sesi($ci->session->userdata('email'));

                foreach ($meeting as $a) :
                    $id = $a['id'];

                    if (empty($a['files_upload']) || empty($a['files_upload2'] || empty($a['files_upload2']))) { ?>
                        <div class="popup-wrapper" id="popup">
                            <div class="popup-container">
                                <!-- Konten popup, silahkan ganti sesuai kebutughan -->
                                <form action="meeting" method="post" class="popup-form">
                                    <h2>Perhatian!!</h2>
                                    <p>Anda belum menunggah File-file kelengkapan Rapat seperti : <br />
                                        <ul>
                                            <li>Undangan Rapat</li>
                                            <li>Notulen Rapat</li>
                                            <li>Absensi Rapat</li>
                                        </ul>
                                        <strong class="text-danger">Mohon untuk segera mengunggah filenya sekarang.</strong>
                                        <!-- </p>
                                <div class="input-group">
                                    <input type="submit" value="Cek Files" name="unggah">
                                </div> -->
                                </form>
                                <a class="popup-close" href="meeting">X</a>
                            </div>
                        </div>
            <?php
                    }
                endforeach;
            }
            // <!-- End of Modal Alert if empty upload file -->
            ?>


            <!-- Start of Modal Restricted Area -->
            <?php
            function restricted_area()
            { ?>
                <div class="popup-wrapper" id="popup">
                    <div class="popup-container">
                        <!-- Konten popup, silahkan ganti sesuai kebutughan -->
                        <h2>Access Denied!!</h2>
                        <p><strong class="text-danger">Maaf, Anda tidak memilike akses ke Menu ini.</strong>
                            <a class="popup-close" href="<?= base_url('meeting'); ?>">X</a>
                    </div>
                </div>
            <?php
            }


            function alert_zoho()
            { ?>
                <div class="popup-wrapper" id="popup">
                    <div class="popup-container">
                        <!-- <iframe src="accounts.zoho.com/signin?servicename=ZohoForms&signupurl=https://www.zoho.com/forms/signup.html" style="position: fixed; padding-top:75px; left:0;bottom:0; right: 0; width: 100%; height: 100%; border: none; margin:0; overflow-x: hidden; z-index:1;"> -->
                        <iframe src="https://www.zoho.com/creator/signup.html">box for ifr_Cities_List</iframe>
                    </div>
                </div>
            <?php
            }
