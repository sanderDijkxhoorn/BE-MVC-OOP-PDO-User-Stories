<?= $data['title']; ?>

<form action="<?= URLROOT; ?>/countries/update" method="post">
  <table>
    <tbody>
      <tr>
        <td>
          <input type="text" name="name" id="name" value="<?= $data["row"]->name; ?>">
        </td>
      </tr>
      <tr>
        <td>
          <input type="text" name="capitalCity" id="capitalCity" value="<?= $data["row"]->capitalCity; ?>">
        </td>
      </tr>
      <tr>
        <td>
         <input type="text" name="continent" id="continent" value="<?= $data["row"]->continent; ?>">
        </td>
      </tr>
      <tr>
        <td>
         <input type="number" name="population" id="name" value="<?= $data["row"]->population; ?>">
        </td>
      </tr>
      <tr>
        <td>
          <input type="hidden" name="id" value="<?= $data["row"]->id; ?>">
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