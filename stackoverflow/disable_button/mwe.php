<?php

sleep(1);

session_name('have-a-cookie');
session_start(['cookie_lifetime' => 3600]);

$_SESSION['counter'] = isset($_SESSION['counter']) ? $_SESSION['counter']+1 : 0;

?>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <link rel="stylesheet" href="bootstrap.min.css" type="text/css" />
        <script src="jquery-3.6.1.min.js"></script>
        <script src="bootstrap.bundle.min.js"></script>
        <script>
// this does not work
// https://stackoverflow.com/questions/41693832/disable-a-link-after-click-using-jquery
$(document).ready(function(){
    $('.btn').on('click', function(e) {
        $(this).prop('disabled',true);
    });
});
        </script>
    </head>
    <body>
        <div class="m-3 card text-dark bg-light" style="max-width: 20em;">
            <div class="card-body">
                <h2>Count: <?php echo $_SESSION['counter']; ?></h2>
                <p>The goal is to prevent multiple requests.</p>
                <p>Double-clicking the button should make <b>one</b> request and increment the counter by one.</p>
                <p><a class="btn btn-primary" href="mwe.php">Count!</a></p>
                <p class="mb-0"><a href="https://github.com/lucasreddinger/etc/tree/master/stackoverflow/disable_button">Source code</a></p>
            </div>
        </div>
    </body>
</html>
