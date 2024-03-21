# frozen_string_literal: true

# This is nice little policy base class.
class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end
end
