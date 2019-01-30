<?php
namespace blog\ui;

use n2nutil\bootstrap\img\MimgBs;
use n2n\impl\web\ui\view\html\img\Mimg;

class BlogMimg {
	public static function articleNested() {
		return MimgBs::xs(Mimg::crop(350, 450))->sm(510)->md(218)->lg(290)->xl(550);
	}
	
	public static function articleDetail() {
		return MimgBs::xs(Mimg::crop(920, 460));
	}
}