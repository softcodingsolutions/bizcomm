class RemoveColumnFromPackages < ActiveRecord::Migration[7.1]
  def change
    remove_column :packages, :description
  end
end
