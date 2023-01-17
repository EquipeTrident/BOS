<?php

ini_set('display_errors', '1');
ini_set('error_reporting', E_ALL);

class Model
{
    /**
     * Attribut contenant l'instance PDO
     */
    private $bd;

    /**
     * Attribut statique qui contiendra l'unique instance de Model
     */
    private static $instance = null;

    /**
     * Constructeur : effectue la connexion à la base de données.
     */
    /*private function __construct()
    {
        include "credentials.php";
        $this->bd = new PDO('mysql:host='.$dbhost.';port='.$dbport.';dbname='.$db.'', $dbuser, $dbpasswd);
	$this->bd->query("SET names 'utf8'");
        $this->bd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }*/

    /**
     * Méthode permettant de récupérer un modèle car le constructeur est privé (Implémentation du Design Pattern Singleton)
     */
    public static function getModel()
    {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    /**
     * Retourne les 5 derniers etudiants
     * @return [array] Contient les informations des prix nobel
     */
    public function getLast()
    {
        $requete = $this->bd->prepare('SELECT * FROM etudiant ORDER BY student_id DESC LIMIT 5');
        $requete->execute();
        return $requete->fetchall();
    }

    public function getAll()
    {
        $requete = $this->bd->prepare('SELECT * FROM etudiant ORDER BY student_id');
        $requete->execute();
        return $requete->fetchall();
    }

    /**
     * Retourne le nombre d'etudiants dans la base de données
     * @return [int]
     */
}