<?php
  class Country {
    // Properties, fields
    private $db;
    public $helper;

    public function __construct() {
      $this->db = new Database();
    //   $this->helper = new SqlHelper();
    }

    public function getCountries() {
      $this->db->query("SELECT * FROM `country`;");
      $result = $this->db->resultSet();
      return $result;
    }

    public function getSingleCountry($id) {
      $this->db->query("SELECT * FROM country WHERE id = :id");
      $this->db->bind(':id', $id, PDO::PARAM_INT);
      return $this->db->single();
    }

    public function getSingleCountryByName($name) {
      $this->db->query("SELECT * FROM country WHERE name = :name");
      $this->db->bind(':name', $name, PDO::PARAM_STR);
      return $this->db->single();
    }    

    public function updateCountry($post) {
      try {
        $this->db->dbHandler->beginTransaction();

        $this->db->query("UPDATE country 
                            SET name = :name,
                                capitalCity = :capitalCity,
                                continent = :continent,
                                population = :population
                            WHERE id = :id");

        $this->db->bind(':id', $post["id"], PDO::PARAM_INT);
        $this->db->bind(':name', $post["name"], PDO::PARAM_STR);
        $this->db->bind(':capitalCity', $post["capitalCity"], PDO::PARAM_STR);
        $this->db->bind(':continent', $post["continent"], PDO::PARAM_STR);
        $this->db->bind(':population', $post["population"], PDO::PARAM_INT);

        return $this->db->execute();
      } catch(PDOException $e) {
        echo $e->getMessage() . "Rollback";
        $this->db->dbHandler->rollBack();
      }
    }

    public function deleteCountry($id) {
      $this->db->query("DELETE FROM country WHERE id = :id");
      $this->db->bind("id", $id, PDO::PARAM_INT);
      return $this->db->execute();
    }

    public function createCountry($post) {
      $this->db->query("INSERT INTO country(id, name, capitalCity, continent, population) 
                        VALUES(:id, :name, :capitalCity, :continent, :population)");

      $this->db->bind(':id', NULL, PDO::PARAM_INT);
      $this->db->bind(':name', $post["name"], PDO::PARAM_STR);
      $this->db->bind(':capitalCity', $post["capitalCity"], PDO::PARAM_STR);
      $this->db->bind(':continent', $post["continent"], PDO::PARAM_STR);
      $this->db->bind(':population', $post["population"], PDO::PARAM_INT);

      return $this->db->execute();
    }
  }

?>