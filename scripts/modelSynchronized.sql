-- MySQL Workbench Synchronization
-- Generated: 2018-03-14 03:30
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: dima

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `game` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `game`.`account` (
  `a_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `a_nick` VARCHAR(16) NOT NULL,
  `a_email` VARCHAR(100) NOT NULL,
  `a_password` VARCHAR(32) NOT NULL,
  `a_create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `a_gold` INT(10) UNSIGNED NULL DEFAULT 0,
  `a_country` VARCHAR(20) NULL DEFAULT NULL,
  `a_type_id` INT(10) UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`a_id`),
  INDEX `fk_account_account_type1_idx` (`a_type_id` ASC),
  INDEX `idx_get_ingo` (`a_nick` ASC, `a_country` ASC, `a_type_id` ASC),
  CONSTRAINT `fk_account_account_type1`
    FOREIGN KEY (`a_type_id`)
    REFERENCES `game`.`account_type` (`at_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `game`.`account_type` (
  `at_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `at_name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`at_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `game`.`chat` (
  `ch_name` VARCHAR(50) NOT NULL,
  `ch_create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `ch_gamer_id` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`ch_name`),
  INDEX `fk_chat_account1_idx` (`ch_gamer_id` ASC),
  CONSTRAINT `fk_chat_account1`
    FOREIGN KEY (`ch_gamer_id`)
    REFERENCES `game`.`account` (`a_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `game`.`battle` (
  `b_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `b_map` INT(10) UNSIGNED NOT NULL,
  `b_result` INT(11) NULL DEFAULT 0,
  `b_type` INT(10) UNSIGNED NOT NULL,
  `b_duration` INT(10) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`b_id`, `b_map`, `b_type`),
  INDEX `fk_battle_battle_type_idx` (`b_type` ASC),
  INDEX `key_map_idx` (`b_map` ASC),
  CONSTRAINT `key_type`
    FOREIGN KEY (`b_type`)
    REFERENCES `game`.`battle_type` (`bt_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `key_map`
    FOREIGN KEY (`b_map`)
    REFERENCES `game`.`map` (`m_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `game`.`battle_type` (
  `bt_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `bt_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`bt_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `game`.`complaint` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `submitted` INT(10) UNSIGNED NOT NULL,
  `violator` INT(10) UNSIGNED NOT NULL,
  `type` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `type`, `violator`, `submitted`),
  INDEX `jisd_idx` (`submitted` ASC),
  INDEX `key_complaint_type_idx` (`type` ASC),
  INDEX ` key2_idx` (`violator` ASC),
  CONSTRAINT `key`
    FOREIGN KEY (`submitted`)
    REFERENCES `game`.`account` (`a_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT ` key2`
    FOREIGN KEY (`violator`)
    REFERENCES `game`.`account` (`a_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `key_complaint_type`
    FOREIGN KEY (`type`)
    REFERENCES `game`.`complaint_type` (`ct_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `game`.`list_gamer_clan_post` (
  `id_gamer` INT(10) UNSIGNED NOT NULL,
  `id_clan` INT(10) UNSIGNED NOT NULL,
  `id_post` INT(10) UNSIGNED NULL DEFAULT 0,
  INDEX `fk_list_clan` (`id_clan` ASC),
  INDEX `fk_list_post` (`id_post` ASC),
  PRIMARY KEY (`id_gamer`, `id_clan`),
  CONSTRAINT `fk_gamer`
    FOREIGN KEY (`id_gamer`)
    REFERENCES `game`.`account` (`a_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_clan`
    FOREIGN KEY (`id_clan`)
    REFERENCES `game`.`clan` (`cl_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_post`
    FOREIGN KEY (`id_post`)
    REFERENCES `game`.`post_type` (`pt_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `game`.`clan` (
  `cl_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cl_tag` VARCHAR(45) NOT NULL,
  `cl_create_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cl_id`),
  INDEX `idx_clan` (`cl_tag` ASC, `cl_create_date` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `game`.`post_type` (
  `pt_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pt_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`pt_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `game`.`complaint_type` (
  `ct_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ct_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ct_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `game`.`map` (
  `m_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `m_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`m_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `game`.`list_gamer_battle` (
  `lgb_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lgb_battle_id` INT(10) UNSIGNED NOT NULL,
  `lgb_gamer_id` INT(10) UNSIGNED NOT NULL,
  `lgb_respawn` BIT(2) NOT NULL,
  `lgb_profit` INT(11) NULL DEFAULT 0,
  `lgb_start_kit` INT(10) UNSIGNED NULL DEFAULT NULL,
  INDEX `key1_idx` (`lgb_battle_id` ASC),
  INDEX `key2_idx` (`lgb_gamer_id` ASC),
  PRIMARY KEY (`lgb_id`, `lgb_battle_id`, `lgb_gamer_id`),
  INDEX `key3_idx` (`lgb_start_kit` ASC),
  INDEX `idx_profit` (`lgb_profit` ASC),
  CONSTRAINT `key1`
    FOREIGN KEY (`lgb_battle_id`)
    REFERENCES `game`.`battle` (`b_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `key2`
    FOREIGN KEY (`lgb_gamer_id`)
    REFERENCES `game`.`account` (`a_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `key3`
    FOREIGN KEY (`lgb_start_kit`)
    REFERENCES `game`.`kit` (`k_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `game`.`kit` (
  `k_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `k_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`k_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


DELIMITER $$
USE `game`$$
CREATE PROCEDURE `routine1` ()
BEGIN
	
END$$

DELIMITER ;

DELIMITER $$

USE `game`$$
CREATE DEFINER = CURRENT_USER TRIGGER `game`.`account_BEFORE_INSERT` BEFORE INSERT ON `account` FOR EACH ROW
BEGIN

	#NEW.a_create_time = TimeStamp;
    -- coment
    #coment
    /*
    coment
    */
END$$

USE `game`$$
CREATE DEFINER = CURRENT_USER TRIGGER `game`.`chat_BEFORE_INSERT` BEFORE INSERT ON `chat` FOR EACH ROW
BEGIN

	-- create_time = currentTime;
END$$

USE `game`$$
CREATE DEFINER = CURRENT_USER TRIGGER `game`.`list_gamer_battle_BEFORE_INSERT` BEFORE INSERT ON `list_gamer_battle` FOR EACH ROW
BEGIN
	#DECLARE add INT();
	#@add=NEW.lgb_profit;
	IF NEW.lgb_profit > 0 THEN
		UPDATE account SET a_gold= (account.a_gold + NEW.lgb_profit ) 
        WHERE accound.a_id=NEW.lgb_gamer_id;
    END IF;
    /*
	select * from list_gamer_battle where NEW.lgb_gamer_id = 1;
	#gamer_id->gold += profit;
	DECLARE msg VARCHAR(255);
    IF EXISTS(SELECT * 
				FROM Tariff_plane_enable AS TPE 
                WHERE (TPE.Id = NEW.Account_Id AND TPE.Tariff_plane_disable_Id IS NOT NULL)
                LIMIT 1) THEN
        set msg = "Error: cannot enable tariff because tariff is already enabled to this account";
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;*/
END$$


DELIMITER ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
