<?php
namespace blog\bo;

use n2n\web\http\orm\ResponseCacheClearer;
use page\annotation\AnnoPage;
use page\annotation\AnnoPageCiPanels;
use n2n\reflection\annotation\AnnoInit;
use n2n\persistence\orm\annotation\AnnoEntityListeners;
use n2n\persistence\orm\annotation\AnnoTable;
use page\bo\PageController;
use n2n\web\http\PageNotFoundException;
use blog\model\BlogDao;

class BlogPageController extends PageController {
	private static function _annos(AnnoInit $ai) {
		$ai->c(new AnnoEntityListeners(ResponseCacheClearer::getClass()), new AnnoTable('blog_page_controller'));
		$ai->m('blog', new AnnoPage(), new AnnoPageCiPanels('top', 'bottom'));
	}

	public function blog(BlogDao $blogDao, $pathPart = null) {	
		$this->assignHttpCacheControl(new \DateInterval('PT30M'));
		
		if (null !== $pathPart) {
			$this->assignResponseCacheControl(new \DateInterval('P30D'));
			$blogArticle = $blogDao->getBlogArticleByPathPart($pathPart);
			
			if (null === $blogArticle) {
				throw new PageNotFoundException('Invalid blog article path part: ' . $pathPart);
			}
			
			$this->forward('..\view\blogArticle.html', ['blogArticle' => $blogArticle]);
			return;
		}
		
		$this->assignResponseCacheControl(new \DateInterval('P1D'));
		$this->forward('..\view\blogArticles.html');
	}
}