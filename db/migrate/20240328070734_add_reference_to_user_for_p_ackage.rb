class AddReferenceToUserForPAckage < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :package, foreign_key: true
  end
end
