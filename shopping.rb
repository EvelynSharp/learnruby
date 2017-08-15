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
end

class Store
  attr_accessor :inventory, :user
  def initialize(user)
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

  def shop
    puts "what would you like to buy"
    @inventory.each_with_index do |item, i|
      puts "#{i+1}: #{item[:name]}"
    end
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
end

class App
  attr_accessor :user, :store, :menu

  def initialize
    puts "Please enter users name:"
    name = gets.strip
    puts "Please enter how much money the user has brought:"
    wallet_amt = gets.to_f
    @user = User.new(name, wallet_amt)
    @store = Store.new(@user)
    @menu = [
      'What would you like to do today:',
      '1: Buy Something',
      '2: Display store inventory',
      '3: Display remaining balance',
      '4: Leave'
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
      run_menu
    when 2
      @store.show_inventory
      run_menu
    when 3
      @user.show_balance
      run_menu
    when 4
    else
      puts "invalid entry"
    end
  end

end

app = App.new
app.run_menu
