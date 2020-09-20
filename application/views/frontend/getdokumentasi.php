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
                            <span class="text-highlight">Dokumentasi </span> <span class="text-bold">E-RAPAT</span>
                        </a>
                    </h1>
                </div>
                <!--//branding-->

                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="">Home</a></li>
                    <li class="breadcrumb-item active">Memulai Aplikasi E-RAPAT</li>
                </ol>
            </div>
            <!--//container-->
        </header>
        <!--//header-->
        <div class="doc-wrapper">
            <div class="container">
                <!-- <div id="doc-header" class="doc-header text-center">
                    <h1 class="doc-title"><i class="icon fa fa-paper-plane"></i> Quick Start</h1>
                    <div class="meta"><i class="far fa-clock"></i> Last updated: September 18th, 2020</div>
                </div> -->
                <!--//doc-header-->
                <div class="doc-body row">
                    <div class="doc-content col-md-9 col-12 order-1">
                        <div class="content-inner">
                            <section id="download-section" class="doc-section">
                                <h2 class="section-title">Panduan: Memulai Aplikasi <span class="text-highlight">E-RAPAT </span></h2>
                                <div class="section-block">
                                    <div class="callout-block callout-info">
                                        <div class="icon-holder">
                                            <i class="fas fa-calendar-alt"></i>
                                        </div>
                                        <!--//icon-holder-->
                                        <div class="content">
                                            <h4 class="callout-title">e-rapat:</h4>
                                            <p>Aplikasi E-rapat merupakan platform yang dikembangkan oleh Badan Litbang Kementerian Perhubungan Republik Indonesia untuk memudahkan mengatur kegiatan rapat di unit eselon II di lingkungan Badan Litbang Kementerian Perhubungan agar proses administrasi terdokumentasi dengan baik.</p>
                                        </div>
                                        <!--//content-->
                                    </div>
                                </div>
                            </section>
                            <!--//doc-section-->
                            <section id="installation-section" class="doc-section">
                                <h2 class="section-title">Tampilan Antarmuka e-rapat</h2>
                                <div><img class="img-responsive" src="<?= base_url('assets/img/docs/000.png'); ?>" /></div>
                                <br />
                                <strong><span class="text-danger">Tampilan Kalendar e-rapat</span></strong>
                                <br />
                                <div id="step1" class="section-block">
                                    <h3 class="block-title">Pengaturan Tampilan kalender</h3>
                                    <div class="box-img"><img src="<?= base_url('assets/img/docs/001.png'); ?>"></div>
                                    <span class="text-muted">Blok tampilan diatas ini digunakan untuk mengatur tampilan kalendar berdasarkan Bulan, Minggu, Hari & juga tampilan List</span>

                                    <p class="garis"></p>
                                    <p class="box-img"><img src="<?= base_url('assets/img/docs/002.png'); ?>"></p>
                                    <span class="text-muted">Blok tampilan diatas ini digunakan untuk mengatur tampilan kalendar berdasarkan range jam/waktu</span>

                                    <p class="garis"></p>
                                    <p class="box-img"><img src="<?= base_url('assets/img/docs/003.png'); ?>"></p>
                                    <span class="text-muted">Blok tampilan diatas ini digunakan untuk Tampilkan / Sembunyikan Akhir Pekan (Sabtu - Minggu)</span>
                                </div>
                                <div id="step2" class="section-block">
                                    <h3 class="block-title">Filter Kalender</h3>
                                    <div class="box-img"><img src="<?= base_url('assets/img/docs/004.png'); ?>"></div>
                                    <span class="text-muted">Blok tampilan diatas ini digunakan untuk memfilter Rapat berdasarkan Media Rapat yang dipergunakan</p>
                                        <span class="garis"></span>
                                        <p class="box-img"><img src="<?= base_url('assets/img/docs/005.png'); ?>"></p>
                                        <span class="text-muted">Blok tampilan diatas ini digunakan untuk memfilter Rapat berdasarkan Esalon 2</p>

                                            <p class="garis"></p>
                                            <p class="box-img"><img src="<?= base_url('assets/img/docs/006.png'); ?>"></p>
                                            <span class="text-muted">Blok tampilan diatas ini digunakan untuk memfilter Rapat yang dilakukan secara Online maupun secara Offline</span>
                                </div>
                                <div id="step3" class="section-block">
                                    <h3 class="block-title">Preview Kalendar</h3>
                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/007.png'); ?>" /></div>
                                    <span class="text-muted">Tampilan Rapat Online</span>
                                    <p class="garis"></p>
                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/008.png'); ?>" /></div>
                                    <span class="text-muted">Tampilan Rapat Offline</span>
                                </div>
                            </section>
                            <section id="code-section" class="doc-section">
                                <h2 class="section-title">Tampilan Admin Cpanel</h2>
                                <div id="html" class="section-block">
                                    <h3 class="block-title">Tampilan Halaman Login</h3>
                                    Blok tampilan dibawah ini adalah tampilan Login ke Admin Cpanel
                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/009.png'); ?>" />
                                    </div>
                                </div>
                                <div id="css" class="section-block">
                                    <h3 class="block-title">Tampilan Halaman Profil</h3>
                                    Blok tampilan dibawah ini adalah tampilan Halaman Profil pada Admin Cpanel
                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/010.png'); ?>" /></div>
                                </div>
                                <div id="sass" class="section-block">
                                    <h3 class="block-title">Tampilan Halaman Master Data Rapat</h3>
                                    Blok tampilan dibawah ini adalah tampilan Master Data Rapat pada Admin Cpanel, pada halaman inilah semua administrasi rapat di handle
                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/011.png'); ?>" /></div>
                                    <p class="garis"></p>
                                    <h6 class="block-title">Membuat Agenda Rapat Baru</h6>
                                    Untuk Membuat Agenda Rapat yang Baru, Silahkan Klik Tombol berwarna Hijau yang terletak di bagian kiri atas tabel Rapat
                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/012.png'); ?>" /></div>
                                    <p class="garis"></p>
                                    Maka kemudian akan muncul sebuah PopUp Form.
                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/013.png'); ?>" /></div>
                                    <p class="garis"></p>
                                    kemudian isi dengan kelengkapan data-data berupa tanggal, jam, type rapat, agenda dan kelengkapan data yang lainnya.
                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/013a.png'); ?>" /></div>
                                    <p class="garis"></p>
                                    kemudian Aplikasi <strong>e-rapat memproses</strong> data.
                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/013b.png'); ?>" /></div>
                                    <p class="garis"></p>
                                    Setelah berhasil melakukan input data rapat, maka akan muncul tabel seperti dibawah ini.
                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/014.png'); ?>" /></div>
                                    <p class="garis"></p>
                                    Klik tombol ini jika anda ingin kembali ke halaman Kalender.<i> (terletak di pojok kanan atas pada menu toolbar)</i>
                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/015.png'); ?>" /></div>
                                </div>
                                <!--//section-block-->
                                <div id="less" class="section-block">
                                    <h3 class="block-title">Tampilan Halaman Upload Undangan Rapat</h3>
                                    Secara default tampilan upload file-file pendukung Rapat masih berwana merah. maka anda diharuskan untuk mengunggah file-file tersebut. (fokus ke button yang berwarna merah).
                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/016.png'); ?>" />
                                    </div>
                                    <p class="garis"></p>
                                    Jika anda tidak mengunggah file-file pendukung seperti yang telah di minta maka akan muncul pop up seperti ini
                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/017.png'); ?>" />
                                    </div>
                                    <p class="garis"></p>
                                    Silahkan klik tombol <strong>Undangan Rapat</strong> untuk mengunggah File Undangan
                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/018.png'); ?>" />
                                    </div>
                                    <p class="garis"></p>
                                    Selanjutnya akan tampil PopUp seperti dibawah ini, silahkan <strong>mengunggah File Undangan Rapat</strong> anda.
                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/019.png'); ?>" />
                                    </div>
                                    <p class="garis"></p>
                                    Langkah berikutnya adalah dengan <strong>mengunggah File Undangan Rapat</strong> seperti dibawah ini.
                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/020.png'); ?>" />
                                    </div>
                                    <p class="garis"></p>
                                    Jika <strong>File Undangan Rapat</strong> yang anda unggah tadi berhasil maka tombol yang tadinya masih berwarna merah akan berwarna Hijau.
                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/021.png'); ?>" />
                                    </div>
                                </div>
                                <!--//section-block-->
                                <div id="javascript" class="section-block">
                                    <div class="code-block">
                                        <h3 class="block-title">Tampilan Halaman Download Undangan Rapat</h3>
                                        Setelah berhasil mengunggah File Undangan kemudian anda berniat ingin <strong>Mengunduh</strong> File tersebut, maka yang harus dilakukan adalah dengan mengKlik tombol File undangan yang sudah berwarna hijau.
                                        <div><img class="img-responsive" src="<?= base_url('assets/img/docs/023.png'); ?>" /></div>
                                    </div>
                                </div>
                                <!--//section-block-->
                                <div id="notulen" class="section-block">
                                    <h3 class="block-title">Tampilan Halaman Upload Notulen Rapat</h3>
                                    Sama Halnya dengan Proses Mengunduh File Undangan Rapat, pada proses <strong>Unduhan File Notulen Rapat</strong> ini dapat dilakukan dengan cara yang sama yaitu
                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/024.png'); ?>" /></div>

                                    kemudian akan tampil PopUp seperti dibawah ini
                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/025.png'); ?>" /></div>

                                    Langkah berikutnya adalah dengan <strong>mengunggah File Notulen Rapat</strong> seperti dibawah ini.
                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/026.png'); ?>" /></div>

                                    <p class="garis"></p>
                                    Jika <strong>File Notulen Rapat</strong> yang anda unggah tadi berhasil maka tombol yang tadinya masih berwarna merah akan berwarna Hijau.
                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/027.png'); ?>" /></div>
                                </div>
                                <!--//section-block-->
                                <div id="notulenDownload" class="section-block">
                                    <div class="code-block">
                                        <h3 class="block-title">Tampilan Halaman Download Notulen Rapat</h3>
                                        Setelah berhasil mengunggah File Notulen kemudian anda berniat ingin <strong>Mengunduh</strong> File tersebut, maka yang harus dilakukan adalah dengan mengKlik tombol File undangan yang sudah berwarna hijau.
                                        <div><img class="img-responsive" src="<?= base_url('assets/img/docs/028.png'); ?>" /></div>
                                    </div>
                                </div>

                                <div id="kelolaAbsen" class="section-block">
                                    <h3 class="block-title">Tampilan Halaman Pengelolaan Absensi Rapat</h3>
                                    Untuk halaman <strong>Pengelolaan Absensi Rapat</strong> agak sedikit berbeda dengan Halaman Unggahan Sebelumnya dikarenakan untuk <strong>Absensi Rapat</strong> ini akan dilakukan dengan 2 cara yaitu :
                                    <div id="zohoForm" class="section-block">
                                        <ul>
                                            <li>
                                                <strong>1. Membuat Absensi Rapat Menggunakan <span class="text-danger">ZOHO FORM BUILDER API</span></strong>
                                                <br />
                                                Jika anda lebih familiar dalam membuat <strong><span class="text-danger">FORM ABSENSI RAPAT</span></strong> Menggunakan aplikasi <strong><span class="text-danger">ZOHO FORM</span></strong>, berikut ini adalah panduan penggunaannya.
                                                <br /><br />
                                                <strong>- Langkah Pertama :</strong> <br />
                                                Silahkan Pilih Menu <strong><span class="text-danger">ZOHO API</span></strong> yang terdapat pada aplikasi <strong><span class="text-danger">E-RAPAT</span></strong> berikut ini.
                                                <div>
                                                    <img class="img-responsive" src="<?= base_url('assets/img/docs/035.png'); ?>" />
                                                </div>
                                                <br />
                                                <strong>- Langkah Kedua :</strong> <br />
                                                Pastikan anda telah memiliki Akun pada aplikasi <strong><span class="text-danger">ZOHO FORM</span></strong> jika <strong><span class="text-danger">IYA</span></strong> <br />
                                                <strong><span class="text-danger"> SILAHKAN LOGIN MENGGUNAKAN USERNAME &amp; PASSWORD ANDA</span></strong>.
                                                <div><img class="img-responsive" src="<?= base_url('assets/img/docs/036.png'); ?>" /></div>
                                                <br />
                                                <strong>- Langkah Ketiga :</strong> <br />

                                                <strong><span class="text-danger">MASUKAN KODE VERIFIKASI (JIKA ADA/DIMINTA)</span></strong>.
                                                <div><img class="img-responsive" src="<?= base_url('assets/img/docs/037.png'); ?>" /></div>
                                                <br />
                                                <strong>- Langkah Keempat :</strong> <br />

                                                <strong><span class="text-danger">MASUKAN JUGA OTP (JIKA ADA/DIMINTA)</span></strong>.
                                                <div><img class="img-responsive" src="<?= base_url('assets/img/docs/038.png'); ?>" /></div>
                                                <br />
                                                <strong>- Langkah Kelima :</strong> <br />

                                                <strong><span class="text-danger">KLIK TRUST</span></strong>.
                                                <div><img class="img-responsive" src="<?= base_url('assets/img/docs/039.png'); ?>" /></div>
                                                <br />
                                                <strong>- Langkah Keenam :</strong> <br />

                                                <strong><span class="text-danger">Silahkan Tunggu Beberapa saat ...</span></strong>.
                                                <div><img class="img-responsive" src="<?= base_url('assets/img/docs/040.png'); ?>" /></div>
                                                <br />
                                                Jika <strong><span class="text-primary">BERHASIL</span></strong> maka akan muncul halaman Berikut ini.
                                                <div><img class="img-responsive" src="<?= base_url('assets/img/docs/041.png'); ?>" /></div>
                                                <div id="zohoFormmng" class="section-block">
                                                    <h3 class="block-title">Tampilan Halaman Pengelolaan Zoho Form</h3>
                                                    Untuk mengelola <strong>Zoho Form Absensi</strong> Menggunakan Aplikasi <strong>e-rapat</strong>, maka ikutilah langkah - langkah dibawah ini.
                                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/042.png'); ?>" /></div>
                                                    <br />
                                                    Gambar dibawah ini adalah <strong>Tabel Form Absensi</strong> yang telah dibuat Menggunakan <strong>Zoho Form</strong>
                                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/043.png'); ?>" /></div>
                                                </div>
                                                <div id="zohosubmissions" class="section-block">
                                                    <h3 class="block-title">Tampilan Halaman Pengelolaan Form Submissions</h3>
                                                    Untuk mengelola <strong>Zoho Form Submissions</strong> Menggunakan Aplikasi <strong>e-rapat</strong>, maka ikutilah langkah - langkah dibawah ini.
                                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/044.png'); ?>" /></div>
                                                    <br />
                                                    Gambar dibawah ini adalah <strong>Tabel Form Submissions</strong> yang telah dibuat Menggunakan <strong>Zoho Form</strong>
                                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/045.png'); ?>" /></div>
                                                    <br />
                                                    Gambar dibawah ini adalah <strong>Detail Form Submissions</strong> yang telah dibuat Menggunakan <strong>Zoho Form</strong>
                                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/046.png'); ?>" /></div>
                                                </div>
                                                <div id="zohoreports" class="section-block">
                                                    <h3 class="block-title">Tampilan Halaman Pengelolaan Form Reports</h3>
                                                    Untuk mengelola <strong>Zoho Form Reports</strong> Menggunakan Aplikasi <strong>e-rapat</strong>, maka ikutilah langkah - langkah dibawah ini.
                                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/047.png'); ?>" /></div>
                                                    <br />
                                                    <strong><span class="text-danger">Buat Report Baru</span></strong>.
                                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/048.png'); ?>" /></div>
                                                    <br />
                                                    <strong><span class="text-danger">Ikuti Langkah-langkah seperti pada Gambar dibawah ini</span></strong>.
                                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/049.png'); ?>" /></div>
                                                    <br />
                                                    <strong><span class="text-danger">Kemudian akan tampil seperti pada Gambar dibawah ini</span></strong>.
                                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/050.png'); ?>" /></div>
                                                </div>
                                                <div id="zohoUpload" class="section-block">
                                                    <h3 class="block-title">Tampilan Halaman Upload Zoho Form</h3>
                                                    Cara Pertama adalah <strong>mengunggah</strong> secara langsung File-file <i>(.pdf/excel)</i> Hasil dari <strong>Zoho Apps</strong>
                                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/029.png'); ?>" /></div>
                                                    <br />
                                                    <strong><span class="text-danger">Silahkan Klik Tombol <strong>Absensi Rapat</strong> diatas maka akan tampil halaman berikut.</strong>
                                                    <br />
                                                    <p class="garis"></p>
                                                    <br />
                                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/030.png'); ?>" /></div>
                                                    <br />
                                                    <strong><span class="text-danger">Selanjutnya ikuti langkah-langkah seperti pada gambar diatas maka akan muncul Tampilan Form seperti dibawah ini</strong>
                                                    <br />
                                                    <p class="garis"></p>
                                                    <br />
                                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/031.png'); ?>" /></div>
                                                    <br />
                                                    <strong><span class="text-danger">kemudian Pilih <strong>BROWSE</strong> -> <strong>PILIH FILE ABSEN</strong> -> <strong>OPEN</strong></strong>
                                                    <br />
                                                    <p class="garis"></p>
                                                    <br />
                                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/032.png'); ?>" /></div>
                                                    <br />
                                                    <strong><span class="text-danger">langkah selanjutnya adalah <strong>JANGAN LUPA</strong> Untuk <strong>CENTANG CHECK BOX</strong> Agar ID Zoom Meeting anda di closed sehingga Status ID Zoom tersebut Menjadi <strong>AVAILABLE</strong></strong>
                                                    <br />
                                                    <p class="garis"></p>
                                                    <br />
                                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/033.png'); ?>" /></div>
                                                    <br />
                                                    <strong><span class="text-danger">Jika berhasil makan akan muncul tampilan seperti dibawah ini</strong>
                                                    <br />
                                                    <p class="garis"></p>
                                                    <br />
                                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/034.png'); ?>" /></div>
                                                    <br />
                                                </div>
                                                <div id="downloadabsen" class="section-block">
                                                    <h3 class="block-title">Tampilan Halaman Download Absensi Rapat</h3>
                                                    Setelah berhasil mengunggah File <strong>Absensi Rapat</strong> kemudian anda berniat ingin <strong>Mengunduh</strong> File tersebut, maka yang harus dilakukan adalah dengan mengKlik tombol File undangan yang sudah berwarna hijau.
                                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/028.png'); ?>" /></div>
                                                </div>



                                            </li>
                                            <li>
                                                <div id="erapatForm" class="section-block">
                                                    <strong>2. Membuat Absensi Rapat Menggunakan <span class="text-danger">E-RAPAT FORM BUILDER</span></strong>
                                                    <br />
                                                    Jika anda Memilih untuk membuat <strong><span class="text-danger">FORM ABSENSI RAPAT</span></strong> Menggunakan <strong><span class="text-danger">E-RAPAT FORM BUILDER</span></strong>, Maka berikut ini adalah panduan penggunaannya.
                                                    <br />
                                                    <strong>- Langkah Pertama :</strong> <br />
                                                    <div>
                                                        <img class="img-responsive" src="<?= base_url('assets/img/docs/052.png'); ?>" />
                                                    </div>
                                                    <br />
                                                    <strong>- Langkah Kedua :</strong> <br />
                                                    <div>
                                                        Setelah <strong>e-rapat form builder</strong> tampil dilayar, silahkan mendesain form rapat sesuai dengan kebutuhan anda. Setelah itu klik tombol <strong>Save Form</strong>
                                                        <img class="img-responsive" src="<?= base_url('assets/img/docs/053.png'); ?>" />
                                                    </div>
                                                    <br />
                                                    <strong>- Langkah Ketiga :</strong> <br />
                                                    <div>
                                                        Kemudian pilih <strong>Let's go to Form Settings</strong>
                                                        <img class="img-responsive" src="<?= base_url('assets/img/docs/054.png'); ?>" />
                                                    </div>
                                                    <br />
                                                    <strong>- Langkah Keempat :</strong> <br />
                                                    <div>
                                                        Maka akan tampil seperti gambar dibawah ini. silahkan lakukan konfigurasi sesuai kebutuhan anda dan jika sudah selesai jangan lupa menekan tombol <strong>Save &amp; Continue</strong>
                                                        <img class="img-responsive" src="<?= base_url('assets/img/docs/055.png'); ?>" />
                                                    </div>
                                                    <br />
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div id="erapatFormpublish" class="section-block">
                                        <h3 class="block-title">Tampilan Halaman Publish Rapat Form</h3>
                                        Untuk Mempublish <strong>Absensi Rapat</strong> yang sudah anda design menggunakan <strong>e-rapat Form Builder</strong> bisa dilakukan dengan cara sebagai berikut :
                                        <br />
                                        <strong>- Langkah Pertama :</strong> <br />
                                        <div>
                                            <img class="img-responsive" src="<?= base_url('assets/img/docs/056.png'); ?>" />
                                        </div>
                                        <br />
                                        <strong>- Langkah Kedua :</strong> <br />
                                        silahkan diikuti sesuai dengan gambar dibawah ini<br />
                                        <div>
                                            <img class="img-responsive" src="<?= base_url('assets/img/docs/057.png'); ?>" />
                                        </div>
                                        <br />
                                        <strong>- Langkah Ketiga :</strong> <br />
                                        Form inilah nanti yang akan di share ke setiap peserta Rapat<br />
                                        <div>
                                            <img class="img-responsive" src="<?= base_url('assets/img/docs/058.png'); ?>" />
                                        </div>
                                        <br />
                                    </div>
                                    <div id="halRiwayat" class="section-block">
                                        <h3 class="block-title">Tampilan Halaman Riwayat Rapat</h3>
                                        Untuk Melihat <strong>Riwayat Rapat</strong> pada aplikasi <strong>e-rapat</strong> maka hal tersebut bisa dilakukan dengan cara sebagai berikut :
                                        <br />
                                        <strong>- Langkah Pertama :</strong> <br />
                                        <div>
                                            <img class="img-responsive" src="<?= base_url('assets/img/docs/059.png'); ?>" />
                                        </div>
                                        <br />
                                        <strong>- Langkah Kedua :</strong> <br />
                                        silahkan <strong>Pilih Tanggal Awal</strong> sesuai dengan gambar dibawah ini<br />
                                        <div>
                                            <img class="img-responsive" src="<?= base_url('assets/img/docs/060.png'); ?>" />
                                        </div>
                                        <br />
                                        <strong>- Langkah Ketiga :</strong> <br />
                                        silahkan <strong>Pilih Tanggal Akhir</strong> kemudian Klik tombol <strong>Cari Data Rapat</strong> sesuai dengan gambar dibawah ini<br />
                                        <div>
                                            <img class="img-responsive" src="<?= base_url('assets/img/docs/061.png'); ?>" />
                                        </div>
                                    </div>
                                    <div id="detailRiwayat" class="section-block">
                                        <h3 class="block-title">Tampilan Halaman Detail Rapat</h3>
                                        Untuk Melihat <strong>Detail Rapat</strong> pada aplikasi <strong>e-rapat</strong> maka hal tersebut bisa dilakukan dengan cara sebagai berikut :
                                        <br />
                                        <strong>- Langkah Pertama :</strong> <br />
                                        <div>
                                            <img class="img-responsive" src="<?= base_url('assets/img/docs/062.png'); ?>" />
                                        </div>
                                        <br />
                                        <strong>- Langkah Kedua :</strong> <br />
                                        Kemudian akan tampil sesuai dengan gambar dibawah ini<br />
                                        <div>
                                            <img class="img-responsive" src="<?= base_url('assets/img/docs/063.png'); ?>" />
                                        </div>
                                    </div>
                                </div>
                                <!--//section-block-->
                            </section>
                            <section id="callouts-section" class="doc-section">
                                <h2 class="section-title">Fitur Tambahan</h2>
                                <div id="other" class="section-block">
                                    <h3 class="block-title">Tampilan Pembaharuan Rapat</h3>
                                    <div><img class="img-responsive" src="<?= base_url('assets/img/docs/064.png'); ?>" /></div>
                                </div>
                                <br />
                                <p class="garis"></p>
                                <div id="cekZoom" class="section-block">
                                    <h3 class="block-title">Tampilan Cek Zoom ID</h3>
                                    <div>
                                        <img class="img-responsive" src="<?= base_url('assets/img/docs/065.png'); ?>" />
                                    </div>
                                </div>
                                <br />
                                <p class="garis"></p>
                                <div id="offline" class="section-block">
                                    <h3 class="block-title">Cek Rapat Offline</h3>
                                    <div>
                                        <img class="img-responsive" src="<?= base_url('assets/img/docs/066.png'); ?>" />
                                    </div>
                                </div>
                                <br />
                                <p class="garis"></p>
                                <div id="profil" class="section-block">
                                    <h3 class="block-title">Edit Profil</h3>
                                    Untuk mengganti<strong>Foto Profil</strong> pada aplikasi <strong>e-rapat</strong> maka hal tersebut bisa dilakukan dengan cara sebagai berikut :
                                    <br />
                                    <strong>- Langkah Pertama :</strong> <br />
                                    <div>
                                        <img class="img-responsive" src="<?= base_url('assets/img/docs/067.png'); ?>" />
                                    </div>
                                    <br />
                                    <strong>- Langkah Kedua :</strong> <br />
                                    Kemudian akan tampil sesuai dengan gambar dibawah ini<br />
                                    <div>
                                        <img class="img-responsive" src="<?= base_url('assets/img/docs/068.png'); ?>" />
                                    </div>
                                </div>
                                <br />
                                <p class="garis"></p>
                                <div id="password" class="section-block">
                                    <h3 class="block-title">Ganti Password</h3>
                                    Untuk mengganti<strong>Password</strong> pada aplikasi <strong>e-rapat</strong> maka hal tersebut bisa dilakukan dengan cara sebagai berikut :
                                    <br />
                                    <div>
                                        <img class="img-responsive" src="<?= base_url('assets/img/docs/069.png'); ?>" />
                                    </div>
                                </div>
                            </section>
                            <section id="admin-section" class="doc-section">
                                <h2 class="section-title">Fitur Administrator</h2>
                                <div id="masterAkun" class="section-block">
                                    <br /><br />
                                    <h3 class="block-title">Tampilan Master Data Akun</h3>
                                    Gambar dibawah ini adalah Tampilan dari <strong>Master Data Akun</strong>
                                    <div>
                                        <img class="img-responsive" src="<?= base_url('assets/img/docs/070.png'); ?>" />
                                    </div>
                                    <br /><br />
                                    <strong>- Menambah Data User</strong> <br />
                                    <div>
                                        <img class="img-responsive" src="<?= base_url('assets/img/docs/071.png'); ?>" />
                                    </div>
                                    <br /><br />
                                    <strong>- Ubah Data User</strong> <br />
                                    <div>
                                        <img class="img-responsive" src="<?= base_url('assets/img/docs/072.png'); ?>" />
                                    </div>
                                </div>
                                <br />
                                <div id="hakAkses" class="section-block">
                                    <br /><br />
                                    <h3 class="block-title">Pengaturan Hak Akses</h3>
                                    Gambar dibawah ini adalah Tampilan dari <strong>Pengaturan Hak Akses</strong>
                                    <br />
                                    <strong>- Memberikan hak Akses</strong> <br />
                                    <div>
                                        <img class="img-responsive" src="<?= base_url('assets/img/docs/073.png'); ?>" />
                                    </div>
                                    <br />
                                    <strong>- Pilih Menu yang akan diberikan Hak Aksesnya</strong> <br />
                                    <div>
                                        <img class="img-responsive" src="<?= base_url('assets/img/docs/074.png'); ?>" />
                                    </div>
                                </div>
                                <br />
                                <p class="garis"></p>
                                <div id="masterSekretariat" class="section-block">
                                    <br /><br />
                                    <h3 class="block-title">Tampilan Master Data Sekretariat</h3>
                                    Gambar dibawah ini adalah Tampilan dari <strong>Master Data Sekretariat</strong>
                                    <div>
                                        <img class="img-responsive" src="<?= base_url('assets/img/docs/075.png'); ?>" />
                                    </div>
                                    <br /><br />
                                    <strong>- Menambah Data Sekretariat</strong> <br />
                                    <div>
                                        <img class="img-responsive" src="<?= base_url('assets/img/docs/076.png'); ?>" />
                                    </div>
                                    <br /><br />
                                    <strong>- Ubah Data Sekretariat</strong> <br />
                                    <div>
                                        <img class="img-responsive" src="<?= base_url('assets/img/docs/077.png'); ?>" />
                                    </div>
                                </div>
                                <br />
                                <p class="garis"></p>
                                <div id="masterBagian" class="section-block">
                                    <br /><br />
                                    <h3 class="block-title">Tampilan Master Data Bagian</h3>
                                    Gambar dibawah ini adalah Tampilan dari <strong>Master Data Bagian</strong>
                                    <div>
                                        <img class="img-responsive" src="<?= base_url('assets/img/docs/078.png'); ?>" />
                                    </div>
                                    <br /><br />
                                    <strong>- Menambah Data Bagian</strong> <br />
                                    <div>
                                        <img class="img-responsive" src="<?= base_url('assets/img/docs/079.png'); ?>" />
                                    </div>
                                    <br /><br />
                                    <strong>- Ubah Data Bagian</strong> <br />
                                    <div>
                                        <img class="img-responsive" src="<?= base_url('assets/img/docs/080.png'); ?>" />
                                    </div>
                                </div>
                                <br />
                                <p class="garis"></p>
                                <div id="masterMedia" class="section-block">
                                    <br /><br />
                                    <h3 class="block-title">Tampilan Master Data Media</h3>
                                    Gambar dibawah ini adalah Tampilan dari <strong>Master Data Media</strong>
                                    <div>
                                        <img class="img-responsive" src="<?= base_url('assets/img/docs/081.png'); ?>" />
                                    </div>
                                    <br /><br />
                                    <strong>- Menambah Data Media</strong> <br />
                                    <div>
                                        <img class="img-responsive" src="<?= base_url('assets/img/docs/082.png'); ?>" />
                                    </div>
                                    <br /><br />
                                    <strong>- Ubah Data Media</strong> <br />
                                    <div>
                                        <img class="img-responsive" src="<?= base_url('assets/img/docs/083.png'); ?>" />
                                    </div>
                                </div>
                                <br />
                                <p class="garis"></p>
                                <div id="masterSubMedia" class="section-block">
                                    <br /><br />
                                    <h3 class="block-title">Tampilan Master Data Sub-Media</h3>
                                    Gambar dibawah ini adalah Tampilan dari <strong>Master Data Sub-Media</strong>
                                    <div>
                                        <img class="img-responsive" src="<?= base_url('assets/img/docs/084.png'); ?>" />
                                    </div>
                                    <br /><br />
                                    <strong>- Menambah Data Sub-Media</strong> <br />
                                    <div>
                                        <img class="img-responsive" src="<?= base_url('assets/img/docs/085.png'); ?>" />
                                    </div>
                                    <br /><br />
                                    <strong>- Ubah Data Sub-Media</strong> <br />
                                    <div>
                                        <img class="img-responsive" src="<?= base_url('assets/img/docs/086.png'); ?>" />
                                    </div>
                                </div>
                            </section>
                        </div>
                        <!--//content-inner-->
                    </div>
                    <!--//doc-content-->
                    <div class="doc-sidebar col-md-3 col-12 order-0 d-none d-md-flex">
                        <div id="doc-nav" class="doc-nav">
                            <nav id="doc-menu" class="nav doc-menu flex-column sticky">
                                <a class="nav-link scrollto" href="#download-section"><i class="fas fa-fw fa-angle-right"></i> Memulai Aplikasi <strong>e-rapat</strong></a>
                                <a class="nav-link scrollto" href="#installation-section"><i class="fas fa-fw fa-angle-right"></i> <strong>Tampilan Antarmuka e-rapat</strong></a>
                                <nav class="doc-sub-menu nav flex-column">
                                    <a class="nav-link scrollto" href="#step1"><i class="fas fa-fw fa-angle-right"></i> Pengaturan Tampilan kalender</a>
                                    <a class="nav-link scrollto" href="#step2"><i class="fas fa-fw fa-angle-right"></i> Filter Kalender</a>
                                    <a class="nav-link scrollto" href="#step3"><i class="fas fa-fw fa-angle-right"></i> Preview Kalendar</a>
                                </nav>
                                <a class="nav-link scrollto" href="#code-section"><i class="fas fa-fw fa-angle-right"></i> <strong>Tampilan Admin Cpanel</strong></a>
                                <nav class="doc-sub-menu nav flex-column">
                                    <a class="nav-link scrollto" href="#html"><i class="fas fa-fw fa-angle-right"></i> Tampilan Halaman Login</a>
                                    <a class="nav-link scrollto" href="#css"><i class="fas fa-fw fa-angle-right"></i> Tampilan Halaman Profil</a>
                                    <a class="nav-link scrollto" href="#sass"><i class="fas fa-fw fa-angle-right"></i> Master Data Rapat</a>
                                    <a class="nav-link scrollto" href="#less"><i class="fas fa-fw fa-angle-right"></i> Upload Undangan Rapat</a>
                                    <a class="nav-link scrollto" href="#javascript"><i class="fas fa-fw fa-angle-right"></i> Download Undangan Rapat</a>
                                    <a class="nav-link scrollto" href="#notulen"><i class="fas fa-fw fa-angle-right"></i> Upload Notulen Rapat</a>
                                    <a class="nav-link scrollto" href="#notulenDownload"><i class="fas fa-fw fa-angle-right"></i> Download Notulen Rapat</a>
                                    <a class="nav-link scrollto" href="#kelolaAbsen"><i class="fas fa-fw fa-angle-right"></i> Pengelolaan Absensi Rapat</a>
                                    <a class="nav-link scrollto" href="#zohoForm"><i class="fas fa-fw fa-angle-right"></i> Zoho Form Builder</a>
                                    <a class="nav-link scrollto" href="#zohoFormmng"><i class="fas fa-fw fa-angle-right"></i> Pengelolaan Zoho Form</a>
                                    <a class="nav-link scrollto" href="#zohosubmissions"><i class="fas fa-fw fa-angle-right"></i> Pengelolaan Form Submissions</a>
                                    <a class="nav-link scrollto" href="#zohoreports"><i class="fas fa-fw fa-angle-right"></i> Pengelolaan Form Reports</a>
                                    <a class="nav-link scrollto" href="#zohoUpload"><i class="fas fa-fw fa-angle-right"></i> Upload File Zoho Form</a>
                                    <a class="nav-link scrollto" href="#erapatForm"><i class="fas fa-fw fa-angle-right"></i> E-rapat Form Builder</a>
                                    <a class="nav-link scrollto" href="#erapatFormpublish"><i class="fas fa-fw fa-angle-right"></i> Publish E-rapat Form</a>
                                    <a class="nav-link scrollto" href="#downloadabsen"><i class="fas fa-fw fa-angle-right"></i> Download Absensi Rapat</a>
                                    <a class="nav-link scrollto" href="#halRiwayat"><i class="fas fa-fw fa-angle-right"></i> Tampilan Riwayat Rapat</a>
                                    <a class="nav-link scrollto" href="#detailRiwayat"><i class="fas fa-fw fa-angle-right"></i> Tampilan Detail Rapat</a>
                                </nav>
                                <a class="nav-link scrollto" href="#callouts-section"><i class="fas fa-fw fa-angle-right"></i> <strong>Fitur Tambahan</strong></a>
                                <nav class="doc-sub-menu nav flex-column">
                                    <a class="nav-link scrollto" href="#other"><i class="fas fa-fw fa-angle-right"></i> Pembaharuan Rapat</a>
                                    <a class="nav-link scrollto" href="#cekZoom"><i class="fas fa-fw fa-angle-right"></i> Cek Zoom ID</a>
                                    <a class="nav-link scrollto" href="#offline"><i class="fas fa-fw fa-angle-right"></i> Cek Rapat Offline</a>
                                    <a class="nav-link scrollto" href="#profil"><i class="fas fa-fw fa-angle-right"></i> Ubah Profil</a>
                                    <a class="nav-link scrollto" href="#password"><i class="fas fa-fw fa-angle-right"></i> Ganti Password</a>
                                </nav>
                                <a class="nav-link scrollto" href="#admin-section"><i class="fas fa-fw fa-angle-right"></i> <strong>Fitur Administrator</strong></a>
                                <nav class="doc-sub-menu nav flex-column">
                                    <a class="nav-link scrollto" href="#masterAkun"><i class="fas fa-fw fa-angle-right"></i> Master Data Akun</a>
                                    <a class="nav-link scrollto" href="#hakAkses"><i class="fas fa-fw fa-angle-right"></i> Pengaturan Hak Akses</a>
                                    <a class="nav-link scrollto" href="#masterSekretariat"><i class="fas fa-fw fa-angle-right"></i> Master Data Sekretariat</a>
                                    <a class="nav-link scrollto" href="#masterBagian"><i class="fas fa-fw fa-angle-right"></i> Master Data Bagian</a>
                                    <a class="nav-link scrollto" href="#masterMedia"><i class="fas fa-fw fa-angle-right"></i> Master Data Media</a>
                                    <a class="nav-link scrollto" href="#masterSubMedia"><i class="fas fa-fw fa-angle-right"></i> Master Data Sub-Media</a>
                                </nav>

                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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