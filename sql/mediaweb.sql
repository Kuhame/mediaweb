CREATE TABLE utilisateur (
    idUtilisateur INT,
    pseudo VARCHAR(30) NOT NULL,
    motdepasse VARCHAR(30) NOT NULL,
    nom VARCHAR(30) NOT NULL,
    estBibliothecaire BOOLEAN NOT NULL,
    PRIMARY KEY (idUtilisateur)
);

CREATE TABLE document (
    idDocument INT AUTO_INCREMENT,
    nom VARCHAR(30) NOT NULL,
    typeDocument VARCHAR(30) NOT NULL,
    auteur VARCHAR(30) NOT NULL,
    description VARCHAR(100),
    emprunteur INT,
    PRIMARY KEY (idDocument),
    FOREIGN KEY (emprunteur) REFERENCES utilisateur(idUtilisateur)
);

-- sample data

INSERT INTO utilisateur VALUES (1, 'laurent', 'laurent', 'Laurent Han', 0);
INSERT INTO utilisateur VALUES (2, 'ryan', 'ryan', 'Ryan Malonzo', 1);
INSERT INTO utilisateur VALUES (3, 'fabien', 'fabien', 'Fabien Ribeiro', 1);
INSERT INTO utilisateur VALUES (4, 'guillaume', 'guillaume', 'Guillaume Merchez', 1);
INSERT INTO utilisateur VALUES (5, 'mahir', 'mahir', 'Mahir Akhayar', 0);
INSERT INTO utilisateur VALUES (6, 'hassen', 'hassen', 'Hassen Arkab', 0);

INSERT INTO document VALUES (1, 'Livre 1', 'Livre', 'Scooter Hollande', NULL, 1);
INSERT INTO document VALUES (2, 'DVD 1', 'DVD', 'Editeur 1', NULL, NULL);
INSERT INTO document VALUES (3, 'Livre 2', 'Livre', 'Kim Contre-un Oh', NULL, 2);
INSERT INTO document VALUES (4, 'CD 1', 'CD', 'ENHYPEN', NULL, NULL);
INSERT INTO document VALUES (5, 'DVD 2', 'DVD', 'Editeur 2', NULL, NULL);
INSERT INTO document VALUES (6, 'Livre 3', 'Livre', 'Donald Coiffeton Trump', NULL, NULL);
INSERT INTO document VALUES (7, 'Livre 4', 'Livre', 'Angela Merguez', NULL, NULL);
INSERT INTO document VALUES (8, 'CD 2', 'CD', 'EVERGLOW', NULL, NULL);
INSERT INTO document VALUES (9, 'DVD 3', 'DVD', 'Editeur 3', NULL, NULL);
INSERT INTO document VALUES (10, 'DVD 4', 'DVD', 'Editeur 4', NULL, NULL);
