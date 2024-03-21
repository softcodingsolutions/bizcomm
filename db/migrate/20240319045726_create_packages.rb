class CreatePackages < ActiveRecord::Migration[7.1]
  def change
    create_table :packages do |t|
      t.string :name
      t.integer :price
      t.string :description
      t.references :user
      t.timestamps
    end
  end
end
