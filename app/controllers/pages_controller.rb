class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @articles = Article.where(status: 'published').last(25)

    @top_articles = Article.where(top: true).limit(3)
  end
end
