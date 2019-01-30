<?php
	use n2n\impl\web\ui\view\html\HtmlView;
	use rocket\impl\ei\component\prop\ci\ui\ContentItemHtmlBuilder;
	use blog\bo\BlogArticle;
	use blog\ui\BlogMimg;
		
	$view = HtmlView::view($view);
	$html = HtmlView::html($view);
	
	$blogArticle = $view->getParam('blogArticle');
	$view->assert($blogArticle instanceof BlogArticle);
	
	$html->meta()->setTitle($blogArticle->getTitle(), true);
	$html->meta()->setMetaDescription($blogArticle->getIntro());

	$ciHtml = new ContentItemHtmlBuilder($view);
	
	$view->useTemplate('\bstmpl\view\bsTemplate.html');
?>

<?php if (null !== $fileImage = $blogArticle->getFileImage()): ?>
	<?php $html->image($fileImage, BlogMimg::articleDetail(), ['class' => 'img-fluid mb-4']) ?>
<?php endif ?>

<h1 class="text-center"><?php $html->out($blogArticle->getTitle()) ?></h1>

<?php if (null !== ($intro = $blogArticle->getIntro())): ?>
	<p class="lead"><?php $html->out($intro) ?></p>
<?php endif ?>

<?php $ciHtml->contentItems($blogArticle->getContentItems(), 'main') ?>