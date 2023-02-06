<?php
class Instructeur extends Controller {
  // Properties, field
  private $instructeurModel;

  // Dit is de constructor
  public function __construct() {
    $this->instructeurModel = $this->model('InstructeurModel');
  }

  public function index() {
    /**
     * Haal alle instructeurs op uit de model
     */
    $instructeurs = $this->instructeurModel->getInstructeurs();

    /**
     * Maak tabelrijen van de opgehaalde data over de instructeurs
     */
    $rows = '';
    foreach ($instructeurs as $value){
      $rows .= "<tr>
                  <td>$value->Voornaam</td>
                  <td>$value->Tussenvoegsel</td>
                  <td>$value->Achternaam</td>
                  <td>$value->Mobiel</td>
                  <td>$value->DatumInDienst</td>
                  <td>$value->AantalSterren</td>
                  <td><a href='" . URLROOT . "/instructeur/gebruiktevoertuigen/$value->Id'><i class='bi bi-car-front-fill'></i></a></td>
                </tr>";
    }
    
    /**
     * Stuur de informatie door naar de view
     */
    $data = [
      'title' => 'Instructeurs in dienst',
      'amountOfInstructeurs' => sizeof($instructeurs),
      'rows' => $rows
    ];
    $this->view('/instructeur/index', $data);
  }

  public function gebruikteVoertuigen($Id) 
  {
    $instructeur = $this->instructeurModel->getInstructeurById($Id);

    $gebruikteVoertuigen = $this->instructeurModel->getGebruikteVoertuigen($Id);

    if (sizeOf($gebruikteVoertuigen) == 0 ) {
        $rows = "<tr><td colspan='6'>Er zijn op dit moment nog geen voertuigen toegewezen aan deze instructeur</td></tr>";
        header('Refresh:3; url=' . URLROOT . '/instructeur/index');
    } else {
        $rows = '';
        foreach ($gebruikteVoertuigen as $value){
        $rows .= "<tr>
                    <td>$value->TypeVoertuig</td>
                    <td>$value->Type</td>
                    <td>$value->Kenteken</td>
                    <td>$value->Bouwjaar</td>
                    <td>$value->Brandstof</td>
                    <td>$value->Rijbewijscategorie</td>
                  </tr>";
        }
    }
    

    $data = [
        'title' => 'Door Instructeur gebruikte voertuigen',
        'voornaam' => $instructeur->Voornaam,
        'tussenvoegsel' => $instructeur->Tussenvoegsel,
        'achternaam' => $instructeur->Achternaam,
        'datumInDienst' => $instructeur->DatumInDienst,
        'aantalSterren' => $instructeur->AantalSterren,
        'rows' =>$rows
    ];

    $this->view('/instructeur/gebruikteVoertuigen', $data);
  }
}