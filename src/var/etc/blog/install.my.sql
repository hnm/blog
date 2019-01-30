CREATE TABLE IF NOT EXISTS `blog_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `path_part` varchar(255) DEFAULT NULL,
  `file_image` varchar(255) DEFAULT NULL,
  `intro` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `n2n_locale` varchar(12) DEFAULT NULL,
  `online` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `blog_article_content_items` (
  `blog_article_id` int(10) unsigned NOT NULL,
  `content_item_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`blog_article_id`,`content_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `blog_page_controller` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;