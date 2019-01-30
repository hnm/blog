<?php 

	use n2n\impl\web\ui\view\html\HtmlView;
	use blog\bo\BlogArticle;
	use page\model\nav\murl\MurlPage;
	use blog\bo\BlogPageController;
use blog\ui\BlogMimg;
	
	$view = HtmlView::view($view);
	$html = HtmlView::html($view);
	
	$blogArticle = $view->getParam('blogArticle');
	$view->assert($blogArticle instanceof BlogArticle);
	
	$colsClassName = $view->getParam('colsClassName', false, 'col-md-6 col-lg-4');
	
	$blogClassNames = 'blog-article';
	if ($blogArticle->hasImage()) {
		$blogClassNames .= ' blog-article-has-image';
	}
?>
<div class="<?php $html->out($colsClassName) ?> d-flex mb-4">
	<?php $html->linkStart(MurlPage::tag(BlogPageController::class)->pathExt($blogArticle->getPathPart()), ['class' => $blogClassNames], 'div', ['class' => $blogClassNames]) ?>
		<?php if ($blogArticle->hasImage()): ?>
				<?php $html->image($blogArticle->getFileImage(), BlogMimg::articleNested(), ['class' => 'img-fluid']) ?>
		<?php endif ?>
		<div class="blog-article-text">
			<h4 class="blog-article-title">
				<?php $html->out($blogArticle->getTitle()) ?>
			</h4>
			<?php if (null !== ($intro = $blogArticle->getIntro())): ?>
				<p class="blog-article-intro">
					<?php $html->out($intro) ?>
				</p>
			<?php endif ?>
			<div class="mt-auto">
				<?php $html->text('read_article_txt') ?>
			</div>
		</div>
	<?php $html->linkEnd() ?>
</div>
