-- Mysql Backup of mdl_blog
-- Date 2020-09-09T19:48:10+02:00
-- Backup by 

DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article` ( 
	`id` INT NOT NULL AUTO_INCREMENT, 
	`title` VARCHAR(255) NULL DEFAULT NULL, 
	`path_part` VARCHAR(255) NULL DEFAULT NULL, 
	`file_image` VARCHAR(255) NULL DEFAULT NULL, 
	`intro` VARCHAR(255) NULL DEFAULT NULL, 
	`created_date` DATETIME NULL DEFAULT NULL, 
	`n2n_locale` VARCHAR(12) NULL DEFAULT NULL, 
	`online` TINYINT UNSIGNED NULL DEFAULT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;

INSERT INTO `blog_article` (`id`, `title`, `path_part`, `file_image`, `intro`, `created_date`, `n2n_locale`, `online`) 
VALUES ( '1',  'Newsmodule for n2n',  'newsmodule-for-n2n',  NULL,  'Read all about our newsmodule',  '2019-01-30 00:00:00',  'en',  '1'),
( '2', 'Newsmodule für n2n', 'newsmodule-for-n2n-2', NULL, 'Lese alles über unser Newsmodul', '2019-01-30 00:00:00', 'de_CH', '1'),
( '3', 'News Module has Categories now', 'news-module-has-categories-now', NULL, 'You can use Categories for news', '2020-09-09 00:00:00', 'en', '1');

DROP TABLE IF EXISTS `blog_article_categories`;
CREATE TABLE `blog_article_categories` ( 
	`blog_article_id` INT NOT NULL, 
	`blog_category_id` INT NOT NULL, 
	PRIMARY KEY (`blog_article_id`, `blog_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_general_ci ;

INSERT INTO `blog_article_categories` (`blog_article_id`, `blog_category_id`) 
VALUES ( '1',  '1'),
( '1', '2'),
( '2', '1'),
( '2', '2'),
( '3', '1');

