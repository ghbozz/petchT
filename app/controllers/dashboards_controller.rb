class DashboardsController < ApplicationController

  def user_dashboard
    @articles = current_user.articles
    @articles = search_n_filter(@articles, params)
  end

  private

  def search_n_filter(articles, params)
    if params[:query].present?
      articles = articles.search_articles(params[:query])
    end

    if params[:filter_data]
      animals = params[:filter_data].select { |k, v| v == '1' }.keys.select { |item| Article::ANIMALS.include?(item) }
      themes = params[:filter_data].select { |k, v| v == '1' }.keys.select { |item| Article::THEMES.include?(item) }
      articles = articles.where(animal: animals) if animals.any?
      articles = articles.where(theme: themes) if themes.any?
    end

    articles
  end

end
