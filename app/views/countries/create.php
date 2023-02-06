<?php require APPROOT . '/views/includes/head.php'; ?>
<?= $data['title']; ?>

<form action="<?= URLROOT; ?>/countries/create" method="post">
  <table>
    <tbody>
      <tr>
        <td>
          <label for="name">Naam van het land</label>
          <input type="text" name="name" id="name">
        </td>
      </tr>
      <tr>
        <td>
          <label for="capitalCity">Naam van de hoofdstad</label>
          <input type="text" name="capitalCity" id="capitalCity">
        </td>
      </tr>
      <tr>
        <td>
          <label for="continent">Naam van het continent</label>
         <input type="text" name="continent" id="continent">
        </td>
      </tr>
      <tr>
        <td>
          <label for="population">Aantal inwoners</label>
         <input type="number" name="population" id="population">
        </td>
      </tr>
      <tr>
        <td>
          <input type="submit" value="Verzenden">
        </td>
      </tr>
    </tbody>
  </table>

</form>
<?php require APPROOT . '/views/includes/footer.php'; ?>