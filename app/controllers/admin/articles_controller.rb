class Admin::ArticlesController < ApplicationController
  def publish
    @article = Article.friendly.find(params[:article_id])
    @article.update(status: 'published')

    respond_to do |format|
      format.html { redirect_to admin_profile_path }
      format.js
    end
  end

  def unpublish
    @article = Article.friendly.find(params[:article_id])
    @article.update(status: 'draft')
    @article.update(top: false) if @article.top

    respond_to do |format|
      format.html { redirect_to admin_profile_path }
      format.js
    end
  end
end
