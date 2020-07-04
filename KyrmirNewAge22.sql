-- Adminer 4.0.3 MySQL dump

SET NAMES utf8;

DROP TABLE IF EXISTS `BanList`;
CREATE TABLE `BanList` (
  `nick` char(55) NOT NULL,
  `reason` char(255) DEFAULT NULL,
  `ip` char(55) NOT NULL,
  `mac` char(55) DEFAULT NULL,
  `nmd5` char(55) NOT NULL,
  `nnick` char(55) NOT NULL DEFAULT 'Anty-Cheat',
  PRIMARY KEY (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `lanczer`;
CREATE TABLE `lanczer` (
  `nick` char(255) NOT NULL,
  `online` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `player`;
CREATE TABLE `player` (
  `nick` char(20) NOT NULL DEFAULT '',
  `world` char(40) DEFAULT NULL,
  `pos_x` double DEFAULT NULL,
  `pos_y` double DEFAULT NULL,
  `pos_z` double DEFAULT NULL,
  `angle` int(11) DEFAULT NULL,
  `body` int(11) DEFAULT NULL,
  `head_model` char(20) DEFAULT NULL,
  `head_texture` int(11) DEFAULT NULL,
  `fat` float DEFAULT NULL,
  `exp` int(11) DEFAULT NULL,
  `exp_next_lvl` int(11) DEFAULT NULL,
  `lvl` int(11) DEFAULT NULL,
  `PN` int(11) DEFAULT NULL,
  `hp` int(11) DEFAULT NULL,
  `max_hp` int(11) DEFAULT NULL,
  `mp` int(11) DEFAULT NULL,
  `max_mp` int(11) DEFAULT NULL,
  `magic_lvl` int(11) DEFAULT NULL,
  `skill_1h` int(11) DEFAULT NULL,
  `skill_2h` int(11) DEFAULT NULL,
  `skill_bow` int(11) DEFAULT NULL,
  `skill_cbow` int(11) DEFAULT NULL,
  `str` int(11) DEFAULT NULL,
  `dex` int(11) DEFAULT NULL,
  `acrobatic` int(1) DEFAULT NULL,
  `science_0` int(1) DEFAULT NULL,
  `science_1` int(1) DEFAULT NULL,
  `science_2` int(1) DEFAULT NULL,
  `science_3` int(1) DEFAULT NULL,
  `science_4` int(1) DEFAULT NULL,
  `science_5` int(1) DEFAULT NULL,
  `science_6` int(1) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `pk` int(11) DEFAULT NULL,
  `playerkill` int(11) DEFAULT NULL,
  `monsterkill` int(11) DEFAULT NULL,
  `pvp_win` int(11) DEFAULT NULL,
  `pvp_lose` int(11) DEFAULT NULL,
  `body_model` char(20) DEFAULT NULL,
  `gold` bigint(20) DEFAULT NULL,
  `online` tinyint(4) NOT NULL DEFAULT '0',
  `VIP` char(10) NOT NULL DEFAULT 'false',
  PRIMARY KEY (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `player_hunt`;
CREATE TABLE `player_hunt` (
  `nick` char(20) NOT NULL DEFAULT '',
  `hunt` int(11) DEFAULT NULL,
  `hunt_lvl` int(11) DEFAULT NULL,
  `hunt_0` int(11) DEFAULT NULL,
  `hunt_1` int(11) DEFAULT NULL,
  `hunt_2` int(11) DEFAULT NULL,
  `hunt_3` int(11) DEFAULT NULL,
  `hunt_4` int(11) DEFAULT NULL,
  PRIMARY KEY (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `player_npc`;
CREATE TABLE `player_npc` (
  `nick` char(20) NOT NULL DEFAULT '',
  `Farim` int(11) DEFAULT NULL,
  `Blyth` int(11) DEFAULT NULL,
  `Will` int(11) DEFAULT NULL,
  `Bob` int(11) DEFAULT NULL,
  `Fred` int(11) DEFAULT NULL,
  `Eowina` int(11) DEFAULT NULL,
  `Tyrion` int(11) DEFAULT NULL,
  `Eomer` int(11) DEFAULT NULL,
  `Brandon` int(11) DEFAULT NULL,
  `Bethan` int(11) DEFAULT NULL,
  `Crosss` int(11) DEFAULT NULL,
  `Hagan` int(11) DEFAULT NULL,
  `Guy` int(11) DEFAULT NULL,
  `Brain` int(11) DEFAULT NULL,
  `Nieznajomy` int(11) DEFAULT NULL,
  `Rafer` int(11) DEFAULT NULL,
  `Jenifer` int(11) DEFAULT NULL,
  `Dirkland` int(11) DEFAULT NULL,
  `Greth` int(11) DEFAULT NULL,
  `Cahan` int(11) DEFAULT NULL,
  `Regin` int(11) DEFAULT NULL,
  `Magnus` int(11) DEFAULT NULL,
  PRIMARY KEY (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `player_pot`;
CREATE TABLE `player_pot` (
  `nick` char(20) NOT NULL DEFAULT '',
  `pot_0` int(1) DEFAULT NULL,
  `pot_1` int(1) DEFAULT NULL,
  `pot_2` int(1) DEFAULT NULL,
  `pot_3` int(1) DEFAULT NULL,
  `pot_4` int(1) DEFAULT NULL,
  `pot_5` int(1) DEFAULT NULL,
  `pot_6` int(1) DEFAULT NULL,
  `pot_7` int(1) DEFAULT NULL,
  PRIMARY KEY (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `player_trophy`;
CREATE TABLE `player_trophy` (
  `nick` char(20) NOT NULL DEFAULT '',
  `Pazury` int(11) DEFAULT NULL,
  `Zuwaczki` int(11) DEFAULT NULL,
  `Plyty` int(11) DEFAULT NULL,
  `Skora` int(11) DEFAULT NULL,
  `Kly` int(11) DEFAULT NULL,
  `Rog` int(11) DEFAULT NULL,
  `Serca` int(11) DEFAULT NULL,
  `Jezyki` int(11) DEFAULT NULL,
  `Krew` int(11) DEFAULT NULL,
  `Luski` int(11) DEFAULT NULL,
  `Kosci` int(11) DEFAULT NULL,
  `Glowy` int(11) DEFAULT NULL,
  PRIMARY KEY (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 2014-03-16 15:59:45
