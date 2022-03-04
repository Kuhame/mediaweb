CREATE TABLE utilisateur (
    idUtilisateur INT,
    pseudo VARCHAR(30),
    motdepasse VARCHAR(30),
    nom VARCHAR(30),
    estBibliothecaire BOOLEAN,
    PRIMARY KEY (idUtilisateur)
);

CREATE TABLE document (
    idDocument INT AUTO_INCREMENT,
    nom VARCHAR(30),
    PRIMARY KEY (idDocument)
);

CREATE TABLE livre (
    idLivre INT AUTO_INCREMENT,
    auteur VARCHAR(30),
    idDocument INT,
    PRIMARY KEY (idLivre),
    FOREIGN KEY (idDocument) REFERENCES document(idDocument)
);

CREATE TABLE dvd (
    idDVD INT AUTO_INCREMENT,
    editeur VARCHAR(30),
    idDocument INT,
    PRIMARY KEY (idDVD),
    FOREIGN KEY (idDocument) REFERENCES document(idDocument)
);

CREATE TABLE cd (
    idCD INT AUTO_INCREMENT,
    artiste VARCHAR(30),
    idDocument INT,
    PRIMARY KEY (idCD),
    FOREIGN KEY (idDocument) REFERENCES document(idDocument)
);

CREATE TABLE emprunt (
    idUtilisateur INT,
    idDocument INT,
    PRIMARY KEY (idUtilisateur, idDocument),
    FOREIGN KEY (idUtilisateur) REFERENCES utilisateur(idUtilisateur),
    FOREIGN KEY (idDocument) REFERENCES document(idDocument)
);

-- sample data

INSERT INTO utilisateur VALUES (1, 'laurent', 'laurent', 'Laurent Han', 0);
INSERT INTO utilisateur VALUES (2, 'ryan', 'ryan', 'Ryan Malonzo', 1);
INSERT INTO utilisateur VALUES (3, 'fabien', 'fabien', 'Fabien Ribeiro', 1);
INSERT INTO utilisateur VALUES (4, 'guillaume', 'guillaume', 'Guillaume Merchez', 1);
INSERT INTO utilisateur VALUES (5, 'mahir', 'mahir', 'Mahir Akhayar', 0);
INSERT INTO utilisateur VALUES (6, 'hassen', 'hassen', 'Hassen Arkab', 0);

INSERT INTO document VALUES (1, 'Livre 1');
INSERT INTO document VALUES (2, 'DVD 1');
INSERT INTO document VALUES (3, 'Livre 2');
INSERT INTO document VALUES (4, 'CD 1');
INSERT INTO document VALUES (5, 'DVD 2');
INSERT INTO document VALUES (6, 'Livre 3');
INSERT INTO document VALUES (7, 'Livre 4');
INSERT INTO document VALUES (8, 'CD 2');
INSERT INTO document VALUES (9, 'DVD 3');
INSERT INTO document VALUES (10, 'DVD 4');

INSERT INTO livre VALUES (1, 'François Hollande', 1);
INSERT INTO livre VALUES (2, 'Vladimir Poutine', 3);
INSERT INTO livre VALUES (3, 'Joe Biden', 6);
INSERT INTO livre VALUES (4, 'Angela Merkel', 7);

INSERT INTO dvd VALUES (1, 'Editeur 1', 2);
INSERT INTO dvd VALUES (2, 'Editeur 2', 5);
INSERT INTO dvd VALUES (3, 'Editeur 2', 9);
INSERT INTO dvd VALUES (4, 'Editeur 3', 10);

INSERT INTO cd VALUES (1, 'ENHYPEN', 4);
INSERT INTO cd VALUES (2, 'EVERGLOW', 8);

INSERT INTO emprunt VALUES (1, 1);