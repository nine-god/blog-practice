class AddMethodDataToStaticstics < ActiveRecord::Migration[5.0]
  def change
    add_column :staticstics, :request_method, :string
    add_column :staticstics, :data, :text
  end
end
