<?php
namespace blog\bo;

use n2n\web\http\orm\ResponseCacheClearer;
use n2n\reflection\annotation\AnnoInit;
use n2n\persistence\orm\annotation\AnnoEntityListeners;
use n2n\persistence\orm\annotation\AnnoTable;
use n2n\reflection\ObjectAdapter;
use rocket\impl\ei\component\prop\ci\model\ContentItem;
use n2n\io\managed\File;
use n2n\l10n\N2nLocale;
use n2n\persistence\orm\annotation\AnnoManagedFile;
use n2n\persistence\orm\annotation\AnnoOneToMany;
use n2n\persistence\orm\annotation\AnnoDateTime;
use n2n\persistence\orm\annotation\AnnoManyToMany;
use n2n\persistence\orm\annotation\AnnoOrderBy;

class BlogArticle extends ObjectAdapter {
	private static function _annos(AnnoInit $ai) {
		$ai->c(new AnnoEntityListeners(ResponseCacheClearer::getClass()), new AnnoTable('blog_article'));
		$ai->p('fileImage', new AnnoManagedFile());
		$ai->p('contentItems', new AnnoOneToMany(ContentItem::getClass(), null, \n2n\persistence\orm\CascadeType::ALL, null, true), 
				new AnnoOrderBy(['orderIndex' => 'ASC']));
		$ai->p('createdDate', new AnnoDateTime());
		$ai->p('categories', new AnnoManyToMany(BlogCategory::getClass()));
	}

	private $id;
	private $categories;
	private $title;
	private $pathPart;
	private $fileImage;
	private $intro;
	private $createdDate;
	private $contentItems;
	private $n2nLocale;
	private $online = true;

	public function __construct() {
		$this->createdDate = new \DateTime();
	}

	public function getId() {
		return $this->id;
	}

	public function setId(int $id) {
		$this->id = $id;
	}

	public function getTitle() {
		return $this->title;
	}

	public function setTitle(string $title = null) {
		$this->title = $title;
	}

	public function getPathPart() {
		return $this->pathPart;
	}

	public function setPathPart(string $pathPart = null) {
		$this->pathPart = $pathPart;
	}

	public function getFileImage() {
		return $this->fileImage;
	}

	public function setFileImage(File $fileImage = null) {
		$this->fileImage = $fileImage;
	}

	public function getIntro() {
		return $this->intro;
	}

	public function setIntro(string $intro = null) {
		$this->intro = $intro;
	}

	public function getCreatedDate() {
		return $this->createdDate;
	}

	public function setCreatedDate(\DateTime $createdDate = null) {
		$this->createdDate = $createdDate;
	}

	/**
	 * @return ContentItem[]
	 */
	public function getContentItems() {
		return $this->contentItems;
	}

	public function setContentItems($contentItems) {
		$this->contentItems = $contentItems;
	}

	public function getN2nLocale() {
		return $this->n2nLocale;
	}

	public function setN2nLocale(N2nLocale $n2nLocale = null) {
		$this->n2nLocale = $n2nLocale;
	}

	public function isOnline() {
		return $this->online;
	}

	public function setOnline(bool $online) {
		$this->online = $online;
	}

	public function hasImage() {
		return (bool) (null !== $this->fileImage);
	}

	/**
	 * @return BlogCategory[]
	 */
	public function getCategories() {
		return $this->categories;
	}

	public function setCategories($categories) {
		$this->categories = $categories;
	}
}
