<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">

  <!-- Start of flash messages -->
  <?= $this->session->flashdata('messages'); ?>
  <!-- End of flash messages -->

</div>

<div class="col-lg-10" style="float:none;margin:auto;">

  <div class="form-group row">
    <div class="col-sm-3">
      <label for="name" class="col-form-label float-right">Filter By Department Name</label>
    </div>
    <div class="col-sm-7">
      <select id='subdepartment' class="custom-select custom-select-md mb-3">
        <option value='all'>Semua Bidang Department</option>
        <option value='1'>Bidang Pelaporan dan Evaluasi Puslitbang Transportasi Udara</option>
        <option value='2'>Bagian Keuangan dan Perlengkapan</option>
        <option value='3'>Bidang Pelaporan dan Evaluasi Puslitbang Transportasi Jalan dan Perkertaapian</option>
        <option value='4'>Bagian Kepegawaian</option>
        <option value='5'>Bagian Data Humas dan Publikasi</option>
      </select>
    </div>
  </div>
  <div id="calendar"></div>
</div>

<div id="createEventModal" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span> <span class="sr-only">close</span></button>
        <h4>Add an Event</h4>
      </div>
      <div id="modalBody" class="modal-body">
        <div class="form-group">
          <input class="form-control" type="text" placeholder="Event Name" id="eventName">
        </div>

        <div class="form-group form-inline">
          <div class="input-group date" data-provide="datepicker">
            <input type="text" id="eventDueDate" class="form-control" placeholder="Due Date mm/dd/yyyy">
            <div class="input-group-addon">
              <span class="glyphicon glyphicon-calendar"></span>
            </div>
          </div>
        </div>

        <div class="form-group">
          <textarea class="form-control" type="text" rows="4" placeholder="Event Description" id="eventDescription"></textarea>
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
        <button type="submit" class="btn btn-primary" id="submitButton">Save</button>
      </div>
    </div>
  </div>
</div>




<!-- Start of Modal Add -->
<!-- <div class="modal fade" id="createEventModal" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="createEventModal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <h5 class="my-0 mr-md-auto font-weight-normal"><i class="fas fa-calendar-alt"></i> E-RAPAT</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
                <div class="modal-body">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong>Opps!</strong> You don't have permission to manage calendar.
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
        </div>
    </div>
</div> -->
<!-- End of Modal Add -->