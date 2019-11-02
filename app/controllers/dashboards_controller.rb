class DashboardsController < ApplicationController

  def user_dashboard
    @articles = Article.where(user: current_user)
  end

end
