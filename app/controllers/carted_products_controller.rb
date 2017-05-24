class CartedProductsController < ApplicationController
 before_action :authenticate_user!
 
  def index 
    @order = Order.find_by(user_id: current_user.id, completed: false)
    if @order.carted_products.length > 0 
        @carted_products = @order.carted_products
        render "index.html.erb"
    else
      flash[:warning] = "You have nothing in your shopping cart!"
      redirect_to "/"
    end
  end

  def create
    @quantity = params[:quantity].to_i
    item_id = params[:item_id]
    @item = Item.find_by(id: params[:item_id])
    @order = Order.find_by(user_id: current_user.id, completed: false)
    
    if @order 

    else
      @order = Order.create(
        user_id: current_user.id,
        completed: false
      )
    end
    @carted_products = CartedProduct.create(
      item_id: params[:item_id],
      quantity: @quantity,
      order_id: @order.id
      )
    flash[:success] = "#{@carted_products.item.name} added to cart!"
    redirect_to "/carted_products"
  end

  def destroy
    @carted_product = CartedProduct.find_by(id: params[:id])
    @carted_product.destroy
    redirect_to "/carted_products"
  end
end
