<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
<script>
    $(document).ready(function() {
        $("#content").load("http://localhost/rapat/calendar/get_update_calendar");
        setInterval(function() {
            $("#content").load("http://localhost/rapat/calendar/get_update_calendar");
        }, 1000);
    });
</script>
</body>

</html>