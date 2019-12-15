class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @articles = Article.published.last(25)
    @top_articles = Article.top
  end
end
