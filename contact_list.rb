contacts = []
Menu = ['MAIN MENU:', '1: Add Contacts', '2: View Contacts', '3: Edit Contacts', '4: Exit']

def print_menu
  menucount = 0
  while menucount < Menu.length
    puts Menu[menucount]
    menucount += 1
  end
end



checker = true
while checker === true
  print_menu
  choice = gets
  case choice
  when "1\n"
    new_contact = {}
    puts "Please enter the name"
    name = gets
    while name === "\n"
      puts "Contact must have a name:"
      name = gets
    end
    new_contact[:name] = name;
    puts "Please enter the phone number"
    phone = gets
    if phone != "\n"
      new_contact[:phone] = phone;
    end
    puts "Please enter the address"
    address = gets
    if address != "\n"
      new_contact[:address] = address;
    end
    contacts << new_contact
  when "2\n"
    puts contacts
  when "3\n"

  when "4\n"
    checker = false
  else
    puts "invalid entry"
  end
end
