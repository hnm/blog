<?php
namespace blog\bo;

use n2n\web\http\orm\ResponseCacheClearer;
use page\annotation\AnnoPage;
use page\annotation\AnnoPageCiPanels;
use n2n\reflection\annotation\AnnoInit;
use n2n\persistence\orm\annotation\AnnoEntityListeners;
use n2n\persistence\orm\annotation\AnnoTable;
use page\bo\PageController;
use blog\model\BlogDao;
use n2n\persistence\orm\annotation\AnnoManyToOne;
use blog\controller\BlogController;
use n2n\util\uri\Url;
use n2n\l10n\N2nLocale;
use page\model\nav\SitemapItem;
use n2n\persistence\orm\FetchType;
use rocket\attribute\EiType;

#[EiType]
class BlogPageController extends PageController {
	private static function _annos(AnnoInit $ai) {
		$ai->c(new AnnoEntityListeners(ResponseCacheClearer::getClass()), new AnnoTable('blog_page_controller'));
		$ai->m('blog', new AnnoPage(), new AnnoPageCiPanels('top', 'main', 'bottom'));
		$ai->p('blogCategory', new AnnoManyToOne(BlogCategory::getClass(), null, FetchType::EAGER));
	}

	private $numPerPage;
	private $blogCategory;

	public function blog(BlogController $blogController, ?array $delegateParams = null) {
		$blogController->setNumsPerPage($this->numPerPage);
		$blogController->setBlogCategory($this->blogCategory);
		
		$this->delegate($blogController);
	}

	public function getNumPerPage() {
		return $this->numPerPage;
	}

	public function setNumPerPage(?int $numPerPage = null) {
		$this->numPerPage = $numPerPage;
	}

	public function _createSitemapItems(Url $baseUrl, N2nLocale $n2nLocale, BlogDao $blogDao) {
		
		$sitemapItems = array();
		foreach ($blogDao->getNews($n2nLocale) as $newsItem) {
			$sitemapItems[] = new SitemapItem($baseUrl->pathExt($newsItem->getPathPart()));
		}
		return $sitemapItems;
	}

	public function getBlogCategory() {
		return $this->blogCategory;
	}

	public function setBlogCategory(?BlogCategory $blogCategory = null) {
		$this->blogCategory = $blogCategory;
	}
}