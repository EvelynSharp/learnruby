todolist = [];
Menu = ['MENU:', '1: Add Item', '2: View List', '3: Edit Item', '4: Delete Item', '5: Quit']
def print_menu
  menucount = 0
  while menucount < Menu.length
    puts Menu[menucount]
    menucount += 1
  end
end

def print_todo(todolist)
  menucount = 0
  while menucount < todolist.length
    puts menucount.to_s + ': ' + todolist[menucount]
    menucount += 1
  end
end

if_run = true

while if_run === true
  print_menu
  choice = gets
  case choice
  when "1\n"
    puts 'Enter an item to add to the list'
    todolist << gets
  when "2\n"
    puts "____CURRENT LIST____"
    puts todolist
    puts "____CURRENT LIST____"
  when "3\n"
    puts "Enter index of item to edit"
  when "4\n"
    puts "Enter index of item to remove"
    print_todo(todolist)
    removeId = gets.to_i
    todolist.delete_at(removeId)
  when "5\n"
    if_run = false
  else
    puts "invalid entry"
  end
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
