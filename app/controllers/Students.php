<?php
/**
 * Hieronder de studentscontroller
 */

class Students extends Controller
{
    // Properties
    private $studentModel;

    // De constructor voor het aanmaken van een modelobject
    public function __construct()
    {
        $this->studentModel = $this->model('Student');
    }

    public function index()
    {
        // De gegevens uit de database worden door de model aangeleverd
        $records = $this->studentModel->getLessons();
        // var_dump($records);
        // Hier maken we de rows voor de tabel in de view
        $rows = '';
        foreach ($records as $item){
            $rows .= "<tr>
                        <td>$item->ID</td>
                        <td>$item->Datum</td>
                        <td>$item->Onderdeel</td>
                        <td><a href='". URLROOT . "/Students/addRemark/{$item->ID}'>toevoegen</a></td>
                      </tr>";
        }

        // Het array $data geeft de rows mee naar de view
        $data = [
            'title' => 'Overzicht lessen',
            'student' => $records[0]->Naam,
            'rows' => $rows
        ];
        $this->view('students/index', $data);
    }

    public function addRemark($Id = null)
    {
        $data = [
            'Id' => $Id,
            'title' => 'Voeg een opmerking toe',
            'remarkError' => ''
        ];    

        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            $data = [
                'title' => 'Voeg een opmerking',
                'remark' => $_POST['remark'],
                'Id' => $_POST['Id'],
                'remarkError' => ''
            ];

            $data = $this->validateAddRemarkForm($data);

            if (empty($data['remarkError'])) {
                $result = $this->studentModel->addRemark($_POST);
                echo '<p >Uw opmerking is verwerkt</p>';
                header('Refresh:3; url=' . URLROOT . '/students/index');
            }
            
        }  
        $this->view('students/addremark', $data);
    }

    public function validateAddRemarkForm($data)
    {
        if ( empty($data['remark'])) {
            $data['remarkError'] = 'U heeft nog geen waarde ingevuld voor de opmerking';
        }

        return $data;
    }

    public function annuleerLes()
    {
        $records = $this->studentModel->getLessonsToCancel();
          var_dump($records);
        $rows = "";
        foreach ($records as $item) {
            $rows .= "<tr>
                        <td>$item->ID</td>
                        <td>" . explode(' ', $item->Datum)[0] . "</td>
                        <td>" . explode(' ', $item->Datum)[1] . "</td>
                        <td>$item->Naam</td>
                        <td><a href='" . URLROOT . "/students/addReason/$item->ID'><i class='bi bi-x-circle'></i></a></td>
                      </tr>";
        }


        $data = [
            'student' => $records[0]->Naam . "test",
            'title' => 'Annuleer Les',
            'rows' => $rows
        ];
        $this->view('students/annuleerLes', $data);
    }

    public function addReason($Id = null)
    {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

            $result = $this->studentModel->removeLesson($_POST);

            header("Location: " . URLROOT . "/students/annuleerLes");

        }
        $data = [
            'title' => 'Geef een reden op',
            'Id' => $Id
        ];
        $this->view('students/addReason', $data);
    }
}


