<?php

class Controller_comment extends Controller
{
    public function action_enrengistrer()
    {

        // On récupère le modèle
        $m = Model::getModel();
        $data = [
            //On récupère le nombre d'etudiant
            "donnee" => $m->getNbEtudiant(),
        ];
        $this->render("comment", $data);
    }

    public function action_default()
    {
        $this->action_home();
    }
}
