<?php

  /* La fonction ci dessous récupère des données d'une BD en la parcourant et rend une vue. C'est alors une fonction linéaire de compléxité O(n)
    "La complexité de cet algorithme est dite linéaire. Ce sera le cas de tous les algorithmes avec T(n)an+b où a et b sont des réels." http://www.monlyceenumerique.fr/nsi_premiere/algo_a/a2_complexite.php
    */

class Controller_login extends Controller
{
    public function action_login()
    {

        // On récupère le modèle
        $m = Model::getModel();
        $data = [
            "compte" => $m->getLog(),
        ];
        $this->render("login", $data);
    }

    public function action_default()
    {
        $this->action_login();
    }
}
