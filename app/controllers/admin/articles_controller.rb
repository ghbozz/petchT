class Admin::ArticlesController < ApplicationController
  def publish
    @article = Article.find(params[:article_id])
    @article.update(status: 'published')
    redirect_to admin_profile_path
  end

  def unpublish
    @article = Article.find(params[:article_id])
    @article.update(status: 'draft')
    redirect_to admin_profile_path
  end
end
