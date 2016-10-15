class ItemsController < ApplicationController

  def index
    @items = Item.all
    render text: @items.map { |i| "#{i.name}: #{i.price}"}.join('<br/>')
  end

  def create

    @item = Item.create(name: params[:name],
                description: params[:description],
                price: params[:real],
                real: params[:real],
                weight: params[:weight])
    render text: "#{@item.id}: #{@item.name} (#{!@item.new_record?})"
  end

end


#localhost:3000/items/create?item[name]=car33&item[description]=good+car&item[price]=500000&item[weight]=3&item[real]=1
