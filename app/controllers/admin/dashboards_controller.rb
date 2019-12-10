class Admin::DashboardsController < ApplicationController

  def admin_dashboard
    authorize :dashboard, :admin?

    @articles = Article.where(id: articles_select)
    @pagy_articles, @articles = pagy(
      helpers.articles_filter(@articles, params).order(created_at: :desc),
      items: 10,
      page_param: :page_articles,
      params: { active_tab: 'articles' },
      # link_extra: 'data-remote="true"'
    )

    @cards = Card.all
    @pagy_cards, @cards = pagy(
      helpers.cards_filter(@cards, params).order(created_at: :desc),
      items: 10,
      page_param: :page_cards,
      params: { active_tab: 'cards' },
      # link_extra: 'data-remote="true"'
    )

    @brands = Brand.all
    @pagy_brands, @brands = pagy(
      helpers.brands_filter(@brands, params).order(created_at: :desc),
      items: 10,
      page_param: :page_brands,
      params: { active_tab: 'brands' },
      # link_extra: 'data-remote="true"'
    )

    if !params[:active_tab]
      params[:active_tab] = 'articles' if params[:articles_data]
      params[:active_tab] = 'cards' if params[:cards_filter]
      params[:active_tab] = 'brands' if params[:brands_filter]
    end
  end

  private

  def articles_select
    articles = Article.all.select do |a|
      a.user == current_user || a.status == 'submitted' || a.status == 'published' || a.top
    end

    return articles.map(&:id)
  end

end