DROP TABLE IF EXISTS `blog_article_content_items`;
CREATE TABLE `blog_article_content_items` ( 
	`blog_article_id` INT UNSIGNED NOT NULL, 
	`content_item_id` INT UNSIGNED NOT NULL, 
	PRIMARY KEY (`blog_article_id`, `content_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;

INSERT INTO `blog_article_content_items` (`blog_article_id`, `content_item_id`) 
VALUES ( '1',  '1'),
( '2', '2');

DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category` ( 
	`id` INT NOT NULL AUTO_INCREMENT, 
	`order_index` INT NULL DEFAULT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_general_ci ;

INSERT INTO `blog_category` (`id`, `order_index`) 
VALUES ( '1',  '10'),
( '2', '20');

DROP TABLE IF EXISTS `blog_category_t`;
CREATE TABLE `blog_category_t` ( 
	`id` INT NOT NULL AUTO_INCREMENT, 
	`name` VARCHAR(255) NULL DEFAULT NULL, 
	`blog_category_id` INT NULL DEFAULT NULL, 
	`n2n_locale` VARCHAR(12) NULL DEFAULT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_general_ci ;
ALTER TABLE `blog_category_t` ADD INDEX `blog_category_t_index_1` (`blog_category_id`);

INSERT INTO `blog_category_t` (`id`, `name`, `blog_category_id`, `n2n_locale`) 
VALUES ( '1',  'Product',  '1',  'en'),
( '2', 'Produkt', '1', 'de_CH'),
( '3', 'Company', '2', 'en'),
( '4', 'Firma', '2', 'de_CH');

DROP TABLE IF EXISTS `blog_page_controller`;
CREATE TABLE `blog_page_controller` ( 
	`id` INT NOT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;

INSERT INTO `blog_page_controller` (`id`) 
VALUES ( '1');

DROP TABLE IF EXISTS `bstmpl_contact_page_controller`;
CREATE TABLE `bstmpl_contact_page_controller` ( 
	`id` INT NOT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;


DROP TABLE IF EXISTS `bstmpl_default_page_controller`;
CREATE TABLE `bstmpl_default_page_controller` ( 
	`id` INT NOT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;


DROP TABLE IF EXISTS `bstmpl_start_page_controller`;
CREATE TABLE `bstmpl_start_page_controller` ( 
	`id` INT NOT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;


DROP TABLE IF EXISTS `ci_accordion`;
CREATE TABLE `ci_accordion` ( 
	`id` INT NOT NULL, 
	`title` VARCHAR(255) NULL DEFAULT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;


DROP TABLE IF EXISTS `ci_accordion_content_items`;
CREATE TABLE `ci_accordion_content_items` ( 
	`ci_accordion_id` INT UNSIGNED NOT NULL, 
	`content_item_id` INT UNSIGNED NOT NULL, 
	PRIMARY KEY (`ci_accordion_id`, `content_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;


DROP TABLE IF EXISTS `ci_anchor`;
CREATE TABLE `ci_anchor` ( 
	`id` INT UNSIGNED NOT NULL, 
	`title` VARCHAR(255) NULL DEFAULT NULL, 
	`path_part` VARCHAR(255) NULL DEFAULT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;


DROP TABLE IF EXISTS `ci_article`;
CREATE TABLE `ci_article` ( 
	`id` INT UNSIGNED NOT NULL, 
	`title` VARCHAR(255) NULL DEFAULT NULL, 
	`description_html` TEXT NULL DEFAULT NULL, 
	`file_image` VARCHAR(255) NOT NULL, 
	`pic_pos` ENUM('left','right') NOT NULL DEFAULT 'left', 
	`open_lytebox` TINYINT NULL DEFAULT NULL, 
	`expl_page_link_id` INT NULL DEFAULT NULL, 
	`alt_tag` VARCHAR(255) NULL DEFAULT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;
ALTER TABLE `ci_article` ADD INDEX `expl_page_link_id` (`expl_page_link_id`);


DROP TABLE IF EXISTS `ci_attachment`;
CREATE TABLE `ci_attachment` ( 
	`id` INT UNSIGNED NOT NULL, 
	`name` VARCHAR(255) NULL DEFAULT NULL, 
	`description` VARCHAR(255) NULL DEFAULT NULL, 
	`file` VARCHAR(255) NOT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci ;


DROP TABLE IF EXISTS `ci_cke`;
CREATE TABLE `ci_cke` ( 
	`id` INT UNSIGNED NOT NULL, 
	`content_html` TEXT NOT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci ;

INSERT INTO `ci_cke` (`id`, `content_html`) 
VALUES ( '1',  '<p>asdfadsf</p>\r\n'),
( '2', '<p>asdfadsf</p>\r\n');

DROP TABLE IF EXISTS `ci_google_maps`;
CREATE TABLE `ci_google_maps` ( 
	`id` INT NOT NULL, 
	`lat` VARCHAR(255) NULL DEFAULT NULL, 
	`lng` VARCHAR(255) NULL DEFAULT NULL, 
	`title` VARCHAR(255) NULL DEFAULT NULL, 
	`description` TEXT NULL DEFAULT NULL, 
	`zoom` INT NULL DEFAULT NULL, 
	`show_info_window` TINYINT NOT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci ;


DROP TABLE IF EXISTS `ci_html_snippet`;
CREATE TABLE `ci_html_snippet` ( 
	`id` INT UNSIGNED NOT NULL, 
	`html` TEXT NOT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci ;


DROP TABLE IF EXISTS `ci_image`;
CREATE TABLE `ci_image` ( 
	`id` INT NOT NULL, 
	`caption` VARCHAR(255) NULL DEFAULT NULL, 
	`expl_page_link_id` INT NULL DEFAULT NULL, 
	`file_image` VARCHAR(255) NULL DEFAULT NULL, 
	`alt_tag` VARCHAR(255) NULL DEFAULT NULL, 
	`format` VARCHAR(255) NULL DEFAULT NULL, 
	`alignment` VARCHAR(255) NULL DEFAULT NULL, 
	`open_lytebox` VARCHAR(255) NULL DEFAULT NULL, 
	`nested_ci_type` VARCHAR(255) NULL DEFAULT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;
ALTER TABLE `ci_image` ADD INDEX `expl_page_link_id` (`expl_page_link_id`);


DROP TABLE IF EXISTS `ci_nested_content_item`;
CREATE TABLE `ci_nested_content_item` ( 
	`id` INT NOT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;

INSERT INTO `ci_nested_content_item` (`id`) 
VALUES ( '1'),
( '2');

DROP TABLE IF EXISTS `ci_simple_map`;
CREATE TABLE `ci_simple_map` ( 
	`id` INT NOT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;


DROP TABLE IF EXISTS `ci_three_columns`;
CREATE TABLE `ci_three_columns` ( 
	`id` INT NOT NULL, 
	`alignment` VARCHAR(255) NULL DEFAULT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;


DROP TABLE IF EXISTS `ci_three_columns_content_items`;
CREATE TABLE `ci_three_columns_content_items` ( 
	`ci_three_columns_id` INT UNSIGNED NOT NULL, 
	`nested_content_item_id` INT UNSIGNED NOT NULL, 
	PRIMARY KEY (`ci_three_columns_id`, `nested_content_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;


DROP TABLE IF EXISTS `ci_two_columns`;
CREATE TABLE `ci_two_columns` ( 
	`id` INT NOT NULL, 
	`alignment` VARCHAR(255) NULL DEFAULT NULL, 
	`splitting` VARCHAR(255) NULL DEFAULT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;


DROP TABLE IF EXISTS `ci_two_columns_content_items`;
CREATE TABLE `ci_two_columns_content_items` ( 
	`ci_two_columns_id` INT UNSIGNED NOT NULL, 
	`nested_content_item_id` INT UNSIGNED NOT NULL, 
	PRIMARY KEY (`ci_two_columns_id`, `nested_content_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;


DROP TABLE IF EXISTS `ci_youtube`;
CREATE TABLE `ci_youtube` ( 
	`id` INT UNSIGNED NOT NULL, 
	`youtube_id` VARCHAR(32) NOT NULL, 
	`nested_ci_type` VARCHAR(50) NULL DEFAULT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci ;


DROP TABLE IF EXISTS `expl_page_link`;
CREATE TABLE `expl_page_link` ( 
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	`type` VARCHAR(255) NULL DEFAULT NULL, 
	`linked_page_id` INT UNSIGNED NULL DEFAULT NULL, 
	`url` VARCHAR(255) NULL DEFAULT NULL, 
	`show_explicit` VARCHAR(255) NULL DEFAULT NULL, 
	`label` VARCHAR(255) NULL DEFAULT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;
ALTER TABLE `expl_page_link` ADD INDEX `expl_page_link_index_1` (`linked_page_id`);


DROP TABLE IF EXISTS `page`;
CREATE TABLE `page` ( 
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	`internal_page_id` INT UNSIGNED NULL DEFAULT NULL, 
	`external_url` VARCHAR(255) NULL DEFAULT NULL, 
	`page_content_id` INT UNSIGNED NULL DEFAULT NULL, 
	`subsystem_name` VARCHAR(255) NULL DEFAULT NULL, 
	`online` TINYINT UNSIGNED NOT NULL DEFAULT 1, 
	`in_path` TINYINT NOT NULL DEFAULT 1, 
	`hook_key` VARCHAR(255) NULL DEFAULT NULL, 
	`in_navigation` TINYINT NOT NULL DEFAULT 1, 
	`nav_target_new_window` TINYINT NOT NULL DEFAULT 0, 
	`lft` INT UNSIGNED NOT NULL, 
	`rgt` INT UNSIGNED NOT NULL, 
	`last_mod` DATETIME NULL DEFAULT NULL, 
	`last_mod_by` INT UNSIGNED NULL DEFAULT NULL, 
	`indexable` TINYINT UNSIGNED NOT NULL DEFAULT 1, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;

INSERT INTO `page` (`id`, `internal_page_id`, `external_url`, `page_content_id`, `subsystem_name`, `online`, `in_path`, `hook_key`, `in_navigation`, `nav_target_new_window`, `lft`, `rgt`, `last_mod`, `last_mod_by`, `indexable`) 
VALUES ( '1',  NULL,  NULL,  '1',  NULL,  '1',  '1',  NULL,  '1',  '0',  '1',  '2',  '2020-09-09 18:20:44',  NULL,  '1');

DROP TABLE IF EXISTS `page_content`;
CREATE TABLE `page_content` ( 
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	`subsystem_name` VARCHAR(255) NULL DEFAULT NULL, 
	`page_controller_id` INT UNSIGNED NOT NULL, 
	`page_id` INT UNSIGNED NULL DEFAULT NULL, 
	`ssl` TINYINT UNSIGNED NOT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;

INSERT INTO `page_content` (`id`, `subsystem_name`, `page_controller_id`, `page_id`, `ssl`) 
VALUES ( '1',  NULL,  '1',  NULL,  '0');

DROP TABLE IF EXISTS `page_content_t`;
CREATE TABLE `page_content_t` ( 
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	`n2n_locale` VARCHAR(5) NOT NULL, 
	`se_title` VARCHAR(255) NULL DEFAULT NULL, 
	`se_description` VARCHAR(500) NULL DEFAULT NULL, 
	`se_keywords` VARCHAR(255) NULL DEFAULT NULL, 
	`page_content_id` INT UNSIGNED NOT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;
ALTER TABLE `page_content_t` ADD UNIQUE INDEX `page_content_id_n2n_locale` (`page_content_id`, `n2n_locale`);

INSERT INTO `page_content_t` (`id`, `n2n_locale`, `se_title`, `se_description`, `se_keywords`, `page_content_id`) 
VALUES ( '1',  'de_CH',  NULL,  NULL,  NULL,  '1');

DROP TABLE IF EXISTS `page_controller`;
CREATE TABLE `page_controller` ( 
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	`method_name` VARCHAR(255) NULL DEFAULT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;

INSERT INTO `page_controller` (`id`, `method_name`) 
VALUES ( '1',  'blog');

DROP TABLE IF EXISTS `page_controller_t`;
CREATE TABLE `page_controller_t` ( 
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	`n2n_locale` VARCHAR(16) NOT NULL, 
	`page_controller_id` VARCHAR(128) NULL DEFAULT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;
ALTER TABLE `page_controller_t` ADD UNIQUE INDEX `page_controller_id_n2n_locale` (`page_controller_id`, `n2n_locale`);

INSERT INTO `page_controller_t` (`id`, `n2n_locale`, `page_controller_id`) 
VALUES ( '1',  'de_CH',  '1'),
( '2', 'en', '1');

DROP TABLE IF EXISTS `page_controller_t_content_items`;
CREATE TABLE `page_controller_t_content_items` ( 
	`page_controller_t_id` INT UNSIGNED NOT NULL, 
	`content_item_id` INT UNSIGNED NOT NULL, 
	PRIMARY KEY (`page_controller_t_id`, `content_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;


DROP TABLE IF EXISTS `page_link`;
CREATE TABLE `page_link` ( 
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	`type` VARCHAR(255) NULL DEFAULT NULL, 
	`linked_page_id` INT UNSIGNED NULL DEFAULT NULL, 
	`url` VARCHAR(255) NULL DEFAULT NULL, 
	`label` VARCHAR(255) NULL DEFAULT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;
ALTER TABLE `page_link` ADD INDEX `page_link_index_1` (`linked_page_id`);


DROP TABLE IF EXISTS `page_t`;
CREATE TABLE `page_t` ( 
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	`n2n_locale` VARCHAR(12) NULL DEFAULT NULL, 
	`name` VARCHAR(255) NULL DEFAULT NULL, 
	`title` VARCHAR(255) NULL DEFAULT NULL, 
	`path_part` VARCHAR(255) NULL DEFAULT NULL, 
	`page_id` INT UNSIGNED NULL DEFAULT NULL, 
	`active` TINYINT UNSIGNED NOT NULL DEFAULT 1, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;
ALTER TABLE `page_t` ADD INDEX `path_part` (`path_part`);
ALTER TABLE `page_t` ADD INDEX `page_leaf_t_index_1` (`page_id`);

INSERT INTO `page_t` (`id`, `n2n_locale`, `name`, `title`, `path_part`, `page_id`, `active`) 
VALUES ( '1',  'de_CH',  'News',  NULL,  NULL,  '1',  '1'),
( '2', 'en', 'News', NULL, NULL, '1', '1');

DROP TABLE IF EXISTS `rocket_content_item`;
CREATE TABLE `rocket_content_item` ( 
	`id` INT NOT NULL AUTO_INCREMENT, 
	`panel` VARCHAR(32) NULL DEFAULT NULL, 
	`order_index` INT NULL DEFAULT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci ;

INSERT INTO `rocket_content_item` (`id`, `panel`, `order_index`) 
VALUES ( '1',  'main',  '20'),
( '2', 'main', '20');

DROP TABLE IF EXISTS `rocket_critmod_save`;
CREATE TABLE `rocket_critmod_save` ( 
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	`ei_type_path` VARCHAR(255) NOT NULL, 
	`name` VARCHAR(255) NOT NULL, 
	`filter_data_json` TEXT NOT NULL, 
	`sort_data_json` TEXT NULL DEFAULT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;
ALTER TABLE `rocket_critmod_save` ADD UNIQUE INDEX `name` (`name`);
ALTER TABLE `rocket_critmod_save` ADD INDEX `ei_spec_id` (`ei_type_path`);


DROP TABLE IF EXISTS `rocket_custom_grant`;
CREATE TABLE `rocket_custom_grant` ( 
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	`custom_spec_id` VARCHAR(255) NOT NULL, 
	`rocket_user_group_id` INT UNSIGNED NOT NULL, 
	`full` TINYINT UNSIGNED NOT NULL DEFAULT 1, 
	`access_json` TEXT NOT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;
ALTER TABLE `rocket_custom_grant` ADD UNIQUE INDEX `script_id_user_group_id` (`custom_spec_id`, `rocket_user_group_id`);


DROP TABLE IF EXISTS `rocket_ei_grant`;
CREATE TABLE `rocket_ei_grant` ( 
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	`ei_type_path` VARCHAR(255) NOT NULL, 
	`rocket_user_group_id` INT UNSIGNED NOT NULL, 
	`full` TINYINT UNSIGNED NOT NULL DEFAULT 1, 
	`access_json` TEXT NOT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;
ALTER TABLE `rocket_ei_grant` ADD UNIQUE INDEX `script_id_user_group_id` (`rocket_user_group_id`, `ei_type_path`);


DROP TABLE IF EXISTS `rocket_ei_grant_privileges`;
CREATE TABLE `rocket_ei_grant_privileges` ( 
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	`ei_grant_id` INT UNSIGNED NOT NULL, 
	`ei_privilege_json` TEXT NOT NULL, 
	`restricted` TINYINT NOT NULL DEFAULT 0, 
	`restriction_group_json` TEXT NULL DEFAULT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;


DROP TABLE IF EXISTS `rocket_login`;
CREATE TABLE `rocket_login` ( 
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	`nick` VARCHAR(255) NULL DEFAULT NULL, 
	`wrong_password` VARCHAR(255) NULL DEFAULT NULL, 
	`power` ENUM('superadmin','admin','none') NULL DEFAULT NULL, 
	`successfull` TINYINT UNSIGNED NOT NULL, 
	`ip` VARCHAR(255) NOT NULL DEFAULT '', 
	`date_time` DATETIME NOT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;


DROP TABLE IF EXISTS `rocket_user`;
CREATE TABLE `rocket_user` ( 
	`id` INT NOT NULL AUTO_INCREMENT, 
	`nick` VARCHAR(255) NOT NULL, 
	`firstname` VARCHAR(255) NULL DEFAULT NULL, 
	`lastname` VARCHAR(255) NULL DEFAULT NULL, 
	`email` VARCHAR(255) NULL DEFAULT NULL, 
	`power` ENUM('superadmin','admin','none') NOT NULL DEFAULT 'none', 
	`password` VARCHAR(255) NOT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;
ALTER TABLE `rocket_user` ADD UNIQUE INDEX `nick` (`nick`);

INSERT INTO `rocket_user` (`id`, `nick`, `firstname`, `lastname`, `email`, `power`, `password`) 
VALUES ( '1',  'super',  'Testerich',  'von Testen',  'testerich@von-testen.com',  'superadmin',  '$2a$07$holeradioundholeradioe5FD29ANtu4PChE8W4mZDg.D1eKkBnwq');

DROP TABLE IF EXISTS `rocket_user_access_grant`;
CREATE TABLE `rocket_user_access_grant` ( 
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	`script_id` VARCHAR(255) NOT NULL, 
	`restricted` TINYINT NOT NULL, 
	`privileges_json` TEXT NOT NULL, 
	`access_json` TEXT NOT NULL, 
	`restriction_json` TEXT NOT NULL, 
	`user_group_id` INT UNSIGNED NOT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;
ALTER TABLE `rocket_user_access_grant` ADD INDEX `user_group_id` (`user_group_id`);


DROP TABLE IF EXISTS `rocket_user_group`;
CREATE TABLE `rocket_user_group` ( 
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	`name` VARCHAR(64) NOT NULL, 
	`nav_json` TEXT NULL DEFAULT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;


DROP TABLE IF EXISTS `rocket_user_rocket_user_groups`;
CREATE TABLE `rocket_user_rocket_user_groups` ( 
	`rocket_user_id` INT UNSIGNED NOT NULL, 
	`rocket_user_group_id` INT UNSIGNED NOT NULL, 
	PRIMARY KEY (`rocket_user_id`, `rocket_user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;


DROP TABLE IF EXISTS `simple_file`;
CREATE TABLE `simple_file` ( 
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	`name` VARCHAR(128) NOT NULL, 
	`file` VARCHAR(255) NOT NULL, 
	`linkable` TINYINT UNSIGNED NOT NULL, 
	`created` DATETIME NOT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;


