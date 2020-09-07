def find_item_by_name_in_collection(name, collection)
  collection.each do | item |
    return item if item[:item].eql?(name)
  end
  nil
end
def find_item_by_name_in_collection?(name, collection)
  collection.each do | item |
    return true if item[:item].eql?(name)
  end
  false
end

def consolidate_cart(cart)
  return_cart = []
  cart.each do |item|
    is_here = find_item_by_name_in_collection(item[:item], return_cart)    
    if is_here     
      is_here[:count] += 1
    else
      return_cart << item.merge({count: 1})
    end
  end  
  return_cart
end


grocery_shelf = [
  { :item => "CANNED BEANS", :price => 3.00, :clearance => true },
  { :item => "CANNED CORN", :price => 2.50, :clearance => false },
  { :item => "SALSA", :price => 1.50, :clearance => false },
  { :item => "TORTILLAS", :price => 2.00, :clearance => false },
  { :item => "HOT SAUCE", :price => 1.75, :clearance => false }
]