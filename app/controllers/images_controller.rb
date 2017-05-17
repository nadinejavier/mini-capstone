class ImagesController < ApplicationController
  def new
    @item = Item.find(params[:id])
    render "new.html.erb"
  end

  def create
   image = Image.create(
    url: params[:url],
    item_id: params[:id]
    )
   flash[:success] = "Image successfully created!"
   redirect_to "/items/#{params[:id]}"
  end
end
