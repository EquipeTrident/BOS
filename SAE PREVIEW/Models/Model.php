<?php

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
    private function __construct()
    {
        include "credentials.php";
        $this->bd = new PDO($dsn, $login, $mdp );
        $this->bd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $this->bd->query("SET nameS 'utf8'");
    }

    /**
     * Méthode permettant de récupérer un modèle car le constructeur est privé (Implémentation du Design Pattern Singleton)
     * La fonction est une comparaison suivi d'une potentielle affectation. C'est alors une fonction constante de compléxité O(1)
     * "La coût de cet algorithme est dite constant. Ce sera le cas de tous les algorithmes avec T(n)=a où a est un réel" : http://www.monlyceenumerique.fr/nsi_premiere/algo_a/a2_complexite.php
     */
    public static function getModel()
    {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    /**
     * Retourne les different vue
     * Les fonctions ci-dessous affecte des requêtes SQL. C'est alors une fonction constante de compléxité O(1)
     * "Le coût de cet algorithme est dite constant. Ce sera le cas de tous les algorithmes avec T(n)=a où a est un réel" : http://www.monlyceenumerique.fr/nsi_premiere/algo_a/a2_complexite.php
     */
  

    public function getPorthos()
    {
        $req = $this->bd->prepare("SELECT * FROM `etudiant` WHERE groupe ='Porthos' ORDER BY `etudiant`. `groupe` ASC ,`nom` ASC ");
        $req->execute();
        return $req->fetchall();
    }
    public function getAthos()
    {
        $req = $this->bd->prepare("SELECT * FROM `etudiant` WHERE groupe ='Athos' ORDER BY `etudiant`. `groupe` ASC ,`nom` ASC ");
        $req->execute();
        return $req->fetchall();
    }

    public function getAramis()
    {
        $req = $this->bd->prepare("SELECT * FROM `etudiant` WHERE groupe ='Aramis' ORDER BY `etudiant`. `groupe` ASC ,`nom` ASC ");
        $req->execute();
        return $req->fetchall();
    }
    public function getAll()
    {
        $req = $this->bd->prepare('SELECT * FROM etudiant ORDER BY student_id');
        $req->execute();
        return $req->fetchall();
    }

    /**
     * Retourne le nombre d'etudiants dans la base de données
     * @return [int]
     * La fonction itère un tableau à chaque nouvel étudiant qu'elle recense. La fonction est alors constante et sa compléxité est O(1)
     * "Le coût de cet algorithme est dite constant. Ce sera le cas de tous les algorithmes avec T(n)=a où a est un réel" : http://www.monlyceenumerique.fr/nsi_premiere/algo_a/a2_complexite.php
     * 
     */
    public function getNbEtudiant()
    {
        $req = $this->bd->prepare('SELECT COUNT(*) FROM etudiant');
        $req->execute();
        $tab = $req->fetch(PDO::FETCH_NUM);
        return $tab[0];
    }

    /**
     * Retourne un tableau contenant les informations etudiants (ou false s'il n'existe pas)
     * @param [int] $id identifiant etudiant
     * @return [array ou false] Tableau contenant les infos(id, year, universite, nom, prenom) ou false
     * Les fonctions retournent un tableau après l'ajout de chacunes des données requises. La fonction est alors constante est sa compléxité est O(1)
     * "La coût de cet algorithme est dite constant. Ce sera le cas de tous les algorithmes avec T(n)=a où a est un réel" : http://www.monlyceenumerique.fr/nsi_premiere/algo_a/a2_complexite.php
     */
    public function getEtudiantInformations($id)
    {
        $requete = $this->bd->prepare('Select * from etudiant WHERE student_id = :id');
        $requete->bindValue(':id', $id);
        $requete->execute();
        return $requete->fetch(PDO::FETCH_ASSOC);
    }

    public function getEtudiantbos($id)
    {
        $requete = $this->bd->prepare('Select * from etudiant left join document on etudiant.student_id = document.student_id');
        $requete->execute();
        return $requete->fetch(PDO::FETCH_ASSOC);
    }

    /**
     * Retourne les prix nobels dans la base de données du ($offset+1)ème au ($offset + $limit) ème
     * @param [int] $offset Position de départ
     * @param [int] $limit Nombre de résultats retournés
     * @return [array] Contient les informations
     * La fonction retourne un tableau où les informations sont itérés une par une. La fonction est alors constante et sa compléxité est de type O(1)
     * "La coût de cet algorithme est dite constant. Ce sera le cas de tous les algorithmes avec T(n)=a où a est un réel" : http://www.monlyceenumerique.fr/nsi_premiere/algo_a/a2_complexite.php
     */
    public function getEtudiantWithLimit($offset = 0, $limit = 25)
    {
        $requete = $this->bd->prepare('Select * from etudiant ORDER BY student_id DESC LIMIT :limit OFFSET :offset');
        $requete->bindValue(':limit', $limit, PDO::PARAM_INT);
        $requete->bindValue(':offset', $offset, PDO::PARAM_INT);
        $requete->execute();
        return $requete->fetchAll(PDO::FETCH_ASSOC);
    }

    /**
     * Retourne true si la table etudiants contient un identifiant comme le param $id, false sinon
     * @param int $id identifiant etudiants
     * @return boolean
     * La fonction compare et renvoie un boolean. La fonction est alors constante et sa compléxité est de type O(1)
     * "La coût de cet algorithme est dite constant. Ce sera le cas de tous les algorithmes avec T(n)=a où a est un réel" : http://www.monlyceenumerique.fr/nsi_premiere/algo_a/a2_complexite.php
     */
    public function isInDataBase($id)
    {
        return $this->getEtudiantInformations($id) !== false;
    }

    /**
     * Supprime l'etudiant dont l'identifiant est $id_ed
     * @param [int] $id_ed identifiant du prix nobel à supprimer
     * @return [boolean] retourne true si la personne a été supprimée de la base de données, et false sinon
     * La fonction réinistialise l'identifiant et ajoute un nouveau tout en retournant un boolean. La fonction est alors constante et sa compléxité est de type O(1)
     * "La coût de cet algorithme est dite constant. Ce sera le cas de tous les algorithmes avec T(n)=a où a est un réel" : http://www.monlyceenumerique.fr/nsi_premiere/algo_a/a2_complexite.php
     */
    public function removeEtudiant($id_ed)
    {
        $requete = $this->bd->prepare("DELETE FROM etudiant WHERE student_id = :id");
        $requete->bindValue(':id', (int) $id_ed, PDO::PARAM_INT);
        $requete->execute();
        return (bool) $requete->rowCount();
    }

    public function getLog()
    {
        $requete = $this->bd->prepare("SELECT * FROM login");
        $requete->execute();
        return $requete->fetchAll(PDO::FETCH_ASSOC);
    }
}
