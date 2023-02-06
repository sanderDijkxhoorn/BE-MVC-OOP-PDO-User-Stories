<?php require APPROOT . '/views/includes/head.php'; ?>

<h3><?= $data['title']; ?></h3>
<h4>Naam student: <?= $data["student"]; ?></h4>


<table class="table">
    <thead>
        <th>LesNr</th>
        <th>Datum</th>
        <th>tijd</th>
        <th>Instructeur</th>
        <th>Annuleer</th>
    </thead>
    <tbody>
        <?= $data['rows'] ?>
    </tbody>
</table>

<?php require APPROOT . '/views/includes/footer.php'; ?>
