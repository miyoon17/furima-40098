class CreateScheduledDays < ActiveRecord::Migration[7.0]
  def change
    create_table :scheduled_days do |t|
      t.string     :title        , null: false
      t.text       :text         , null: false
      t.integer    :scheduled_day_id     , null: false
      t.timestamps
    end
  end
end
