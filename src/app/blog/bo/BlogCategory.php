<?php
namespace blog\bo;

use n2n\web\http\orm\ResponseCacheClearer;
use n2n\reflection\annotation\AnnoInit;
use n2n\persistence\orm\annotation\AnnoEntityListeners;
use n2n\reflection\ObjectAdapter;
use n2n\persistence\orm\annotation\AnnoOneToMany;
use n2n\persistence\orm\annotation\AnnoManyToMany;
use rocket\attribute\EiType;
use rocket\attribute\EiMenuItem;
use rocket\attribute\EiPreset;
use rocket\op\spec\setup\EiPresetMode;
use n2n\persistence\orm\CascadeType;
use n2n\persistence\orm\attribute\OneToMany;

#[EiType]
#[EiMenuItem('Kategorie', 'Inhalt')]
#[EiPreset(EiPresetMode::EDIT, excludeProps: ['id'])]
class BlogCategory extends ObjectAdapter {
	private static function _annos(AnnoInit $ai) {
		$ai->c(new AnnoEntityListeners(ResponseCacheClearer::getClass()));
		$ai->p('blogCategoryTs', new AnnoOneToMany(BlogCategoryT::getClass(), 'blogCategory', CascadeType::ALL, null, true));
		$ai->p('articles', new AnnoManyToMany(BlogArticle::getClass(), 'categories'));
	}

	private $id;
	#[OneToMany(BlogCategoryT::class, 'blogCategory', CascadeType::ALL, null, true)]
	private \ArrayObject $blogCategoryTs;
	private $orderIndex;
	private $articles;

	public function __construct() {
		$this->blogCategoryTs = new \ArrayObject();
	}

	public function getId() {
		return $this->id;
	}

	public function setId(int $id) {
		$this->id = $id;
	}

	/**
	 * @return BlogCategoryT[]
	 */
	public function getBlogCategoryTs() {
		return $this->blogCategoryTs;
	}

	public function setBlogCategoryTs($blogCategoryTs) {
		$this->blogCategoryTs = $blogCategoryTs;
	}

	public function getOrderIndex() {
		return $this->orderIndex;
	}

	public function setOrderIndex(?int $orderIndex = null) {
		$this->orderIndex = $orderIndex;
	}

	/**
	 * @return BlogArticle[]
	 */
	public function getArticles() {
		return $this->articles;
	}

	public function setArticles($articles) {
		$this->articles = $articles;
	}
}