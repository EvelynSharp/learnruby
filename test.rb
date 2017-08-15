class App
  attr_accessor :user, :store, :menu

  def initialize
    puts "Please enter users name:"
    name = gets
    puts "Please enter how much money the user has brought:"
    wallet_amt = gets.to_f
    @user = ''
    @store =''
    @menu = []
  end

end

app = App.new
