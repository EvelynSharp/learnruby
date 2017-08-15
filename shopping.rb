class User
 attr_accessor :wallet_amt, :cart, :name
 def initialize(name, wallet_amt)
   @name = name
   @wallet_amt = wallet_amt
   @cart = []
 end
end

class Store
  attr_accessor :inventory
  def initialize
    @inventory = [
      { name: "books", qty: 10, price: 20 },
      { name: "pen", qty: 5, price: 5 },
      { name: "labtop", qty: 3, price: 500 }
    ]
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
    @store = Store.new
    @menu = [
      'What would you like to do today:',
      '1: Buy Something',
      '2: Display store inventory',
      '3: Display remaining balance',
      '4: Leave'
    ]
  end


  def print_menu
    menucount = 0
    puts @menu
    # while menucount < @menu.length
    #   puts @menu[menucount]
    #   menucount += 1
    # end
  end

  def run_menu
    print_menu
    choice = gets
    case choice
    when "1\n"

    when "2\n"

    when "3\n"

    when "4\n"

    else
      puts "invalid entry"
    end
  end

end

app = App.new
app.run_menu
