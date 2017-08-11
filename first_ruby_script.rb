infoArr = [];

checker = true
while checker === true
  user_input = gets
  if  user_input == "quit\n"
    checker = false
  else
    infoArr << user_input
  end
end

puts infoArr
