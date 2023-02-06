<?php
class Tests extends Controller {

  public function index() {
    $data = [
      'title' => "Homepage"
    ];
    $this->view('Tests/index', $data);
  }
}