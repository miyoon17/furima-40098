
class Item < ApplicationRecord
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to :category
  # belongs_to :condition
  # belongs_to :cost
  # belongs_to :prefecture
  # belongs_to :scheduled_day

  # #空の投稿を保存できないようにする
  # validates :title, :text, presence: true

  # #ジャンルの選択が「---」の時は保存できないようにする
  # validates :category_id, condition_id, cost_id, prefecture_id, scheduled_day_id, numericality: { other_than: 1 , message: "can't be blank"}
end
