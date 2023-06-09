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
-- Structure de la vue `v_secusr_mairie_collectivite`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_secusr_mairie_collectivite`  AS  select `_secusr`.`SECUSR_ID` AS `V_SECUSR_MAIRIE_COLLECTIVITE_ID`,`_secusr`.`SECUSR_SECGRPID` AS `V_SECUSR_MAIRIE_COLLECTIVITE_SECGRPID`,`_secusr`.`SECUSR_LOGIN` AS `V_SECUSR_MAIRIE_COLLECTIVITE_LOGIN`,`_secusr`.`SECUSR_PWD` AS `V_SECUSR_MAIRIE_COLLECTIVITE_PWD`,`_secusr`.`SECUSR_VAL` AS `V_SECUSR_MAIRIE_COLLECTIVITE_VAL`,`_secusr`.`SECUSR_SUPER` AS `V_SECUSR_MAIRIE_COLLECTIVITE_SUPER`,`_secusr`.`SECUSR_HOST` AS `V_SECUSR_MAIRIE_COLLECTIVITE_HOST`,`_secusr`.`SECUSR_MAIL` AS `V_SECUSR_MAIRIE_COLLECTIVITE_MAIL`,`_secusr`.`SECUSR_LOCK` AS `V_SECUSR_MAIRIE_COLLECTIVITE_LOCK`,`_secusr`.`SECUSR_FNAME` AS `V_SECUSR_MAIRIE_COLLECTIVITE_FNAME`,`_secusr`.`SECUSR_LNAME` AS `V_SECUSR_MAIRIE_COLLECTIVITE_LNAME`,`_secusr`.`SECUSR_PWDTOKEN` AS `V_SECUSR_MAIRIE_COLLECTIVITE_PWDTOKEN`,`_secusr`.`SECUSR_PWDTSTAMPTOKEN` AS `V_SECUSR_MAIRIE_COLLECTIVITE_PWDTSTAMPTOKEN`,`_secusr`.`SECUSR_TSTAMPLASTACTION` AS `V_SECUSR_MAIRIE_COLLECTIVITE_TSTAMPLASTACTION`,`_secusr`.`SECUSR_PWDEXPDATE` AS `V_SECUSR_MAIRIE_COLLECTIVITE_PWDEXPDATE` from `_secusr` where `_secusr`.`SECUSR_SECGRPID` = 5 ;

--
-- VIEW  `v_secusr_mairie_collectivite`
-- Données :  Aucun(e)
--

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
