<?php

class Controller_list extends Controller
{
    public function action_last()
    {
        $m = Model::getModel();
        $data = [
            "liste" => $m->getLast(),
        ];
        $this->render("last", $data);
    }

    public function action_obtenu()
    {
        $m = Model::getModel();
        $data = [
            "liste" => $m->getObtenu(),
        ];
        $this->render("obtenu", $data);
    }

    public function action_default()
    {
        $this->action_last();
    }

    public function action_informations()
    {
        $data = false;

        if (isset($_GET["id"]) and preg_match("/^[1-9]\d*$/", $_GET["id"])) {
            $m = Model::getModel();
            $data = $m->getEtudiantInformations($_GET["id"]);
        }
        //Si on a bien un prix nobel d'identifiant$_GET["id"]
        if ($data !== false) {
            $this->render("informations", $data);
        } else {
            $this->action_error("Erreur id non definie!!!");
        }
    }

    public function action_boslist()
    {
        $data = false;

        if (isset($_GET["id"]) and preg_match("/^[1-9]\d*$/", $_GET["id"])) {
            $m = Model::getModel();
            $data = [ "liste" => $m->getEtudiantbos($_GET["id"])];
        }
        //Si on a bien un prix nobel d'identifiant$_GET["id"]
        if ($data !== false) {
            $this->render("bos", $data);
        } else {
            $this->action_error("pas de BOS!!!");
        }
    }

    public function action_all()
    {
      $m = Model::getModel();
      $data = [
          "liste" => $m->getAll()
      ];
      $this->render("all", $data);
    }
}
