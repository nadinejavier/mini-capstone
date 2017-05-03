class ItemsController < ApplicationController
 def items_method
  @items = Item.all
  render "items.html.erb"

end

end
