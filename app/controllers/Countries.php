<?php
class Countries extends Controller {
  // Properties, field
  private $countryModel;

  // Dit is de constructor
  public function __construct() {
    $this->countryModel = $this->model('Country');
  }

  public function index() {
    /**
     * Haal via de method getFruits() uit de model Fruit de records op
     * uit de database
     */
    $countries = $this->countryModel->getCountries();

    /**
     * Maak de inhoud voor de tbody in de view
     */
    $rows = '';
    foreach ($countries as $value){
      $rows .= "<tr>
                  <td>$value->id</td>
                  <td>$value->name</td>
                  <td>$value->capitalCity</td>
                  <td>$value->continent</td>
                  <td>" . number_format($value->population, 0, ',', '.') . "</td>
                  <td><a href='" . URLROOT . "/countries/update/$value->id'>update</a></td>
                  <td><a href='" . URLROOT . "/countries/delete/$value->id'>delete</a></td>
                </tr>";
    }


    $data = [
      'title' => '<h1>Landenoverzicht</h1>',
      'countries' => $rows
    ];
    $this->view('countries/index', $data);
  }

  public function update($id = null) {
    // var_dump($id);exit();
    // var_dump($_SERVER);exit();
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
      $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
      $this->countryModel->updateCountry($_POST);
      header("Location:" . URLROOT . "/countries/index");
    } else {
      $row = $this->countryModel->getSingleCountry($id);
      $data = [
        'title' => '<h1>Update landenoverzicht</h1>',
        'row' => $row
      ];
      $this->view("countries/update", $data);
    }
  }

  public function delete($id) {
    $this->countryModel->deleteCountry($id);

    $data =[
      'deleteStatus' => "Het record met id = $id is verwijdert"
    ];
    $this->view("countries/delete", $data);
    header("Refresh:3; url=" . URLROOT . "/countries/index");
  }

  public function create() {
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
      // var_dump($_POST);
      try {
        $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        $this->countryModel->createCountry($_POST);
        header("Location:" . URLROOT . "/countries/index");
      } catch (PDOException $e) {
        echo "Het inserten van het record is niet gelukt";
        header("Refresh:3; url=" . URLROOT . "/countries/index");
      }
    } else {
      $data = [
        'title' => "Voeg een nieuw land in"
      ];

      $this->view("countries/create", $data);
    }
  }

  public function scanCountry() {
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
      $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

      $record = $this->countryModel->getSingleCountryByName($_POST["country"]);

      $rowData = "<tr>
                    <td>$record->id</td>
                    <td>$record->name</td>
                    <td>$record->capitalCity</td>
                    <td>$record->continent</td>
                    <td>$record->population</td>
                  </tr>";

      $data = [
        'title' => 'Dit is het gescande land',
        'rowData' => $rowData
      ];

      $this->view('countries/scanCountry', $data);
    } else {
      $data = [
        'title' => 'Scan het land',
        'rowData' => ""
      ];

      $this->view('countries/scanCountry', $data);
    }
  }
}

?>