class PackagePolicy < ApplicationPolicy
  def create?
    user.admin? || (raise Pundit::NotAuthorizedError, "You are not authorized to perform this action")
  end

  def update?
    user.admin? || (raise Pundit::NotAuthorizedError, "You are not authorized to perform this action")
  end
  
  def destroy?
    user.admin? || (raise Pundit::NotAuthorizedError, "You are not authorized to perform this action")
  end
end