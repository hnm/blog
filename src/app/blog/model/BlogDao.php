<?php
namespace blog\model;

use n2n\context\RequestScoped;
use n2n\persistence\orm\EntityManager;
use n2n\web\http\Request;
use blog\bo\BlogArticle;

class BlogDao implements RequestScoped {
	private $em;
	private $request;
	
	private function _init(EntityManager $em, Request $request) {
		$this->em = $em;
		$this->request = $request;
	}
		
	/**
	 * @param int $num
	 * @param array $excludeBlogArticles
	 * @param bool $randomOrder
	 * @return BlogArticle []
	 */
	public function getBlogArticles(int $num = null, array $excludeBlogArticles = null, bool $randomOrder = false) {
		$criteria = $this->em->createNqlCriteria('SELECT ba FROM BlogArticle ba WHERE ba.online = :online AND ba.n2nLocale = :n2nLocale', 
				['online' => true, 'n2nLocale' => $this->request->getN2nLocale()])->limit($num);
		if (!empty($excludeBlogArticles)) {
			$criteria->where()->andMatch('ba', 'NOT IN', $excludeBlogArticles);
		}
		if ($randomOrder) {
			$criteria->order('RAND()');
		} else {
			$criteria->order('ba.createdDate', 'DESC');
		}
		
		return $criteria->toQuery()->fetchArray();
	}
	
	/**
	 * @param string $pathPart
	 * @return BlogArticle
	 */
	public function getBlogArticleByPathPart(string $pathPart) {
		return $this->em->createNqlCriteria('SELECT ba FROM BlogArticle ba 
								WHERE ba.online = :online 
										AND ba.pathPart = :pathPart 
										AND ba.n2nLocale = :n2nLocale', 
						['online' => true, 'pathPart' => $pathPart, 'n2nLocale' => $this->request->getN2nLocale()])
				->toQuery()->fetchSingle();
	}
}