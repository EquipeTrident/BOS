<?php


abstract class Controller
{
    /**
     * Constructeur. Lance l'action correspondante
     * La fonction en question est une condition comparant et ajoutant les différentes actions. Aucune boucle n'est parcouru donc la compléxité de cette fonction sera constante et de type O(1)
     * "La coût de cet algorithme est dite constant. Ce sera le cas de tous les algorithmes avec T(n)=a où a est un réel" : http://www.monlyceenumerique.fr/nsi_premiere/algo_a/a2_complexite.php
     */
    public function __construct()
    {

        //On détermine s'il existe dans l'url un paramètre action correspondant à une action du contrôleur
        if (isset($_GET['action']) and method_exists($this, "action_" . $_GET["action"])) {
            //Si c'est le cas, on appelle cette action
            $action = "action_" . $_GET["action"];
            $this->$action();
        } else {
            //Sinon, on appelle l'action par défaut
            $this->action_default();
        }
    }

    /**
     * Action par défaut du contrôleur (à définir dans les classes filles)
     */
    abstract public function action_default();

    /**
     * Affiche la vue
     * @param string $vue nom de la vue
     * @param array $data tableau contenant les données à passer à la vue
     * @return aucun
     * La fonction parcours un nombre constant de fichier et place les correspondant dans un tableau. La fonction est donc linéaire et sa compléxité est O(N)
     * "La complexité de cet algorithme est dite linéaire. Ce sera le cas de tous les algorithmes avec T(n)an+b où a et b sont des réels." http://www.monlyceenumerique.fr/nsi_premiere/algo_a/a2_complexite.php
     */
    protected function render($vue, $data = [])
    {

        //On extrait les données à afficher
        extract($data);

        //On teste si la vue existe
        $file_name = "Views/view_" . $vue . '.php';
        if (file_exists($file_name)) {
            //Si oui, on l'affiche
            include $file_name;
        } else {
            //Sinon, on affiche la page d'->action_error
            $this->action_error("La vue n'existe pas !");
        }
        // Pour terminer le script
        die();
    }

    /**
     * Méthode affichant une page d'erreur
     * @param string $message Message d'erreur à afficher
     * @return aucun
     * La fonction en question crée un petit tableau pour afficher un message d'erreur. Aucune boucle n'est parcouru donc la compléxité de cette fonction sera constante et de type O(1)
     * "La coût de cet algorithme est dite constant. Ce sera le cas de tous les algorithmes avec T(n)=a où a est un réel" : http://www.monlyceenumerique.fr/nsi_premiere/algo_a/a2_complexite.php
     */
    protected function action_error($message = '')
    {
        $data = [
            'title' => "Error",
            'message' => $message,
        ];
        $this->render("message", $data);
    }
}
