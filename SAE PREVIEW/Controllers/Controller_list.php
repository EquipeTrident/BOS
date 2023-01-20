<?php
class Controller_list extends Controller
{
    /* Les fonctions ci dessous récupèrent des données d'une BD en la parcourant . C'est alors une fonction linéaire de compléxité O(n)
    "La complexité de cet algorithme est dite linéaire. Ce sera le cas de tous les algorithmes avec T(n)an+b où a et b sont des réels." http://www.monlyceenumerique.fr/nsi_premiere/algo_a/a2_complexite.php
    */
    public function action_last()
    {
        $m = Model::getModel();
        $data = [
            "liste" => $m->getLast(),
        ];
        $this->render("last", $data);
    }

    public function action_porthos()
    {
        $m = Model::getModel();
        $data = [
            "liste" => $m->getPorthos(),
        ];
        $this->render("porthos", $data);
    }
    public function action_athos()
    {
        $m = Model::getModel();
        $data = [
            "liste" => $m->getAthos(),
        ];
        $this->render("athos", $data);
    }
    public function action_aramis()
    {
        $m = Model::getModel();
        $data = [
            "liste" => $m->getAramis(),
        ];
        $this->render("aramis", $data);
    }


    public function action_default()
    {
        $this->action_last();
    }
    
    /*La fonction en question crée un petit tableau pour vérifier l'existence d'un paramètre dans l'URL ou pour afficher un message d'erreur. Aucune boucle n'est parcouru donc la compléxité de cette fonction sera constante et de type O(1)
    * "La coût de cet algorithme est dite constant. Ce sera le cas de tous les algorithmes avec T(n)=a où a est un réel" : http://www.monlyceenumerique.fr/nsi_premiere/algo_a/a2_complexite.php
    */

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

    /*La fonction en question crée un petit tableau pour vérifier l'existence d'un paramètre dans l'URL ou pour afficher un message d'erreur. Aucune boucle n'est parcouru donc la compléxité de cette fonction sera constante et de type O(1)
    * "La coût de cet algorithme est dite constant. Ce sera le cas de tous les algorithmes avec T(n)=a où a est un réel" : http://www.monlyceenumerique.fr/nsi_premiere/algo_a/a2_complexite.php
    */

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

     /* La fonction ci dessous récupère des données d'une BD en la parcourant . C'est alors une fonction linéaire de compléxité O(n)
    "La complexité de cet algorithme est dite linéaire. Ce sera le cas de tous les algorithmes avec T(n)an+b où a et b sont des réels." http://www.monlyceenumerique.fr/nsi_premiere/algo_a/a2_complexite.php
    */

    public function action_all()
    {
      $m = Model::getModel();
      $data = [
          "liste" => $m->getAll()
      ];
      $this->render("all", $data);
    }
}
