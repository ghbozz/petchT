class BrandPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    user.is_admin?
  end

  def create?
    new?
  end

  def edit?
    user.is_admin?
  end

  def update?
    edit?
  end

  def destroy?
    user.is_admin?
  end
end
