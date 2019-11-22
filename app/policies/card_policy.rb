class CardPolicy < ApplicationPolicy
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
    new?
  end

  def update?
    new?
  end

  def submit?
    new?
  end

  def init?
    new?
  end

  def destroy?
    user.is_admin?
  end
end
