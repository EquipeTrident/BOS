<?php

class Controller_comment extends Controller
{
    /* Cette fonction récupère des données d'une BD en la parcourant et rend une vue. C'est alors une fonction linéaire de compléxité O(n)
    "La complexité de cet algorithme est dite linéaire. Ce sera le cas de tous les algorithmes avec T(n)an+b où a et b sont des réels." http://www.monlyceenumerique.fr/nsi_premiere/algo_a/a2_complexite.php
    */
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
