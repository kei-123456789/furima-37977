class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :item_find, only: [ :show, :edit, :update, :destroy]

  def index
    @items = Item.order(id: "DESC")
    @orders = Order.all
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  def show
  end
  def edit
    if @item.user.id != current_user.id
      redirect_to action: :index
    elsif @item.order != nil
      redirect_to action: :index
    end
  end
  def update
    if  @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end
  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :explain, :price, :category_id, :condition_id, :charge_id, :prefecture_id, :number_id, {image: []}).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end

end

