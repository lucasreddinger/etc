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
// Solution proposed by Don't Panic
// https://stackoverflow.com/a/74105542/9464666
$( document ).ready(function() {
    $('.btn').on('click', function(e) {
        // [Don't Panic]
        // The default action for a button is to submit - you don't
        // want to do that, so you do need to prevent it
        //
        // [RESPONSE FROM OP]
        // Yes, I do want to do that.
        // Please re-read my question or the text below.
        // It should make one request.
        e.preventDefault();

        // Disable button
        $(this).attr('disabled', 'disabled');

        // Some visual indicator so we can see what is happening
        console.log('click!');
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
                <p><button class="btn btn-primary" href="solution_dont-panic.php">Count!</button></p>
                <p class="mb-0"><a href="https://github.com/lucasreddinger/etc/tree/master/stackoverflow/disable_button">Source code</a></p>
            </div>
        </div>
    </body>
</html>
