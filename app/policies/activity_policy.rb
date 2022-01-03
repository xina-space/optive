class ActivityPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
      # scope.all
    end
  end

  def create?
    true
  end

  def index?
    true
  end

  def show?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
