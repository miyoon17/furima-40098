class OrderForm
  include ActiveModel::Model

  with_options presence: true do
    validates :user_id
    validates :item_id
  end














end