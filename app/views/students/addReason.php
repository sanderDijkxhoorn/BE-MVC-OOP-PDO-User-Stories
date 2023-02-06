<?php require APPROOT . '/views/includes/head.php'; ?>
<h3><?= $data['title'] ?></h3>

<form action="<?= URLROOT ?>/students/addReason" method="post">
  <div class="mb-3">
    <label for="InputReason" class="form-label">Reden:</label>
    <input type="text" class="form-control" id="InputReason" name="reason">
    <input type="hidden" name="Id" value="<?= $data['Id']; ?>">
  </div>
  <button type="submit" class="btn btn-primary">Verstuur</button>
</form>


<?php require APPROOT . '/views/includes/footer.php'; ?>