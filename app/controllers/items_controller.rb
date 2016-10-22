class ItemsController < ApplicationController

  # before_filter :find_item, only: [:show, :edit, :update, :destroy]
  # before_filter :check_if_admin, only: [:edit, :update, :new, :destroy]

  def index
    @items = Item.all
  end

  # /items/id1 GET
  def show
    unless @item
      render text: "Page not found", status: 404
    end
  end

  # /items/new GET
  def new
    @item = Item.new
  end

  # /items/id1/edit GET
  def edit
    @item = Item.find(params[:id])
  end

  # /items POST
  def create
    item_params = params.require(:item).permit(:price, :name, :real, :weight, :description)
    @item = Item.create(item_params)
    # @item = Item.create(params[:item])
    if @item.errors.empty?
      redirect_to item_path(@item) # /items/:id
    else
      render "new"
    end
  end

  # /items/1 PUT
  def update
    item_params = params.require(:item).permit(:price, :name, :real, :weight, :description)
    @item = Item.find(params[:id])
    @item.update_attributes(item_params)
    # @item = Item.create(params[:item])
    if @item.errors.empty?
      redirect_to item_path(@item) # /items/:id
    else
      render "edit"
    end

  end

  # /items/1 DELETE
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to action: "index"
  end

  def upvote

  end



  private

    def find_item
      @item = Item.find(params[:id])
    end

    def check_if_admin
      # render text: "Access denied", status 403 unless current_user.admin == true
      # render text: "Access denied", status: 403 unless params[:admin]
    end



end


#localhost:3000/items/create?item[name]=car33&item[description]=good+car&item[price]=500000&item[weight]=3&item[real]=1

# @item = Item2.create(name: params[:name],
#                     description: params[:description],
#                     price: params[:real],
#                     real: params[:real],
#                     weight: params[:weight])

# render text: "#{@item.id}: #{@item.name} (#{!@item.new_record?})"