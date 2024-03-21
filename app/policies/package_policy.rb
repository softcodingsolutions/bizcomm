class PackagePolicy < ApplicationPolicy
  def create?
    user.vendor?
  end
end