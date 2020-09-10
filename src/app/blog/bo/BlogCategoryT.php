<?php
namespace blog\bo;

use n2n\web\http\orm\ResponseCacheClearer;
use n2n\l10n\N2nLocale;
use n2n\reflection\annotation\AnnoInit;
use n2n\persistence\orm\annotation\AnnoEntityListeners;
use rocket\impl\ei\component\prop\translation\Translatable;
use n2n\reflection\ObjectAdapter;
use n2n\persistence\orm\annotation\AnnoManyToOne;

class BlogCategoryT extends ObjectAdapter implements Translatable {
	private static function _annos(AnnoInit $ai) {
		$ai->c(new AnnoEntityListeners(ResponseCacheClearer::getClass()));
		$ai->p('blogCategory', new AnnoManyToOne(BlogCategory::getClass()));
	}

	private $id;
	private $name;
	private $blogCategory;
	private $n2nLocale;

	public function getId() {
		return $this->id;
	}

	public function setId(int $id) {
		$this->id = $id;
	}

	public function getN2nLocale() {
		return $this->n2nLocale;
	}

	public function setN2nLocale(N2nLocale $n2nLocale) {
		$this->n2nLocale = $n2nLocale;
	}

	public function getName() {
		return $this->name;
	}

	public function setName(string $name = null) {
		$this->name = $name;
	}

	public function getBlogCategory() {
		return $this->blogCategory;
	}

	public function setBlogCategory(BlogCategory $blogCategory = null) {
		$this->blogCategory = $blogCategory;
	}
}