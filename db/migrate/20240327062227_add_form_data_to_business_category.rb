class AddFormDataToBusinessCategory < ActiveRecord::Migration[7.1]
  def change
    add_column :business_categories, :form_data, :jsonb, default: {}
  end
end
