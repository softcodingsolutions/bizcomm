class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :api

  belongs_to :package, optional: true

  enum :role, {
    "admin": 0,
    "vendor": 1
  }

  enum approval_status: {pending: 0, approved: 1, rejected: 2}

  before_create :set_default_role

  def valid_password?(password)
    if approval_status == 'pending' || approval_status == 'rejected'
      errors.add(:base, 'Your account request is pending or rejected.')
      return false
    else
      super
    end
  end

  private


  def set_default_role
    self.role ||= :vendor
  end

end
