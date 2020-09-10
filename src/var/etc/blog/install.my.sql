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


DROP TABLE IF EXISTS `blog_article_categories`;
CREATE TABLE `blog_article_categories` ( 
	`blog_article_id` INT NOT NULL, 
	`blog_category_id` INT NOT NULL, 
	PRIMARY KEY (`blog_article_id`, `blog_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_general_ci ;


DROP TABLE IF EXISTS `blog_article_content_items`;
CREATE TABLE `blog_article_content_items` ( 
	`blog_article_id` INT UNSIGNED NOT NULL, 
	`content_item_id` INT UNSIGNED NOT NULL, 
	PRIMARY KEY (`blog_article_id`, `content_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;


DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category` ( 
	`id` INT NOT NULL AUTO_INCREMENT, 
	`order_index` INT NULL DEFAULT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_general_ci ;


DROP TABLE IF EXISTS `blog_category_t`;
CREATE TABLE `blog_category_t` ( 
	`id` INT NOT NULL AUTO_INCREMENT, 
	`name` VARCHAR(255) NULL DEFAULT NULL, 
	`blog_category_id` INT NULL DEFAULT NULL, 
	`n2n_locale` VARCHAR(12) NULL DEFAULT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_general_ci ;
ALTER TABLE `blog_category_t` ADD INDEX `blog_category_t_index_1` (`blog_category_id`);


DROP TABLE IF EXISTS `blog_page_controller`;
CREATE TABLE `blog_page_controller` ( 
	`id` INT NOT NULL, 
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;
