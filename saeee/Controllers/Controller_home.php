<?php

class Controller_home extends Controller
{
    public function action_home()
    {

        // On récupère le modèle
        $m = Model::getModel();
        $data = [
            //On récupère le nombre d'etudiant
            "nb" => $m->getNbEtudiant(),
        ];
        $this->render("home", $data);
    }

    public function action_default()
    {
        $this->action_home();
    }
}
?>
