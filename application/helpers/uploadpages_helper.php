<?php

function uploadpages($a)
{ ?>
    <div class="btn-group">
        <button class="btn btn-danger btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Belum Lengkap!
        </button>
        <div class="dropdown-menu" x-placement="top-start" style="position: absolute; transform: translate3d(0px, -165px, 0px); top: 0px; left: 0px; will-change: transform;">
            <a class="dropdown-item" href="<?= base_url('meeting/uploadpages/' . $a) ?>">Action</a>
            <a class="dropdown-item" href="#">Another action</a>
            <a class="dropdown-item" href="#">Something else here</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Separated link</a>
        </div>
    </div>
<?php  } ?>