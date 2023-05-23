-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  mar. 23 mai 2023 à 21:10
-- Version du serveur :  10.4.6-MariaDB
-- Version de PHP :  7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `nchp_ezged`
--

-- --------------------------------------------------------

--
-- Structure de la table `modele_courriers_specif`
--

CREATE TABLE `modele_courriers_specif` (
  `MODELE_COURRIERS_SPECIF_ID` bigint(20) NOT NULL,
  `MODELE_COURRIERS_SPECIF_LIB` varchar(50) NOT NULL DEFAULT '',
  `MODELE_COURRIERS_SPECIF_CONTENT` longtext DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `modele_courriers_specif`
--

INSERT INTO `modele_courriers_specif` (`MODELE_COURRIERS_SPECIF_ID`, `MODELE_COURRIERS_SPECIF_LIB`, `MODELE_COURRIERS_SPECIF_CONTENT`) VALUES
(3, 'demande de location de salle', 'Cher(e) [Nom du demandeur],\r\n\r\nNous avons bien reÃ§u votre demande de location de la salle communale pour le [Date et heure de l\'Ã©vÃ©nement]. AprÃ¨s vÃ©rification de notre calendrier, nous sommes heureux de vous informer que la salle est disponible Ã  la date que vous avez choisie.\r\n\r\nVeuillez noter que la location de la salle est soumise Ã  nos rÃ¨glements communautaires. Vous Ãªtes responsable de la propretÃ© de la salle et de toute dÃ©gradation qui pourrait survenir pendant l\'utilisation de celle-ci.\r\n\r\nVeuillez passer Ã  la mairie pour finaliser la procÃ©dure de location et rÃ©cupÃ©rer les clÃ©s de la salle. Si vous avez des questions ou si vous souhaitez discuter de quelque chose en particulier, n\'hÃ©sitez pas Ã  nous contacter.\r\n\r\nNous vous remercions pour votre coopÃ©ration et nous nous rÃ©jouissons de vous accueillir dans notre salle communale.\r\n\r\nCordialement,\r\n\r\n[Votre nom]\r\n[Votre poste]\r\nMairie de [Nom de votre commune]'),
(4, 'demande de fermeture de route', 'Cher(e) [Nom du demandeur],\r\n\r\nNous avons bien reÃ§u votre demande de fermeture de route pour l\'organisation de la course le [Date de l\'Ã©vÃ©nement]. AprÃ¨s examen minutieux, nous sommes en mesure de vous informer que nous pouvons accÃ©der Ã  votre demande.\r\n\r\nCependant, la fermeture de la route est sujette Ã  certaines conditions pour garantir la sÃ©curitÃ© de tous et minimiser l\'impact sur la circulation. Il vous sera nÃ©cessaire de :\r\n\r\n1. Installer des signaux de dÃ©viation appropriÃ©s pour informer les conducteurs de la fermeture de la route.\r\n2. Avoir des stewards ou des bÃ©nÃ©voles pour gÃ©rer la circulation.\r\n3. Informer les rÃ©sidents et les entreprises locales de l\'Ã©vÃ©nement Ã  l\'avance.\r\n\r\nS\'il vous plaÃ®t, veuillez passer Ã  la mairie pour finaliser les dÃ©tails et obtenir l\'autorisation officielle. Si vous avez d\'autres questions ou si vous souhaitez discuter de quelque chose en particulier, n\'hÃ©sitez pas Ã  nous contacter.\r\n\r\nNous vous remercions pour votre coopÃ©ration et nous nous rÃ©jouissons d\'accueillir cet Ã©vÃ©nement dans notre communautÃ©.\r\n\r\nCordialement,\r\n\r\n[Votre nom]\r\n[Votre poste]\r\nMairie de [Nom de votre commune]\r\n');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `modele_courriers_specif`
--
ALTER TABLE `modele_courriers_specif`
  ADD PRIMARY KEY (`MODELE_COURRIERS_SPECIF_ID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `modele_courriers_specif`
--
ALTER TABLE `modele_courriers_specif`
  MODIFY `MODELE_COURRIERS_SPECIF_ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
