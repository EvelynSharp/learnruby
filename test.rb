arr = [1,2,3,4,5]

new_arr = arr.select { |num| num % 2 == 0 }

print new_arr
print arr 
