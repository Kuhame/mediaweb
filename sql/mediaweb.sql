CREATE TABLE utilisateur (
    userId INT,
    login VARCHAR(30),
    password VARCHAR(30),
    name VARCHAR(30),
    isBibliothecaire BIT,
    PRIMARY KEY (userId)
);

CREATE TABLE document (
    documentId INT,
    name VARCHAR(30),
    PRIMARY KEY (documentId)
);

-- sample data

INSERT INTO utilisateur VALUES (0, 'laurent', 'laurent', 'Laurent Han', 0);
INSERT INTO utilisateur VALUES (1, 'ryan', 'ryan', 'Ryan Malonzo', 1);
INSERT INTO utilisateur VALUES (2, 'fabien', 'fabien', 'Fabien Ribeiro', 1);
INSERT INTO utilisateur VALUES (3, 'guillaume', 'guillaume', 'Guillaume Merchez', 1);
INSERT INTO utilisateur VALUES (4, 'mahir', 'mahir', 'Mahir Akhayar', 0);
INSERT INTO utilisateur VALUES (5, 'hassen', 'hassen', 'Hassen Arkab', 0);

INSERT INTO document VALUES (0, 'Document 1');
INSERT INTO document VALUES (1, 'Document 2');
INSERT INTO document VALUES (2, 'Document 3');
INSERT INTO document VALUES (3, 'Document 4');
INSERT INTO document VALUES (4, 'Document 5');
INSERT INTO document VALUES (5, 'Document 6');
INSERT INTO document VALUES (6, 'Document 7');
INSERT INTO document VALUES (7, 'Document 8');
INSERT INTO document VALUES (8, 'Document 9');
INSERT INTO document VALUES (9, 'Document 10');


COMMIT;