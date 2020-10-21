<?php

// Modal Disabled footer
function form_disable_footer()
{ ?>
    <div class="actions">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="batal"><i class="fas fa-power-off fa-sm fa-fw mr-2 text-gray-400"></i> Tutup</button>
    </div>

<?php }

// Modal Enable footer
function form_enable_footer($id)
{ ?>
    <input type="hidden" name="id" value="<?= $id; ?>">
    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="batal">Batal</button>
    <button type="submit" class="btn btn-danger">Confirm!</button>
<?php }
