def testing(target, method)
  (0..5).each do |x|
    (0..5).each do |y|
     puts x*y
     if x*y == target
       break if method == "break"
       return if method == "return"
     end
    end
  end
end
# 
# testing(12, "break")
testing(12, "return")
