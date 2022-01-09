class NotMandatoryUserApplicationPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    # raise Pundit::NotAuthorizedError unless user

    @user = user
    @record = record.is_a?(Array) ? record.last : record
  end

  # ...

end
