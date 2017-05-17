class Item < ApplicationRecord
    
  belongs_to :supplier
  belongs_to :user
  has_many :images
  
  def sale_message
    if price.to_i <= 2
      return "Discount Item!"
    else 
      return "Everyday value!"
    end
  end

  def tax
     price.to_i * 0.09
  end
  
  def total
    return price.to_i + tax
  end

  def in_stock?
    if stock == true
      return "In stock."
    else
      return "Not in stock."
    end
  end



end
