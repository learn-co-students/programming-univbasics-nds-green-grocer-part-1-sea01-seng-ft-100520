require 'pry'
unconsolidated_cart = [
  {:item => "AVOCADO", :price => 3.00, :clearance => true },
  {:item => "AVOCADO", :price => 3.00, :clearance => true },
  {:item => "KALE", :price => 3.00, :clearance => false}
]

def find_item_by_name_in_collection(name, collection)
  item_hash = nil
  collection.each do |hash| 
    if hash[:item] == name
      item_hash = hash
    end
  end
  item_hash
end

def consolidate_cart(cart)
  consolidated_cart = cart.reduce([]) do |new_cart, current|
    if new_cart.find {|hash| hash[:item] == current[:item]}
      new_cart.each do |hash|
        if hash[:item] == current[:item]
          hash[:count] += 1
      end
    end
    else
      current[:count] = 1
      new_cart.push(current)
    end
  end
  consolidated_cart
end