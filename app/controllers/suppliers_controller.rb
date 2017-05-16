class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
    render "suppliers_index.html.erb"
  end


end
