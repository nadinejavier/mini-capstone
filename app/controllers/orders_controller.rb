class OrdersController < ApplicationController
  # def create 
  #   @quantity = params[:quantity].to_i
  #   item_id = params[:item_id]
  #   @item = Item.find_by(id: params[:item_id])
  #   calculated_subtotal = @item.price * @quantity
  #   calculated_tax = calculated_subtotal * 0.09
  #   calculated_total = calculated_subtotal + calculated_tax
  #   order = Order.create(
  #       user_id: current_user.id,
  #       subtotal: calculated_subtotal,
  #       tax: calculated_tax,
  #       total: calculated_total
  #     )
  #     flash[:success] = "Order Created!"
  #     redirect_to "/orders/#{order.id}"
  # end

  def show
    @order = Order.find_by(id: params[:id])
  end

  def update
    @order = Order.find_by(user_id: current_user.id, completed: false)
    @order.carted_products.each do |carted_product|
    calculated_subtotal = carted_product.item.price * carted_product.quantity
  end
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax
    @order.update(
      subtotal: calculated_subtotal,
        tax: calculated_tax,
        total: calculated_total,
        completed: true
      )
      flash[:success] = "Order Confirmed!"
      redirect_to "/orders/#{order.id}"
  end
end
