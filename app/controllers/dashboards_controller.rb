class DashboardsController < ApplicationController

  def user_dashboard
    @articles = current_user.articles
  end

end
