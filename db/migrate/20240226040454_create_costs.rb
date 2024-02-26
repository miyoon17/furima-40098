class CreateCosts < ActiveRecord::Migration[7.0]
  def change
    create_table :costs do |t|
      t.string     :title        , null: false
      t.text       :text         , null: false
      t.integer    :cost_id     , null: false
      t.timestamps
    end
  end
end
