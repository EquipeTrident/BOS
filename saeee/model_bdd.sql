DROP TABLE IF EXISTS login;
DROP TABLE IF EXISTS bos;
DROP TABLE IF EXISTS stage;
DROP TABLE IF EXISTS commentaire;
DROP TABLE IF EXISTS tuteur;
DROP TABLE IF EXISTS document;
DROP TABLE IF EXISTS etudiant;
DROP TABLE IF EXISTS entreprise;
DROP TABLE IF EXISTS personnel;
DROP TABLE IF EXISTS formation;

CREATE TABLE login(
    user_id SERIAL,
    username VARCHAR(20) NOT NULL,
    password VARCHAR(40) NOT NULL,
    role boolean,
    PRIMARY KEY(user_id)
);

CREATE TABLE formation(
    formation_id integer,
    departement varchar (30),
    composante varchar (30),
    PRIMARY KEY (formation_id)
);

CREATE TABLE personnel(
    personnel_id integer,
    nom varchar (30),
    prenom varchar (30),
    mail varchar (30),
    visibility_flag boolean,
    role varchar (20),
    formation_id integer,
    PRIMARY KEY (personnel_id),
    FOREIGN KEY (formation_id) REFERENCES formation (formation_id)
);

CREATE TABLE entreprise(
    entreprise_id integer,
    nom varchar (30),
    description varchar (50),
    adresse varchar (50),
    telephone integer,
    lieu varchar (40),
    PRIMARY KEY (entreprise_id)
);

CREATE TABLE etudiant(
    Student_id integer,
    Nom varchar(20),
    Prenom varchar(20),
    Mail varchar (30),
    Stage_detention boolean,
    Visibility_flag boolean,
    Groupe_id integer,
    PRIMARY KEY (student_id)
);

CREATE TABLE document(
    document_id integer,
    type varchar(30),
    student_id integer,
    date_heure DATE,
    url varchar(60),
    version integer,
    PRIMARY KEY (document_id),
    FOREIGN KEY(student_id) REFERENCES Etudiant(student_id)
);


CREATE TABLE bos(
    bos_id SERIAL,
    document_id integer,
    status varchar(20),
    bos_flag boolean,
    PRIMARY KEY (bos_id),
    FOREIGN KEY (document_id) REFERENCES document(document_id)
);

CREATE TABLE commentaire(
    commentaire_id integer,
    visibility_flag integer,
    enseignant_id integer,
    document_id integer,
    vue_flag boolean,
    commentaire varchar (500),
    PRIMARY KEY (commentaire_id),
    FOREIGN KEY (enseignant_id) REFERENCES personnel (personnel_id),
    FOREIGN KEY (document_id) REFERENCES document (document_id)
);

CREATE TABLE tuteur(
    tuteur_id integer,
    nom varchar (30),
    entreprise_id integer,
    prenom varchar (30),
    contact varchar (30),
    PRIMARY KEY (tuteur_id),
    FOREIGN KEY (entreprise_id) REFERENCES entreprise (entreprise_id)
);

CREATE TABLE stage(
    stage_id integer,
    mission varchar (50),
    student_id integer,
    annee integer,
    personnel_id integer,
    duree integer,
    tuteur_id integer,
    gratification boolean,
    teletravail integer,
    PRIMARY KEY (stage_id),
    FOREIGN KEY (student_id) REFERENCES Etudiant(student_id),
    FOREIGN KEY (personnel_id) REFERENCES personnel (personnel_id),
    FOREIGN KEY (tuteur_id) REFERENCES tuteur (tuteur_id)
);

INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (0,'Abed','Rayane','mail@gmail.com',1,1,2);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (1,'Alili','Amney','mail@gmail.com',1,1,1);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (2,'Allonsius','Ahmed','mail@gmail.com',1,1,2);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (3,'Alloune','Aymen','mail@gmail.com',0,1,2);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (4,'Andriamisa','Nayann','mail@gmail.com',1,1,3);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (5,'Andriatsahavojaona','Ony','mail@gmail.com',0,1,1);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (6,'Arrar','Riyad','mail@gmail.com',0,1,3);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (7,'Aubert','Cleante','mail@gmail.com',1,1,3);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (9,'Balendran','Angela','mail@gmail.com',1,1,2);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (10,'Baskaran','Sarujan','mail@gmail.com',0,1,1);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (11,'Bellagraa','Yassine','mail@gmail.com',0,1,3);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (12,'Benaissa','Younes','mail@gmail.com',1,1,3);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (13,'Botseke ongagna','Joe','mail@gmail.com',1,1,3);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (14,'Boudarga','Othman','mail@gmail.com',0,1,1);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (15,'Bousserhane','Salma','mail@gmail.com',0,1,2);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (16,'Boyaval','Maxime','mail@gmail.com',1,1,1);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (17,'Breville','Alexandre','mail@gmail.com',0,1,3);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (18,'Buzura','Darius','mail@gmail.com',0,1,3);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (19,'Caillaud','Maxime','mail@gmail.com',1,1,2);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (20,'Camara','Moustapha','mail@gmail.com',0,1,1);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (21,'Chami','Bilal','mail@gmail.com',1,1,1);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (22,'Chen','Patrick','mail@gmail.com',0,1,3);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (23,'Cyprien','Chrislin','mail@gmail.com',1,1,1);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (24,'Da costa gomara ruiz','Antoine','mail@gmail.com',1,1,2);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (25,'Dia','Amadou','mail@gmail.com',0,1,3);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (26,'Diabira','Sylla','mail@gmail.com',0,1,3);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (27,'Diallo','Mamadou','mail@gmail.com',1,1,2);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (28,'Dovifaaz','Mehdi','mail@gmail.com',0,1,3);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (29,'Elabasy','Amgad','mail@gmail.com',1,1,1);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (30,'Elnady','Omar','mail@gmail.com',1,1,3);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (31,'Essayah','Charaf','mail@gmail.com',0,1,1);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (32,'Fathi','Marie','mail@gmail.com',0,1,3);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (33,'Fratila','Adriana-mariana','mail@gmail.com',0,1,1);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (34,'Gupta','Varun','mail@gmail.com',1,1,3);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (36,'Hammache','Kais','mail@gmail.com',1,1,3);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (37,'Haude','Auceane','mail@gmail.com',0,1,1);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (38,'Hayek','Sofiene','mail@gmail.com',1,1,2);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (39,'Houmimid','Hani','mail@gmail.com',0,1,1);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (40,'Huang','Frederic','mail@gmail.com',1,1,1);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (41,'Huynh','Alexandre','mail@gmail.com',1,1,3);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (42,'Idier','Laetitia','mail@gmail.com',0,1,1);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (43,'Jeyaraj','Jeyanika','mail@gmail.com',1,1,2);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (44,'Jie','Juan','mail@gmail.com',1,1,1);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (45,'Kanzari','Rayan','mail@gmail.com',0,1,3);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (46,'Laddada','Anis','mail@gmail.com',1,1,1);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (47,'Lannuzel','Dylan','mail@gmail.com',0,1,2);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (48,'Laurent','Aicha','mail@gmail.com',1,1,2);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (49,'Lazar','Mohamed','mail@gmail.com',0,1,1);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (50,'Lile','Vithia','mail@gmail.com',0,1,3);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (51,'Lo','Faty','mail@gmail.com',0,1,3);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (52,'Luyeye lu mvuala','Oceane','mail@gmail.com',0,1,1);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (53,'Marrou','Ishak','mail@gmail.com',1,1,3);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (54,'Mazgar','Selma','mail@gmail.com',1,1,2);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (55,'Mohammedi','Mazigh','mail@gmail.com',1,1,2);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (56,'Nejjari','Abdenour','mail@gmail.com',1,1,1);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (57,'Nguyen','Maxime','mail@gmail.com',0,1,3);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (58,'Oubella','Walid','mail@gmail.com',1,1,3);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (59,'Ouyed','Neil','mail@gmail.com',1,1,2);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (60,'Paillot','Jefferson','mail@gmail.com',0,1,3);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (61,'Paris','Evan','mail@gmail.com',1,1,1);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (62,'Pathmaharan','Kajanan','mail@gmail.com',1,1,2);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (64,'Postic','Kevin','mail@gmail.com',0,1,1);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (65,'Rachid','Amin','mail@gmail.com',1,1,2);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (66,'Raveendran','Thirisan','mail@gmail.com',1,1,3);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (67,'Sadi oufella','Kenza','mail@gmail.com',0,1,2);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (68,'Salemkour','Tinhinane','mail@gmail.com',0,1,1);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (69,'Sami','Erwann','mail@gmail.com',0,1,1);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (70,'Savundrarajan','Tharshaan','mail@gmail.com',1,1,1);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (71,'Smaoune','Oussama','mail@gmail.com',1,1,1);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (72,'Soupramaniane','Cyril','mail@gmail.com',1,1,1);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (73,'Talbi','Samir','mail@gmail.com',1,1,2);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (74,'Theivendirampillai','Thevish','mail@gmail.com',1,1,2);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (75,'Tigrini','Rayane','mail@gmail.com',0,1,2);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (76,'Tlemsani','Sofiane','mail@gmail.com',1,1,2);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (77,'Topal','Mahmut ali','mail@gmail.com',0,1,3);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (78,'Vongsavanh','Aline','mail@gmail.com',1,1,3);
INSERT INTO `Etudiant`(`Student_ID`, `Nom`, `Prenom`, `Mail`, `Stage_detention`, `Visibility_flag`,`Groupe_ID`) VALUES (79,'Zeroual','Ilyes','mail@gmail.com',1,1,2);
