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
    student_id integer,
    nom varchar(20),
    prenom varchar(20),
    mail varchar (30),
    formation_id integer,
    stage_dentention boolean,
    visibility_flag boolean,
    entreprise_id integer,
    personnel_id integer,
    groupe varchar(10),
    PRIMARY KEY (student_id),
    FOREIGN KEY (entreprise_id) REFERENCES entreprise (entreprise_id),
    FOREIGN KEY (personnel_id) REFERENCES personnel (personnel_id),
    FOREIGN KEY (formation_id) REFERENCES formation (formation_id)
);

CREATE TABLE document(
    document_id integer,
    type varchar(30),
    student_id integer,
    date_heure DATE,
    url varchar(60),
    version integer,
    PRIMARY KEY (document_id),
    FOREIGN KEY(student_id) REFERENCES etudiant (student_id)
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
    FOREIGN KEY (student_id) REFERENCES etudiant (student_id),
    FOREIGN KEY (personnel_id) REFERENCES personnel (personnel_id),
    FOREIGN KEY (tuteur_id) REFERENCES tuteur (tuteur_id)
);

COPY etudiants FROM '/var/www/html/saeee/etudiants_S3.csv' DELIMITER ',' csv;