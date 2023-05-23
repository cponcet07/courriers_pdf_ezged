-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  mar. 23 mai 2023 à 17:59
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
-- Structure de la table `courriers_specif_users`
--

CREATE TABLE `courriers_specif_users` (
  `COURRIERS_SPECIF_USERS_ID` bigint(20) NOT NULL,
  `COURRIERS_SPECIF_USERS_SECUSR_ID` bigint(20) NOT NULL DEFAULT 0,
  `COURRIERS_SPECIF_USERS_PASSWORD` varchar(50) NOT NULL DEFAULT '',
  `COURRIERS_SPECIF_USERS_AUTORISATION` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `courriers_specif_users`
--

INSERT INTO `courriers_specif_users` (`COURRIERS_SPECIF_USERS_ID`, `COURRIERS_SPECIF_USERS_SECUSR_ID`, `COURRIERS_SPECIF_USERS_PASSWORD`, `COURRIERS_SPECIF_USERS_AUTORISATION`) VALUES
(3, 19, 'demo_celio', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `courriers_specif_users`
--
ALTER TABLE `courriers_specif_users`
  ADD PRIMARY KEY (`COURRIERS_SPECIF_USERS_ID`),
  ADD KEY `VK_courriers_specif_users_4SMLGKOQ` (`COURRIERS_SPECIF_USERS_AUTORISATION`),
  ADD KEY `VK_courriers_specif_users_4SMLGKQF` (`COURRIERS_SPECIF_USERS_PASSWORD`),
  ADD KEY `VK_courriers_specif_users_4SMLGKR2` (`COURRIERS_SPECIF_USERS_SECUSR_ID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `courriers_specif_users`
--
ALTER TABLE `courriers_specif_users`
  MODIFY `COURRIERS_SPECIF_USERS_ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
