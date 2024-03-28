class RemoveUserColumnFromPackages < ActiveRecord::Migration[7.1]
  def change
    remove_reference :packages, :user
  end
end
