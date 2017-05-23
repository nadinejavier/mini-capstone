class CartedProductsController < ApplicationController

  def index 
    @order = Order.find_by(user_id: current_user.id, completed: false)
     if @order.carted_products 
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

    # calculated_subtotal = @item.price * @quantity
    # calculated_tax = calculated_subtotal * 0.09
    # calculated_total = calculated_subtotal + calculated_tax

    @order = Order.find_by(user_id: current_user.id, completed: false)
    
    if @order 

  else
      @order = Order.create(
        user_id: current_user.id,
        # subtotal: calculated_subtotal,
        # tax: calculated_tax,
        # total: calculated_total,
        completed: false
      )
    end
    @carted_products = CartedProduct.create(
      item_id: params[:item_id],
      quantity: @quantity,
      order_id: @order.id
      )
    flash[:success] = "Carted Item!"
    redirect_to "/carted_products"
  end

end
