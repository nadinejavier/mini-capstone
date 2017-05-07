class ItemsController < ApplicationController
   def index
    @items = Item.all
    render "index.html.erb"
  #all items, use each loop to print out all items
  end

  def show
    items_id = params[:id]
    @item = Item.find_by(id: items_id)
    render "show.html.erb"
    #single item
  end

  def new
    render "new_item.html.erb"
  end

  def create
    @new_item = Item.create(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      image: params[:image])
    render "create_item.html.erb"
  end

  def edit
    render "edit.html.erb"
  end 

  def update
    @item = Item.find(params[:id])
    @item.update(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      image: params[:image]
      )
    render "update.html.erb"
  end
end
