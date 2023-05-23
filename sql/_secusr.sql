-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  mar. 23 mai 2023 à 17:58
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
-- Structure de la table `_secusr`
--

CREATE TABLE `_secusr` (
  `SECUSR_ID` bigint(20) NOT NULL,
  `SECUSR_SECGRPID` bigint(20) NOT NULL DEFAULT 0,
  `SECUSR_LOGIN` varchar(64) NOT NULL DEFAULT '',
  `SECUSR_PWD` varchar(64) NOT NULL DEFAULT '',
  `SECUSR_VAL` datetime DEFAULT '0000-00-00 00:00:00',
  `SECUSR_SUPER` tinyint(4) NOT NULL DEFAULT 0,
  `SECUSR_HOST` varchar(255) DEFAULT '',
  `SECUSR_MAIL` varchar(255) NOT NULL DEFAULT '',
  `SECUSR_LOCK` tinyint(4) NOT NULL DEFAULT 0,
  `SECUSR_FNAME` varchar(255) NOT NULL DEFAULT '',
  `SECUSR_LNAME` varchar(255) NOT NULL DEFAULT '',
  `SECUSR_PWDTOKEN` varchar(255) NOT NULL DEFAULT '',
  `SECUSR_PWDTSTAMPTOKEN` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SECUSR_TSTAMPLASTACTION` datetime DEFAULT '0000-00-00 00:00:00',
  `SECUSR_PWDEXPDATE` datetime DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `_secusr`
--

INSERT INTO `_secusr` (`SECUSR_ID`, `SECUSR_SECGRPID`, `SECUSR_LOGIN`, `SECUSR_PWD`, `SECUSR_VAL`, `SECUSR_SUPER`, `SECUSR_HOST`, `SECUSR_MAIL`, `SECUSR_LOCK`, `SECUSR_FNAME`, `SECUSR_LNAME`, `SECUSR_PWDTOKEN`, `SECUSR_PWDTSTAMPTOKEN`, `SECUSR_TSTAMPLASTACTION`, `SECUSR_PWDEXPDATE`) VALUES
(1, 1, 'admin', '741c282961263f9ded5aa5c10e54150d', NULL, 1, '', 'support@capbureautique.fr', 0, '', '', '', '0000-00-00 00:00:00', '2023-05-23 19:38:20', '0000-00-00 00:00:00'),
(2, 3, 'Guest', '7601a80385fbfcc30ff5820b41f98134', '0000-00-00 00:00:00', 0, '', 'Guest123*', 0, 'Invité', 'Invité', '', '0000-00-00 00:00:00', '2022-07-04 17:44:32', NULL),
(3, 4, 'pme.compta', '570b96310f53a5f56d578da17a4793a9', NULL, 1, '', '', 0, '', '', '', '0000-00-00 00:00:00', '2022-06-29 17:37:26', NULL),
(4, 4, 'pme.direction', 'e2adffebe17e0ddff899cc54c8825284', '0000-00-00 00:00:00', 1, '', 'demo26*', 0, '', '', '', '0000-00-00 00:00:00', '2022-11-25 15:03:26', NULL),
(5, 4, 'pme.base', '570b96310f53a5f56d578da17a4793a9', '0000-00-00 00:00:00', 1, '', '', 0, '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 5, 'mc.maire', '3e2f4073656b2df5b02677d3d044add6', '0000-00-00 00:00:00', 1, '', '', 0, '', '', '', '0000-00-00 00:00:00', '2023-05-09 10:56:48', NULL),
(7, 5, 'mc.dgs', '98374f16f07e8219df090ec5ed0fa58f', '0000-00-00 00:00:00', 1, '', '', 0, '', '', '', '0000-00-00 00:00:00', '2023-05-09 11:29:25', NULL),
(8, 5, 'mc.compta', '8a0c9325d65048aa8907234277fe7194', '0000-00-00 00:00:00', 1, '', '', 0, '', '', '', '0000-00-00 00:00:00', '2023-05-09 11:24:58', NULL),
(9, 5, 'mc.accueil', '801e6673474a87bb6eb2909817a1270e', '0000-00-00 00:00:00', 1, '', '', 0, '', '', '', '0000-00-00 00:00:00', '2023-05-09 11:22:09', NULL),
(10, 5, 'mc.agent', 'a5de0d89d9a7ff31b14d613c9ad382ec', '0000-00-00 00:00:00', 1, '', '', 0, 'mc.agent', '', '', '0000-00-00 00:00:00', '2023-04-03 11:55:38', NULL),
(11, 4, 'pme', 'f77ff23a000d4160e8b0ca702f250385', NULL, 1, '', 'admin', 0, 'test', 'ar', '', '0000-00-00 00:00:00', NULL, NULL),
(12, 4, 'demo.client', '2902c6868476c20abad6146201be1adc', '2021-12-31 00:00:00', 0, '', '', 0, 'mdp 4rG29@P&c', '', '', '0000-00-00 00:00:00', '2021-03-03 18:22:23', NULL),
(13, 11, 'IMPERIATEC', 'dd61f108af8def4e56b996dd49d66631', NULL, 0, '', '', 0, '', '', '', '0000-00-00 00:00:00', '2022-03-17 17:58:38', NULL),
(15, 0, 'SuperAdmin', '30900d33e8d786ff5e5fab9df19c34c6', '0000-00-00 00:00:00', 1, '', 'oupsi@gmail.com', 0, '', '', '', '0000-00-00 00:00:00', '2022-06-30 10:02:39', '0000-00-00 00:00:00'),
(19, 2, 'demo_celio', '31d966e11d4d4a886a884a312fa33298', NULL, 1, '', '', 0, 'Celio', 'Poncet', '', '0000-00-00 00:00:00', '2023-05-23 15:33:20', NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `_secusr`
--
ALTER TABLE `_secusr`
  ADD PRIMARY KEY (`SECUSR_ID`),
  ADD UNIQUE KEY `SECUSR_KLOGINU` (`SECUSR_LOGIN`),
  ADD KEY `SECUSR_KLOGIN` (`SECUSR_SECGRPID`),
  ADD KEY `SECUSR_KGRPID` (`SECUSR_LOGIN`,`SECUSR_PWD`,`SECUSR_LOCK`),
  ADD KEY `SECUSR_KSUPER` (`SECUSR_SUPER`),
  ADD KEY `SECUSR_KLOCK` (`SECUSR_LOGIN`,`SECUSR_LOCK`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `_secusr`
--
ALTER TABLE `_secusr`
  MODIFY `SECUSR_ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
