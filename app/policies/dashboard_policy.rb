class DashboardPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def profile?
    user.is_writer?
  end

  def admin?
    user.is_admin?
  end

  def publish?
    user.is_admin?
  end

  def unpublish?
    user.is_admin?
  end
end
