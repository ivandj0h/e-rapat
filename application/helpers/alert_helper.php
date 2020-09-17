            <?php
            defined('BASEPATH') or exit('No direct script access allowed');
            ?>
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

            function choose_undangan($m)
            { ?>
                <div class="popup-wrapper" id="popup">
                    <div class="popup-container">
                        <!-- Konten popup, silahkan ganti sesuai kebutughan -->
                        <h2>Langkah Pertama</h2>
                        <p>Silahkan Memilih salah satu metode untuk Managemen Absensi</p>
                        <hr>

                        <ul class="chec-radio">
                            <!-- Radio Button Here -->
                            <li class="pz">
                                <label class="radio-inline">
                                    <input type="radio" id="pro-chx-residential" name="zoomid" class="pro-chx" value="soho">
                                    <div class="avail text-primary">
                                        Menggunakan <strong>SOHO FORM</strong>
                                    </div>
                                </label>
                            </li>
                            <li class="pz">
                                <label class="radio-inline">
                                    <input type="radio" id="pro-chx-residential" name="zoomid" class="pro-chx" value="erapat">
                                    <div class="avail text-primary">
                                        Menggunakan <strong>E-RAPAT FORM</strong>
                                    </div>
                                </label>
                            </li>
                        </ul>
                        <br>

                        <button type="submit" name="btnGo" class="btn btn-primary" id="btnGo"><i class="fas fa-arrow-alt-circle-right"></i> Selanjutnya</button>
                        <a class="popup-close" href="<?= base_url('meeting'); ?>">X</a>
                    </div>
                </div>
            <?php } ?>