class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    user.is_writer? || user.is_admin?
  end

  def create?
    new?
  end

  def edit?
    record.user == user || user.is_admin?
  end

  def update?
    edit?
  end

  def submit?
    edit?
  end
end
