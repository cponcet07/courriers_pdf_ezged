-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  mar. 23 mai 2023 à 18:00
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
-- Structure de la table `cap_contact`
--

CREATE TABLE `cap_contact` (
  `CAP_CONTACT_ID` bigint(20) NOT NULL,
  `CAP_CONTACT_LIB` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cap_contact`
--

INSERT INTO `cap_contact` (`CAP_CONTACT_ID`, `CAP_CONTACT_LIB`) VALUES
(1, 'CAP'),
(2, 'CHEVILLOTTE'),
(5, 'GENERALI'),
(4, 'JEAN CARTIER'),
(3, 'PREFECTURE');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cap_contact`
--
ALTER TABLE `cap_contact`
  ADD PRIMARY KEY (`CAP_CONTACT_ID`),
  ADD KEY `VK_cap_contact_4SD5510P` (`CAP_CONTACT_LIB`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `cap_contact`
--
ALTER TABLE `cap_contact`
  MODIFY `CAP_CONTACT_ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
