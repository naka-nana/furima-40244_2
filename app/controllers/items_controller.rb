class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :item_info, :region_id, :category_id, :condition_id, :shipping_id, :shipping_day_id,
                                 :price, :image)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def ensure_correct_user
    redirect_to root_path unless @item.user == current_user
  end
end
