class Admin::ArticlesController < ApplicationController
  def publish
    @article = Article.find(params[:article_id])
    @article.update(status: 'published')

    @articles = Article.all
    @pagy, @articles = pagy(
      helpers.admin_search(@articles, params),
      items: 10,
      link_extra: 'data-remote="true"'
    )

    respond_to do |format|
      format.html { redirect_to admin_profile_path }
      format.js
    end
  end

  def unpublish
    @article = Article.find(params[:article_id])
    @article.update(status: 'draft')
    redirect_to admin_profile_path
  end
end
