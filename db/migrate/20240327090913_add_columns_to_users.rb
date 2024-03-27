class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :username, :string
    add_column :users, :mobile_number, :string
    add_column :users, :address, :string
  end
end
