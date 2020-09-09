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
	
?>
<article class="blog-article mb-5">
	<?php $html->linkStart(MurlPage::tag(BlogPageController::class)->pathExt($blogArticle->getPathPart()), null, 'div') ?>
		<?php if ($blogArticle->hasImage()): ?>
				<?php $html->image($blogArticle->getFileImage(), BlogMimg::articleNested(), ['class' => 'img-fluid']) ?>
		<?php endif ?>
		<div class="blog-article__text">
			<h2 class="blog-article__title">
				<?php $html->out($blogArticle->getTitle()) ?>
			</h2>
			<?php if (null !== ($intro = $blogArticle->getIntro())): ?>
				<p class="blog-article__intro">
					<?php $html->out($intro) ?>
				</p>
			<?php endif ?>
			<div class="mt-auto btn btn-primary">
				<?php $html->text('read_article_txt') ?>
			</div>
		</div>
	<?php $html->linkEnd() ?>
</article>
