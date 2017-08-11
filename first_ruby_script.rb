todolist = [];
Menu = ['MENU:', '1: Add Item', '2: View List', '3: Edit Item', '4: Delete Item', '5: Quit']
def print_menu
  menucount = 0
  while menucount < Menu.length
    puts Menu[menucount]
    menucount += 1
  end
end

print_menu

choice = gets
case choice
when "1\n"
  puts 'Enter an item to add to the list'
  todolist << gets
when "2\n"
  puts 'Try harder!'
when "3\n"
  puts 'You need help!!!'
when "4\n"
  puts 'You need help!!!'
when "5\n"
  puts 'You need help!!!'
else
  puts "invalid entry"

end

# checker = true
# while checker === true
#   user_input = gets
#   if  user_input == "quit\n"
#     checker = false
#   else
#     infoArr << user_input
#   end
# end
