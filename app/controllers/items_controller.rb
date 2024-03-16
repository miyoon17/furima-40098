class ItemsController < ApplicationController

  # ログアウト状態のユーザーが商品出品ページへ遷移しようとすると、ログインページへリダイレクトする
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  #  @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :image, :category_id, :condition_id, :cost_id, :prefecture_id, :scheduled_day_id, :price)
  end
end