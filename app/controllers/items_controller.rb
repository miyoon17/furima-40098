class ItemsController < ApplicationController

  # ログアウト状態のユーザーが商品出品ページへ遷移しようとすると、ログインページへリダイレクトする
  before_action :authenticate_user!, except: [:index, :show ]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.order("created_at DESC")
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
  end

  def edit
    if @item.user_id == current_user.id && @item.order.nil?
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
    end
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image, :category_id, :condition_id, :cost_id, :prefecture_id, :scheduled_day_id, :price)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end