-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- HÃ´te : 127.0.0.1:3306
-- GÃ©nÃ©rÃ© le : jeu. 19 jan. 2023 Ã  16:37
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de donnÃ©es : `sae`
--

-- --------------------------------------------------------

--
-- Structure de la table `bos`
--

DROP TABLE IF EXISTS `bos`;
CREATE TABLE IF NOT EXISTS `bos` (
  `bos_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `document_id` int DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `bos_flag` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`bos_id`),
  UNIQUE KEY `bos_id` (`bos_id`),
  KEY `document_id` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE IF NOT EXISTS `commentaire` (
  `commentaire_id` int NOT NULL,
  `visibility_flag` int DEFAULT NULL,
  `enseignant_id` int DEFAULT NULL,
  `document_id` int DEFAULT NULL,
  `vue_flag` tinyint(1) DEFAULT NULL,
  `commentaire` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`commentaire_id`),
  KEY `enseignant_id` (`enseignant_id`),
  KEY `document_id` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

-- --------------------------------------------------------

--
-- Structure de la table `document`
--

DROP TABLE IF EXISTS `document`;
CREATE TABLE IF NOT EXISTS `document` (
  `document_id` int NOT NULL,
  `type` varchar(30) DEFAULT NULL,
  `student_id` int DEFAULT NULL,
  `date_heure` date DEFAULT NULL,
  `url` varchar(60) DEFAULT NULL,
  `version` int DEFAULT NULL,
  PRIMARY KEY (`document_id`),
  KEY `student_id` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

DROP TABLE IF EXISTS `entreprise`;
CREATE TABLE IF NOT EXISTS `entreprise` (
  `entreprise_id` int NOT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `adresse` varchar(50) DEFAULT NULL,
  `telephone` int DEFAULT NULL,
  `lieu` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`entreprise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

--
-- DÃ©chargement des donnÃ©es de la table `entreprise`
--

INSERT INTO `entreprise` (`entreprise_id`, `nom`, `description`, `adresse`, `telephone`, `lieu`) VALUES
(1, 'Ubisoft', NULL, NULL, 706060606, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `student_id` int NOT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `prenom` varchar(20) DEFAULT NULL,
  `mail` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `stage_dentention` tinyint(1) DEFAULT NULL,
  `visibility_flag` tinyint(1) DEFAULT NULL,
  `entreprise_id` int DEFAULT NULL,
  `groupe` varchar(10) DEFAULT NULL,
  `personnel_id` int DEFAULT NULL,
  `formation_id` int DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `entreprise_id` (`entreprise_id`),
  KEY `personnel_id` (`personnel_id`),
  KEY `formation_id` (`formation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;
--
-- DÃ©chargement des donnÃ©es de la table `etudiant`
--

INSERT INTO `etudiant` (`student_id`, `nom`, `prenom`, `mail`, `stage_dentention`, `visibility_flag`, `entreprise_id`, `groupe`, `personnel_id`, `formation_id`) VALUES
(1, 'ABED', 'Rayane', 'Rayane.ABED@univ-paris13.fr', 1, 0, 0, 'Aramis', 0, 0),
(2, 'ALILI', 'Amney', 'Amney.ALILI@univ-paris13.fr', 1, 0, 0, 'Athos', 0, 0),
(3, 'ALLONSIUS', 'Ahmed', 'Ahmed.ALLONSIUS@univ-paris13.fr', 1, 0, 0, 'Aramis', 0, 0),
(4, 'ALLOUNE', 'Aymen', 'Aymen.ALLOUNE@univ-paris13.fr', 1, 0, 0, 'Aramis', 0, 0),
(5, 'ANDRIAMISA', 'Nayann', 'Nayann.ANDRIAMISA@univ-paris13.fr', 1, 0, 0, 'Porthos', 0, 0),
(6, 'ANDRIATSAHAVOJAONA', 'Ony', 'Ony.ANDRIATSAHAVOJAONA@univ-paris13.fr', 1, 0, 0, 'Athos', 0, 0),
(7, 'ARRAR', 'Riyad', 'Riyad.ARRAR@univ-paris13.fr', 1, 0, 0, 'Porthos', 0, 0),
(8, 'AUBERT', 'Cleante', 'Cleante.AUBERT@univ-paris13.fr', 1, 0, 0, 'Porthos', 0, 0),
(9, 'AZIZI', 'Rayane', 'Rayane.AZIZI@univ-paris13.fr', 1, 0, 0, 'SAS', 0, 0),
(10, 'BALENDRAN', 'Angela', 'Angela.BALENDRAN@univ-paris13.fr', 1, 0, 0, 'Aramis', 0, 0),
(11, 'BASKARAN', 'Sarujan', 'Sarujan.BASKARAN@univ-paris13.fr', 1, 0, 0, 'Athos', 0, 0),
(12, 'BELLAGRAA', 'Yassine', 'Yassine.BELLAGRAA@univ-paris13.fr', 1, 0, 0, 'Porthos', 0, 0),
(13, 'BENAISSA', 'Younes', 'Younes.BENAISSA@univ-paris13.fr', 1, 0, 0, 'Porthos', 0, 0),
(14, 'BOTSEKE ONGAGNA', 'Joe', 'Joe.BOTSEKE ONGAGNA@univ-paris13.fr', 1, 0, 0, 'Porthos', 0, 0),
(15, 'BOUDARGA', 'Othman', 'Othman.BOUDARGA@univ-paris13.fr', 1, 0, 0, 'Athos', 0, 0),
(16, 'BOUSSERHANE', 'Salma', 'Salma.BOUSSERHANE@univ-paris13.fr', 1, 0, 0, 'Aramis', 0, 0),
(17, 'BOYAVAL', 'Maxime', 'Maxime.BOYAVAL@univ-paris13.fr', 1, 0, 0, 'Athos', 0, 0),
(18, 'BREVILLE', 'Alexandre', 'Alexandre.BREVILLE@univ-paris13.fr', 1, 0, 0, 'Porthos', 0, 0),
(19, 'BUZURA', 'Darius', 'Darius.BUZURA@univ-paris13.fr', 1, 0, 0, 'Porthos', 0, 0),
(20, 'CAILLAUD', 'Maxime', 'Maxime.CAILLAUD@univ-paris13.fr', 1, 0, 0, 'Aramis', 0, 0),
(21, 'CAMARA', 'Moustapha', 'Moustapha.CAMARA@univ-paris13.fr', 1, 0, 0, 'Athos', 0, 0),
(22, 'CHAMI', 'Bilal', 'Bilal.CHAMI@univ-paris13.fr', 1, 0, 0, 'Athos', 0, 0),
(23, 'CHEN', 'Patrick', 'Patrick.CHEN@univ-paris13.fr', 1, 0, 0, 'Porthos', 0, 0),
(24, 'CYPRIEN', 'Chrislin', 'Chrislin.CYPRIEN@univ-paris13.fr', 1, 0, 0, 'Athos', 0, 0),
(25, 'DA COSTA GOMARA RUIZ', 'Antoine', 'Antoine.DA COSTA GOMARA RUIZ@univ-paris13.fr', 1, 0, 0, 'Aramis', 0, 0),
(26, 'DIA', 'Amadou', 'Amadou.DIA@univ-paris13.fr', 1, 0, 0, 'Porthos', 0, 0),
(27, 'DIABIRA', 'Sylla', 'Sylla.DIABIRA@univ-paris13.fr', 1, 0, 0, 'Porthos', 0, 0),
(28, 'DIALLO', 'Mamadou', 'Mamadou.DIALLO@univ-paris13.fr', 1, 0, 0, 'Aramis', 0, 0),
(29, 'DOVIFAAZ', 'Mehdi', 'Mehdi.DOVIFAAZ@univ-paris13.fr', 1, 0, 0, 'Porthos', 0, 0),
(30, 'ELABASY', 'Amgad', 'Amgad.ELABASY@univ-paris13.fr', 1, 0, 0, 'Athos', 0, 0),
(31, 'ELNADY', 'Omar', 'Omar.ELNADY@univ-paris13.fr', 1, 0, 0, 'Porthos', 0, 0),
(32, 'ESSAYAH', 'Charaf', 'Charaf.ESSAYAH@univ-paris13.fr', 1, 0, 0, 'Athos', 0, 0),
(33, 'FATHI', 'Marie', 'Marie.FATHI@univ-paris13.fr', 1, 0, 0, 'Porthos', 0, 0),
(34, 'FRATILA', 'Adriana-Mariana', 'Adriana-Mariana.FRATILA@univ-paris13.fr', 1, 0, 0, 'Athos', 0, 0),
(35, 'GUPTA', 'Varun', 'Varun.GUPTA@univ-paris13.fr', 1, 0, 0, 'Porthos', 0, 0),
(36, 'HAIN', 'Erwan', 'Erwan.HAIN@univ-paris13.fr', 1, 0, 0, 'SAS', 0, 0),
(37, 'HAMMACHE', 'Kais', 'Kais.HAMMACHE@univ-paris13.fr', 1, 0, 0, 'Porthos', 0, 0),
(38, 'HAUDE', 'Auceane', 'Auceane.HAUDE@univ-paris13.fr', 1, 0, 0, 'Athos', 0, 0),
(39, 'HAYEK', 'Sofiene', 'Sofiene.HAYEK@univ-paris13.fr', 1, 0, 0, 'Aramis', 0, 0),
(40, 'HOUMIMID', 'Hani', 'Hani.HOUMIMID@univ-paris13.fr', 1, 0, 0, 'Athos', 0, 0),
(41, 'HUANG', 'Frederic', 'Frederic.HUANG@univ-paris13.fr', 1, 0, 0, 'Athos', 0, 0),
(42, 'HUYNH', 'Alexandre', 'Alexandre.HUYNH@univ-paris13.fr', 1, 0, 0, 'Porthos', 0, 0),
(43, 'IDIER', 'Laetitia', 'Laetitia.IDIER@univ-paris13.fr', 1, 0, 0, 'Athos', 0, 0),
(44, 'JEYARAJ', 'Jeyanika', 'Jeyanika.JEYARAJ@univ-paris13.fr', 1, 0, 0, 'Aramis', 0, 0),
(45, 'JIE', 'Juan', 'Juan.JIE@univ-paris13.fr', 1, 0, 0, 'Athos', 0, 0),
(46, 'KANZARI', 'Rayan', 'Rayan.KANZARI@univ-paris13.fr', 1, 0, 0, 'Porthos', 0, 0),
(47, 'LADDADA', 'Anis', 'Anis.LADDADA@univ-paris13.fr', 1, 0, 0, 'Athos', 0, 0),
(48, 'LANNUZEL', 'Dylan', 'Dylan.LANNUZEL@univ-paris13.fr', 1, 0, 0, 'Aramis', 0, 0),
(49, 'LAURENT', 'Aicha', 'Aicha.LAURENT@univ-paris13.fr', 1, 0, 0, 'Aramis', 0, 0),
(50, 'LAZAR', 'Mohamed', 'Mohamed.LAZAR@univ-paris13.fr', 1, 0, 0, 'Athos', 0, 0),
(51, 'LILE', 'Vithia', 'Vithia.LILE@univ-paris13.fr', 1, 0, 0, 'Porthos', 0, 0),
(52, 'LO', 'Faty', 'Faty.LO@univ-paris13.fr', 1, 0, 0, 'Porthos', 0, 0),
(53, 'LUYEYE LU MVUALA', 'Oceane', 'Oceane.LUYEYE LU MVUALA@univ-paris13.fr', 1, 0, 0, 'Athos', 0, 0),
(54, 'MARROU', 'Ishak', 'Ishak.MARROU@univ-paris13.fr', 1, 0, 0, 'Porthos', 0, 0),
(55, 'MAZGAR', 'Selma', 'Selma.MAZGAR@univ-paris13.fr', 1, 0, 0, 'Aramis', 0, 0),
(56, 'MOHAMMEDI', 'Mazigh', 'Mazigh.MOHAMMEDI@univ-paris13.fr', 1, 0, 0, 'Aramis', 0, 0),
(57, 'NEJJARI', 'Abdenour', 'Abdenour.NEJJARI@univ-paris13.fr', 1, 0, 0, 'Athos', 0, 0),
(58, 'NGUYEN', 'Maxime', 'Maxime.NGUYEN@univ-paris13.fr', 1, 0, 0, 'Porthos', 0, 0),
(59, 'OUBELLA', 'Walid', 'Walid.OUBELLA@univ-paris13.fr', 1, 0, 0, 'Porthos', 0, 0),
(60, 'OUYED', 'Neil', 'Neil.OUYED@univ-paris13.fr', 1, 0, 0, 'Aramis', 0, 0),
(61, 'PAILLOT', 'Jefferson', 'Jefferson.PAILLOT@univ-paris13.fr', 1, 0, 0, 'Porthos', 0, 0),
(62, 'PARIS', 'Evan', 'Evan.PARIS@univ-paris13.fr', 1, 0, 0, 'Athos', 0, 0),
(63, 'PATHMAHARAN', 'Kajanan', 'Kajanan.PATHMAHARAN@univ-paris13.fr', 1, 0, 0, 'Aramis', 0, 0),
(64, 'PIRES', 'Nino', 'Nino.PIRES@univ-paris13.fr', 1, 0, 0, 'SAS', 0, 0),
(65, 'POSTIC', 'Kevin', 'Kevin.POSTIC@univ-paris13.fr', 1, 0, 0, 'Athos', 0, 0),
(66, 'RACHID', 'Amin', 'Amin.RACHID@univ-paris13.fr', 1, 0, 0, 'Aramis', 0, 0),
(67, 'RAVEENDRAN', 'Thirisan', 'Thirisan.RAVEENDRAN@univ-paris13.fr', 1, 0, 0, 'Porthos', 0, 0),
(68, 'SADI OUFELLA', 'Kenza', 'Kenza.SADI OUFELLA@univ-paris13.fr', 1, 0, 0, 'Aramis', 0, 0),
(69, 'SALEMKOUR', 'Tinhinane', 'Tinhinane.SALEMKOUR@univ-paris13.fr', 1, 0, 0, 'Athos', 0, 0),
(70, 'SAMI', 'Erwann', 'Erwann.SAMI@univ-paris13.fr', 1, 0, 0, 'Athos', 0, 0),
(71, 'SAVUNDRARAJAN', 'Tharshaan', 'Tharshaan.SAVUNDRARAJAN@univ-paris13.fr', 1, 0, 0, 'Athos', 0, 0),
(72, 'SMAOUNE', 'Oussama', 'Oussama.SMAOUNE@univ-paris13.fr', 1, 0, 0, 'Athos', 0, 0),
(73, 'SOUPRAMANIANE', 'Cyril', 'Cyril.SOUPRAMANIANE@univ-paris13.fr', 1, 0, 0, 'Athos', 0, 0),
(74, 'TALBI', 'Samir', 'Samir.TALBI@univ-paris13.fr', 1, 0, 0, 'Aramis', 0, 0),
(75, 'THEIVENDIRAMPILLAI', 'Thevish', 'Thevish.THEIVENDIRAMPILLAI@univ-paris13.fr', 1, 0, 0, 'Aramis', 0, 0),
(76, 'TIGRINI', 'Rayane', 'Rayane.TIGRINI@univ-paris13.fr', 1, 0, 0, 'Aramis', 0, 0),
(77, 'TLEMSANI', 'Sofiane', 'Sofiane.TLEMSANI@univ-paris13.fr', 1, 0, 0, 'Aramis', 0, 0),
(78, 'TOPAL', 'Mahmut Ali', 'Mahmut Ali.TOPAL@univ-paris13.fr', 1, 0, 0, 'Porthos', 0, 0),
(79, 'VONGSAVANH', 'Aline', 'Aline.VONGSAVANH@univ-paris13.fr', 1, 0, 0, 'Porthos', 0, 0),
(80, 'ZEROUAL', 'Ilyes', 'Ilyes.ZEROUAL@univ-paris13.fr', 1, 0, 0, 'Aramis', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

DROP TABLE IF EXISTS `formation`;
CREATE TABLE IF NOT EXISTS `formation` (
  `formation_id` int NOT NULL,
  `departement` varchar(30) DEFAULT NULL,
  `composante` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`formation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

--
-- DÃ©chargement des donnÃ©es de la table `formation`
--

INSERT INTO `formation` (`formation_id`, `departement`, `composante`) VALUES
(111, 'informatique', 'IUT Villetaneuse');

-- --------------------------------------------------------

--
-- Structure de la table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `user_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `role` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

-- --------------------------------------------------------

--
-- Structure de la table `personnel`
--

DROP TABLE IF EXISTS `personnel`;
CREATE TABLE IF NOT EXISTS `personnel` (
  `personnel_id` int NOT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `prenom` varchar(30) DEFAULT NULL,
  `mail` varchar(30) DEFAULT NULL,
  `visibility_flag` tinyint(1) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `formation_id` int DEFAULT NULL,
  PRIMARY KEY (`personnel_id`),
  KEY `formation_id` (`formation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

--
-- DÃ©chargement des donnÃ©es de la table `personnel`
--

INSERT INTO `personnel` (`personnel_id`, `nom`, `prenom`, `mail`, `visibility_flag`, `role`, `formation_id`) VALUES
(711, 'Lacroix', 'Mathieu', NULL, NULL, 'Prof de PHP', 111);

-- --------------------------------------------------------

--
-- Structure de la table `stage`
--

DROP TABLE IF EXISTS `stage`;
CREATE TABLE IF NOT EXISTS `stage` (
  `stage_id` int NOT NULL,
  `mission` varchar(50) DEFAULT NULL,
  `student_id` int DEFAULT NULL,
  `annee` int DEFAULT NULL,
  `personnel_id` int DEFAULT NULL,
  `duree` int DEFAULT NULL,
  `tuteur_id` int DEFAULT NULL,
  `gratification` tinyint(1) DEFAULT NULL,
  `teletravail` int DEFAULT NULL,
  PRIMARY KEY (`stage_id`),
  KEY `student_id` (`student_id`),
  KEY `personnel_id` (`personnel_id`),
  KEY `tuteur_id` (`tuteur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

-- --------------------------------------------------------

--
-- Structure de la table `tuteur`
--

DROP TABLE IF EXISTS `tuteur`;
CREATE TABLE IF NOT EXISTS `tuteur` (
  `tuteur_id` int NOT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `entreprise_id` int DEFAULT NULL,
  `prenom` varchar(30) DEFAULT NULL,
  `contact` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`tuteur_id`),
  KEY `entreprise_id` (`entreprise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;