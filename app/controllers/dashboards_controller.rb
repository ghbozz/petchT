class DashboardsController < ApplicationController

  def user_dashboard
    @articles = current_user.articles
    @pagy, @articles = pagy(helpers.dashboard_search(@articles, params), items: 10)
  end

  private

end
