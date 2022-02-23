DROP TABLE utilisateur CASCADE CONSTRAINTS PURGE;
DROP TABLE document CASCADE CONSTRAINTS PURGE;
DROP TABLE livre PURGE;
DROP TABLE dvd PURGE;
DROP TABLE cd PURGE;
DROP TABLE emprunt PURGE;

-- TODO add sequences

CREATE TABLE utilisateur (
    idUtilisateur NUMBER,
    pseudo VARCHAR(30),
    motdepasse VARCHAR(30),
    nom VARCHAR(30),
    estBibliothecaire NUMBER(1),
    PRIMARY KEY (idUtilisateur)
);

CREATE TABLE document (
    idDocument NUMBER,
    nom VARCHAR(30),
    PRIMARY KEY (idDocument)
);

CREATE TABLE livre (
    idLivre NUMBER,
    auteur VARCHAR(30),
    idDocument NUMBER,
    PRIMARY KEY (idLivre),
    FOREIGN KEY (idDocument) REFERENCES document(idDocument)
);

CREATE TABLE dvd (
    idDVD NUMBER,
    editeur VARCHAR(30),
    idDocument NUMBER,
    PRIMARY KEY (idDVD),
    FOREIGN KEY (idDocument) REFERENCES document(idDocument)
);

CREATE TABLE cd (
    idCD NUMBER,
    artiste VARCHAR(30),
    idDocument NUMBER,
    PRIMARY KEY (idCD),
    FOREIGN KEY (idDocument) REFERENCES document (idDocument)
);

CREATE TABLE emprunt (
    idUtilisateur NUMBER,
    idDocument NUMBER,
    PRIMARY KEY (idUtilisateur, idDocument),
    FOREIGN KEY (idUtilisateur) REFERENCES utilisateur(idUtilisateur),
    FOREIGN KEY (idDocument) REFERENCES document(idDocument)
);

-- sample data

INSERT INTO utilisateur VALUES (0, 'laurent', 'laurent', 'Laurent Han', 0);
INSERT INTO utilisateur VALUES (1, 'ryan', 'ryan', 'Ryan Malonzo', 1);
INSERT INTO utilisateur VALUES (2, 'fabien', 'fabien', 'Fabien Ribeiro', 1);
INSERT INTO utilisateur VALUES (3, 'guillaume', 'guillaume', 'Guillaume Merchez', 1);
INSERT INTO utilisateur VALUES (4, 'mahir', 'mahir', 'Mahir Akhayar', 0);
INSERT INTO utilisateur VALUES (5, 'hassen', 'hassen', 'Hassen Arkab', 0);

INSERT INTO document VALUES (0, 'Livre 1');
INSERT INTO document VALUES (1, 'DVD 1');
INSERT INTO document VALUES (2, 'Livre 2');
INSERT INTO document VALUES (3, 'CD 1');
INSERT INTO document VALUES (4, 'DVD 2');
INSERT INTO document VALUES (5, 'Livre 3');
INSERT INTO document VALUES (6, 'Livre 4');
INSERT INTO document VALUES (7, 'CD 2');
INSERT INTO document VALUES (8, 'DVD 3');
INSERT INTO document VALUES (9, 'DVD 4');

INSERT INTO livre VALUES (0, 'François Hollande', 0);
INSERT INTO livre VALUES (1, 'Vladimir Poutine', 2);
INSERT INTO livre VALUES (2, 'Joe Biden', 5);
INSERT INTO livre VALUES (3, 'Angela Merkel', 6);

INSERT INTO dvd VALUES (0, 'Editeur 1', 1);
INSERT INTO dvd VALUES (1, 'Editeur 2', 4);
INSERT INTO dvd VALUES (2, 'Editeur 2', 8);
INSERT INTO dvd VALUES (3, 'Editeur 3', 9);

INSERT INTO cd VALUES (0, 'ENHYPEN', 3);
INSERT INTO cd VALUES (1, 'EVERGLOW', 7);

INSERT INTO emprunt VALUES (0, 0);

COMMIT;

select * from utilisateur;
select * from document;
select * from livre;
select * from dvd;
select * from cd;
select * from emprunt;