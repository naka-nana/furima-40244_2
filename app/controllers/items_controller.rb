class ItemsController < ApplicationController
  def index
  end

  def new
  end

  private

  def item_params
    params.require(:item).permit(:name, :item_info, :region_id, :category_id, :condition_id, :shipping_id, :shipping_day_id)
  end
end
