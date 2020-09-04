def find_item_by_name_in_collection(name, collection)
  return collection.find do |item|
    item[:item] == name
  end
  

end

def consolidate_cart(cart)
  
  consolidated_cart = []
  cart.each do |item|
    consolidated_item = find_item_by_name_in_collection(item[:item], consolidated_cart)
    if consolidated_item
      consolidated_item[:count] += 1
    else
      item_hash = item 
      item_hash[:count] = 1
      consolidated_cart.push(item_hash)
    end
  end 
  
  return consolidated_cart
end


  