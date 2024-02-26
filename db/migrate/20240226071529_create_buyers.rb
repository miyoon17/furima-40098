class CreateBuyers < ActiveRecord::Migration[7.0]
  def change
    create_table :buyers do |t|
      t.string :name
      t.string :text
      t.text :
      t.timestamps
    end
  end
end
