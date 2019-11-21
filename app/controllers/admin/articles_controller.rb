class Admin::ArticlesController < ApplicationController
  def publish
    @article = Article.find(params[:article_id])
    @article.update(status: 'published')

    respond_to do |format|
      format.html { redirect_to admin_profile_path }
      format.js
    end
  end

  def unpublish
    @article = Article.find(params[:article_id])
    @article.update(status: 'draft')

    respond_to do |format|
      format.html { redirect_to admin_profile_path }
      format.js
    end
  end
end
