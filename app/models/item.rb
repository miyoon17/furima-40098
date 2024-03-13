class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :cost
  belongs_to :prefecture
  belongs_to :scheduled_day
  belongs_to :user
  has_one_attached :image

  #空の投稿を保存できないようにする

  with_options presence: true do

  validates :image
  validates :name
  validates :description
  validates :category_id, :condition_id, :cost_id, :prefecture_id, :scheduled_day_id, presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end

  #ジャンルの選択が「---」の時は保存できないようにする
  with_options numericality: { other_than: 0 } do
  validates :category_id, :condition_id, :cost_id, :prefecture_id, :scheduled_day_id, presence: true
 end
end