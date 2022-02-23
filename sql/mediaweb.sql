CREATE TABLE user (
    userId INT,
    login VARCHAR(30),
    password VARCHAR(30),
    name VARCHAR(30),
    isLibrarian BIT,
    PRIMARY KEY (userId)
);

CREATE TABLE document (
    documentId INT,
    name VARCHAR(30),
    doctype INT, -- 1: livre, 2: dvd, 3: cd
    PRIMARY KEY (documentId)
);

-- sample data

INSERT INTO user VALUES (0, 'laurent', 'laurent', 'Laurent Han', 0);
INSERT INTO user VALUES (1, 'ryan', 'ryan', 'Ryan Malonzo', 1);
INSERT INTO user VALUES (2, 'fabien', 'fabien', 'Fabien Ribeiro', 1);
INSERT INTO user VALUES (3, 'guillaume', 'guillaume', 'Guillaume Merchez', 1);
INSERT INTO user VALUES (4, 'mahir', 'mahir', 'Mahir Akhayar', 0);
INSERT INTO user VALUES (5, 'hassen', 'hassen', 'Hassen Arkab', 0);

INSERT INTO document VALUES (0, 'Livre 1', 1);
INSERT INTO document VALUES (1, 'DVD 1', 2);
INSERT INTO document VALUES (2, 'Livre 2', 1);
INSERT INTO document VALUES (3, 'CD 1', 3);
INSERT INTO document VALUES (4, 'DVD 2', 2);
INSERT INTO document VALUES (5, 'Livre 3', 1);
INSERT INTO document VALUES (6, 'Livre 4', 1);
INSERT INTO document VALUES (7, 'CD 2', 3);
INSERT INTO document VALUES (8, 'DVD 3', 2);
INSERT INTO document VALUES (9, 'DVD 4', 2);


COMMIT;