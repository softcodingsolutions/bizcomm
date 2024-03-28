class UserPolicy < ApplicationPolicy
  def pending_requests?
    user.admin? || (raise Pundit::NotAuthorizedError, "You are not authorized to perform this action")
  end
end