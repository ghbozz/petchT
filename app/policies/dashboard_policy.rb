class DashboardPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def profile?
    user.is_writter?
  end

  def admin?
    user.is_admin?
  end
end
