Menu = ['MAIN MENU:', '1: Command Line', '2: Search', '3: Exit']
def print_menu
  menucount = 0
  while menucount < Menu.length
    puts Menu[menucount]
    menucount += 1
  end
end

Command = ['mv', 'cp', 'mkdir', 'ls', 'rm']

def print_command
  command_c = 0
  while command_c < Command.length
    puts (command_c + 1).to_s + ': ' + Command[command_c]
    command_c += 1
  end
end


if_run = true

while if_run === true
  print_menu
  choice = gets
  case choice
  when "1\n"
    puts 'Select an option to see output'
    print_command
    cmd_id = gets.to_i
    cmd = Command[cmd_id]
    puts cmd
    puts `man #{cmd}`
  when "2\n"
    puts "Type a cmd to search"
    cmd_input = gets
    cmd_name = cmd_input.slice(0, cmd_input.length - 1)
    print `man #{cmd_name}`
  when "3\n"
    if_run = false
  else
    puts "invalid entry"
  end
end
