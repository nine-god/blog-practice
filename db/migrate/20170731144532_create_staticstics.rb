class CreateStaticstics < ActiveRecord::Migration[5.0]
  def change
    create_table :staticstics do |t|
      t.string :ip_addr
      t.string :url
      t.string :remark

      t.timestamps
    end
  end
end
