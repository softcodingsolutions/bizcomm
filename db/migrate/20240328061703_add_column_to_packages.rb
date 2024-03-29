class AddColumnToPackages < ActiveRecord::Migration[7.1]
  def change
    add_column :packages, :package_details, :jsonb, default: {}
  end
end
