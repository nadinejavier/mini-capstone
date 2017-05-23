class ItemsController < ApplicationController
   def index
    @items = Item.all
    sort = params[:sort]
    sort_order = params[:order]
    discount = params[:discount]
    if sort && sort_order
     @items = Item.all.order(sort => sort_order)
    end    
    if discount
      @items = Item.where("price <= ?", 10)
    end
    if params[:category]
      @items = Category.find_by(title: params[:category]).items
    end
    render "index.html.erb"
  end
  
  def price_desc
     @items = Item.all.order(price: :desc)
  render "index.html.erb"
  end 

  def discount 
    @item = Item.where("price <= ?", 10)
    render "index.html.erb"
  end

  def show
    items_id = params[:id]
    @item = Item.find_by(id: items_id)
    if params[:id] == "random"
      @item = Item.all.sample
    end
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
      user_id: current_user.id
      )
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
