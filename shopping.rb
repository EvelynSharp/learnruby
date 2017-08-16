class User
 attr_accessor :wallet_amt, :cart, :name
 def initialize(name, wallet_amt)
   @name = name
   @wallet_amt = wallet_amt
   @cart = []
 end

 def show_balance
   puts @wallet_amt
 end

 def show_cart
   puts @cart
 end

 def buy_item(name, price)
   if @wallet_amt >= price
     @wallet_amt -= price
     if @cart.any? { |item| item[:name] === name}
       @cart.each{ |item| item[:qty] += 1 if item[:name] === name }
     else
       @cart << { name: name, qty: 1}
     end
   else
     puts "Do not have enough money"
   end
 end

 def sell_item(sell_qty, name, price)
   @wallet_amt += sell_qty * price
   @cart.each{ |item| item[:qty] -= sell_qty if item[:name] === name }
 end

 def check_cart_qty(sell_qty, name)
   if @cart.any? { |item| item[:name] === name}
     item_qty = 0
     @cart.map {
       |item|
       if item[:name] === name
         item_qty = item[:qty]
       end
     }
     if item_qty < sell_qty
       false
     else
       true
     end
   else
     false
   end
 end

end

class Store
  attr_accessor :inventory, :user, :name
  def initialize(name, user)
    @name = name
    @user = user
    @inventory = [
      { name: "books", qty: 10, price: 20 },
      { name: "pen", qty: 5, price: 5 },
      { name: "labtop", qty: 3, price: 500 }
    ]
  end

  def show_inventory
    puts @inventory
  end

  def inv_list
    @inventory.each_with_index do |item, i|
      puts "#{i+1}: #{item[:name]}"
    end
  end

  def sell
    if @user.cart.any?
      puts "What would you like to sell"
      inv_list
      item_id = gets.to_i - 1
      item = @inventory[item_id]
      if item_id >= 0 && item_id < @inventory.length
        puts "How many would you like to sell"
        sell_qty = gets.to_i
        if_enough_qty = @user.check_cart_qty(sell_qty, item[:name])
        if if_enough_qty
          item[:qty] += sell_qty
          @user.sell_item(sell_qty, item[:name], item[:price])
          puts "Items sold"
        else
          puts "Do not have enough quantiy to sell"
        end
      else
        puts "Invalid Option"
        sell
      end
    else
      puts "You have nothing to sell"
    end
  end

  def shop
    puts "what would you like to buy"
    inv_list
    item_id = gets.to_i - 1
    item = @inventory[item_id]
    if item[:qty] < 1
      puts "Insufficient inventory"
      shop
    elsif item_id >= 0 && item_id < @inventory.length
      item[:qty] -= 1
      user.buy_item(item[:name], item[:price])
    else
      puts "Invalid Option"
      shop
    end
  end

  def add_item
    puts "What would you like to do?"
    puts "1: Add An Item"
    puts "2: Main Menu"

    choice = gets.to_i
    if choice === 1
      puts "Enter Item Name"
      name = gets.strip
      if @inventory.any? { |item| item[:name].downcase === name.downcase}
        puts "Item Already Exist"
        puts "what would you like to do?"
        puts "1: add units to existing item"
        puts "2: main menu"
        add_choice = gets.to_i
        case add_choice
        when 1
          puts "Enter Quantity to Add"
          qty = gets.to_i
          @inventory.each{ |item| item[:qty] += qty if item[:name].downcase === name.downcase }
        when 2
        else
          puts "invalid choice"
        end
      else
        puts "Enter Item Quantity"
        qty = gets.to_i
        @inventory << { name: name, qty: qty}
        puts "Inventory Updated "
      end
    elsif choice === 2
      return
    else
      puts "invalid choice"
    end
    add_item
  end
end

class App
  attr_accessor :user, :store, :menu

  def initialize
    puts "Please enter users name:"
    name = gets.strip
    puts "Please enter how much money the user has brought:"
    wallet_amt = gets.to_f
    puts "What store do you want to shop at"
    store_name = gets.strip
    @user = User.new(name, wallet_amt)
    @store = Store.new(store_name, @user)
    @menu = [
      'What would you like to do today:',
      '1: Buy Something',
      '2: Sell Something',
      '3: Display store inventory',
      '4: Display remaining balance',
      '5: Add Item to Store',
      '6: Leave'
    ]
  end


  def print_menu
    puts @menu
  end

  def run_menu
    print_menu
    choice = gets.to_i
    case choice
    when 1
      @store.shop
    when 2
      @store.sell
    when 3
      @store.show_inventory
    when 4
      @user.show_balance
    when 5
      @store.add_item
    when 6
      puts "thank you for shopping at #{@store.name}"
      exit
    else
      puts "invalid entry"
    end
    run_menu
  end

end

app = App.new
app.run_menu
