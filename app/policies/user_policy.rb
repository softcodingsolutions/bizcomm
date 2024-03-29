class UserPolicy < ApplicationPolicy
  def pending_requests?
    user.admin? || (raise Pundit::NotAuthorizedError, "You are not authorized to perform this action")
  end

  def approve_request?
    user.admin? || (raise Pundit::NotAuthorizedError, "you are not authorized to perform this action")
  end

  def reject_request?
    user.admin? || (raise Pundit::NotAuthorizedError, "You are nto authorized to perform this action")
  end

  def registered_users?
    user.admin? || (raise Pundit::NotAuthorizedError, "You are not authorized to perform this action" )
  end
end