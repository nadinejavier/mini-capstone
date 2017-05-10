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
    flash[:success] = "Item successfully created!"
    redirect_to "/items/#{@new_item.id}"
  end

  def edit 
     @item = Item.find(params[:id])
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
    flash[:info] = "Item successfully updated!"
    redirect_to "/items/#{@item.id}"
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    flash[:danger] = "Item successfully deleted!"
    redirect_to "/items"
  end
end
