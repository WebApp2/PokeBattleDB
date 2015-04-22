-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2015 at 12:31 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pkmngame`
--

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

CREATE TABLE IF NOT EXISTS `guest` (
  `username` int(11) NOT NULL,
  `guest_pokemon_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `moves`
--

CREATE TABLE IF NOT EXISTS `moves` (
  `attack_type_pk` int(11) NOT NULL,
  `attack_name` char(11) NOT NULL,
  `base_damage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `moves`
--

INSERT INTO `moves` (`attack_type_pk`, `attack_name`, `base_damage`) VALUES
(1, 'Bubble', 5),
(2, 'Ember', 5),
(3, 'Absorb', 3);

-- --------------------------------------------------------

--
-- Table structure for table `pokemon`
--

CREATE TABLE IF NOT EXISTS `pokemon` (
  `name` varchar(30) NOT NULL,
  `health` int(11) NOT NULL,
  `attack` int(11) NOT NULL,
`pokemon_id` int(11) NOT NULL,
  `pokemon_type` int(11) NOT NULL,
  `experience` int(11) NOT NULL,
  `i_choose_you` tinyint(4) NOT NULL,
  `image_url` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pokemon`
--

INSERT INTO `pokemon` (`name`, `health`, `attack`, `pokemon_id`, `pokemon_type`, `experience`, `i_choose_you`, `image_url`) VALUES
('Bulbasaur', 45, 49, 1, 3, 0, 0, 'http://i1381.photobucket.com/albums/ah212/rnice01/bulbasaur_zpsjho2pzlc.jpg'),
('Ivysaur', 60, 49, 2, 3, 10, 0, 'http://i1381.photobucket.com/albums/ah212/rnice01/ivysaur_zpsr5yhydsz.jpg'),
('Venusaur', 80, 82, 3, 3, 20, 0, 'http://i1381.photobucket.com/albums/ah212/rnice01/venusaur_zpse4uumqqk.jpg'),
('Charmander', 39, 52, 4, 2, 0, 0, 'http://i1381.photobucket.com/albums/ah212/rnice01/charmander_zpsuow9rnpb.jpg'),
('Charmeleon', 58, 64, 5, 2, 10, 0, 'http://i1381.photobucket.com/albums/ah212/rnice01/charmeleon_zpsgyfeae3i.jpg'),
('Charizard', 78, 84, 6, 2, 20, 0, 'http://i1381.photobucket.com/albums/ah212/rnice01/charizard_zpsfqdw6d8a.jpg'),
('Squirtle', 44, 48, 7, 1, 0, 0, 'http://i1381.photobucket.com/albums/ah212/rnice01/squirtle_zpsay4iclgd.jpg'),
('Wartortle', 59, 63, 8, 1, 10, 0, 'http://i1381.photobucket.com/albums/ah212/rnice01/wartortle_zpsyesxk1qi.jpg'),
('Blastoise', 79, 83, 9, 1, 20, 0, 'http://i1381.photobucket.com/albums/ah212/rnice01/blastoise_zps4efdz1mt.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `username` tinyblob NOT NULL,
  `password` tinyblob NOT NULL,
  `user_pokemon_fk` int(11) NOT NULL,
  `user_experience` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_pokemon`
--

CREATE TABLE IF NOT EXISTS `user_pokemon` (
  `user_id` int(11) NOT NULL,
  `pokemon_name` text NOT NULL,
  `pokemon_health` int(11) NOT NULL,
  `pokemon_attack` int(11) NOT NULL,
  `pokemon_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `moves`
--
ALTER TABLE `moves`
 ADD PRIMARY KEY (`attack_type_pk`);

--
-- Indexes for table `pokemon`
--
ALTER TABLE `pokemon`
 ADD PRIMARY KEY (`pokemon_id`), ADD KEY `pokemon_type` (`pokemon_type`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD KEY `user_pokemon_fk` (`user_pokemon_fk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pokemon`
--
ALTER TABLE `pokemon`
MODIFY `pokemon_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `pokemon`
--
ALTER TABLE `pokemon`
ADD CONSTRAINT `pokemon_ibfk_1` FOREIGN KEY (`pokemon_type`) REFERENCES `moves` (`attack_type_pk`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`user_pokemon_fk`) REFERENCES `pokemon` (`pokemon_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
