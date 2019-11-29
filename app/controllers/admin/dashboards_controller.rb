class Admin::DashboardsController < ApplicationController

  def admin_dashboard
    authorize :dashboard, :admin?

    @articles = Article.where(id: articles_select)
    @pagy_articles, @articles = pagy(
      helpers.admin_search(@articles, params).order(created_at: :desc),
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

    params[:active_tab] = 'articles' if params[:filter_data]
    params[:active_tab] = 'cards' if params[:cards_filter]
    # raise

    # if params[:filter_data] || params[:cards_filter]
    #   respond_to do |format|
    #     format.html { redirect_to admin_profile_path }
    #     format.js
    #   end
    # end

  end

  private

  def articles_select
    articles = Article.all.select do |a|
      a.user == current_user || a.status == 'submitted' || a.status == 'published' || a.top
    end

    return articles.map(&:id)
  end

end
