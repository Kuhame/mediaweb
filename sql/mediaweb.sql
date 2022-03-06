SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE `document` (
  `idDocument` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `typeDocument` varchar(30) NOT NULL,
  `auteur` varchar(30) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `emprunteur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `document` VALUES(1, 'Livre 1', 'Livre', 'Scooter Hollande', NULL, 1);
INSERT INTO `document` VALUES(2, 'DVD 1', 'DVD', 'Editeur 1', NULL, NULL);
INSERT INTO `document` VALUES(3, 'Livre 2', 'Livre', 'Kim Contre-un Oh', NULL, 2);
INSERT INTO `document` VALUES(4, 'CD 1', 'CD', 'ENHYPEN', NULL, NULL);
INSERT INTO `document` VALUES(5, 'DVD 2', 'DVD', 'Editeur 2', NULL, NULL);
INSERT INTO `document` VALUES(6, 'Livre 3', 'Livre', 'Donald Coiffeton Trump', NULL, NULL);
INSERT INTO `document` VALUES(7, 'Livre 4', 'Livre', 'Angela Merguez', NULL, NULL);
INSERT INTO `document` VALUES(8, 'CD 2', 'CD', 'EVERGLOW', NULL, NULL);
INSERT INTO `document` VALUES(9, 'DVD 3', 'DVD', 'Editeur 3', NULL, NULL);
INSERT INTO `document` VALUES(10, 'DVD 4', 'DVD', 'Editeur 4', NULL, NULL);
INSERT INTO `document` VALUES(11, 'Pokémon Go', 'CD', 'MISHA', NULL, NULL);

CREATE TABLE `utilisateur` (
  `idUtilisateur` int(11) NOT NULL,
  `pseudo` varchar(30) NOT NULL,
  `motdepasse` varchar(30) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `estBibliothecaire` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `utilisateur` VALUES(1, 'laurent', 'laurent', 'Laurent Han', 0);
INSERT INTO `utilisateur` VALUES(2, 'ryan', 'ryan', 'Ryan Malonzo', 1);
INSERT INTO `utilisateur` VALUES(3, 'fabien', 'fabien', 'Fabien Ribeiro', 1);
INSERT INTO `utilisateur` VALUES(4, 'guillaume', 'guillaume', 'Guillaume Merchez', 1);
INSERT INTO `utilisateur` VALUES(5, 'mahir', 'mahir', 'Mahir Akhayar', 0);
INSERT INTO `utilisateur` VALUES(6, 'hassen', 'hassen', 'Hassen Arkab', 0);


ALTER TABLE `document`
  ADD PRIMARY KEY (`idDocument`),
  ADD KEY `emprunteur` (`emprunteur`);

ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`idUtilisateur`);


ALTER TABLE `document`
  MODIFY `idDocument` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;


ALTER TABLE `document`
  ADD CONSTRAINT `document_ibfk_1` FOREIGN KEY (`emprunteur`) REFERENCES `utilisateur` (`idUtilisateur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
