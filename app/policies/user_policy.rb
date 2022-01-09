class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # scope :not_guest, -> { where.not(type: 'guest') }
    end
  end

  def destroy?
    @user = current_or_guest_user
  end
end
