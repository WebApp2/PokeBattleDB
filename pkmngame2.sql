-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2015 at 04:46 AM
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
  `image_url` text NOT NULL,
  `color` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pokemon`
--

INSERT INTO `pokemon` (`name`, `health`, `attack`, `pokemon_id`, `pokemon_type`, `experience`, `i_choose_you`, `image_url`, `color`) VALUES
('Bulbasaur', 40, 10, 1, 3, 0, 22, 'http://i1381.photobucket.com/albums/ah212/rnice01/bulbasaur_zpsjho2pzlc.jpg', '#00CC99'),
('Ivysaur', 60, 20, 2, 3, 10, 8, 'http://i1381.photobucket.com/albums/ah212/rnice01/ivysaur_zpsr5yhydsz.jpg', '#00CC00'),
('Venusaur', 80, 30, 3, 3, 20, 15, 'http://i1381.photobucket.com/albums/ah212/rnice01/venusaur_zpse4uumqqk.jpg', '#006600'),
('Charmander', 40, 10, 4, 2, 0, 11, 'http://i1381.photobucket.com/albums/ah212/rnice01/charmander_zpsuow9rnpb.jpg', '#FF6600'),
('Charmeleon', 60, 20, 5, 2, 10, 56, 'http://i1381.photobucket.com/albums/ah212/rnice01/charmeleon_zpsgyfeae3i.jpg', '#FF3300'),
('Charizard', 80, 30, 6, 2, 20, 110, 'http://i1381.photobucket.com/albums/ah212/rnice01/charizard_zpsfqdw6d8a.jpg', '#FF0000'),
('Squirtle', 40, 10, 7, 1, 0, 67, 'http://i1381.photobucket.com/albums/ah212/rnice01/squirtle_zpsay4iclgd.jpg', '#0099CC'),
('Wartortle', 60, 20, 8, 1, 10, 44, 'http://i1381.photobucket.com/albums/ah212/rnice01/wartortle_zpsyesxk1qi.jpg', '#0066CC'),
('Blastoise', 80, 30, 9, 1, 20, 98, 'http://i1381.photobucket.com/albums/ah212/rnice01/blastoise_zps4efdz1mt.jpg', '#0000CC');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) NOT NULL,
  `user_name` tinyblob NOT NULL,
  `user_pass` tinyblob NOT NULL,
  `user_pokemon_fk` int(11) NOT NULL,
  `user_experience` char(10) NOT NULL,
  `user_wins` int(11) NOT NULL,
  `user_losses` int(11) NOT NULL,
  `user_level` int(11) NOT NULL,
  `user_email` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `user_pass`, `user_pokemon_fk`, `user_experience`, `user_wins`, `user_losses`, `user_level`, `user_email`) VALUES
(1, 0x417368, '', 1, '0', 10, 2, 0, ''),
(2, 0x42726f636b, '', 2, '0', 5, 6, 0, ''),
(3, 0x4d69737479, '', 3, '0', 8, 4, 0, ''),
(4, 0x47617279, '', 4, '0', 11, 10, 0, ''),
(6, 0x526f62, '', 4, '0', 20, 19, 0, ''),
(7, 0x4672616e6b, '', 5, '0', 1, 11, 0, '');

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
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD KEY `user_pokemon_fk` (`user_pokemon_fk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pokemon`
--
ALTER TABLE `pokemon`
MODIFY `pokemon_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `pokemon`
--
ALTER TABLE `pokemon`
ADD CONSTRAINT `pokemon_ibfk_1` FOREIGN KEY (`pokemon_type`) REFERENCES `moves` (`attack_type_pk`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_pokemon_fk`) REFERENCES `pokemon` (`pokemon_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
