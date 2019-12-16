class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @articles = Article.published.order(created_at: :desc).last(21)
    @top_articles = Article.top
  end
end
