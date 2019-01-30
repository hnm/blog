<?php
	use n2n\impl\web\ui\view\html\HtmlView;
	use page\ui\PageHtmlBuilder;
	
	$view = HtmlView::view($view);
	$html = HtmlView::html($view);

	$pageHtml = new PageHtmlBuilder($view);
	
	$view->useTemplate('\bstmpl\view\bsTemplate.html');
?>

<?php $pageHtml->contentItems('top') ?>

<?php if (!empty($blogArticles = $ddDao->getBlogArticles())): ?>
    <div class="row justify-content-center blog-articles">
    	<?php foreach ($blogArticles as $blogArticle): ?>
    		<?php $view->import('inc\blogArticleNested.html', ['blogArticle' => $blogArticle]) ?>
    	<?php endforeach ?>
    </div>
<?php endif ?>

<?php $pageHtml->contentItems('bottom') ?>

