class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  # /items/id1 GET
  def show
    unless @item = Item.where(id: params[:id]).first
      render text: "Page not found", status: 404
    end
  end

  # /items/new GET
  def new
    @item = Item.new
  end

  # /items/id1/edit GET
  def edit
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
  end

  # /items/1 DELETE
  def destroy
  end



end


#localhost:3000/items/create?item[name]=car33&item[description]=good+car&item[price]=500000&item[weight]=3&item[real]=1

# @item = Item.create(name: params[:name],
#                     description: params[:description],
#                     price: params[:real],
#                     real: params[:real],
#                     weight: params[:weight])

# render text: "#{@item.id}: #{@item.name} (#{!@item.new_record?})"