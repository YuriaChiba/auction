class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all  #複数にするからitemsにする
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    @item.save
    redirect_to "/items/#{@item.id}"
    # redirect_to @item でもいい
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(items_params)
    redirect_to "/items/#{@item.id}"
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to "/items"
  end

  private

  def items_params
    params.require(:item).permit(:name, :price, :seller_id, :description, :email, :image_url)
  end

end
