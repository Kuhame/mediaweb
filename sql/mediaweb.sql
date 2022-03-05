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

INSERT INTO document VALUES (1, 'Livre 1', 'livre', 'Scooter Hollande', NULL, 1);
INSERT INTO document VALUES (2, 'DVD 1', 'dvd', 'Editeur 1', NULL, NULL);
INSERT INTO document VALUES (3, 'Livre 2', 'livre', 'Kim Contre-un Oh', NULL, 2);
INSERT INTO document VALUES (4, 'CD 1', 'cd', 'ENHYPEN', NULL, NULL);
INSERT INTO document VALUES (5, 'DVD 2', 'dvd', 'Editeur 2', NULL, NULL);
INSERT INTO document VALUES (6, 'Livre 3', 'livre', 'Donald Coiffeton Trump', NULL, NULL);
INSERT INTO document VALUES (7, 'Livre 4', 'livre', 'Angela Merguez', NULL, NULL);
INSERT INTO document VALUES (8, 'CD 2', 'cd', 'EVERGLOW', NULL, NULL);
INSERT INTO document VALUES (9, 'DVD 3', 'dvd', 'Editeur 3', NULL, NULL);
INSERT INTO document VALUES (10, 'DVD 4', 'dvd', 'Editeur 4', NULL, NULL);
