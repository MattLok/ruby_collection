# The sum of the squares of the first ten natural numbers is,
# 1^2 + 2^2 + ... + 10^2 = 385

# The square of the sum of the first ten natural numbers is,
# (1 + 2 + ... + 10)^2 = 55^2 = 3025

# Hence the difference between the sum of the squares of the first ten natural

#  numbers and the square of the sum is 3025 − 385 = 2640.

# Find the difference between the sum of the squares of the first one hundred 
# natural numbers and the square of the sum.


first = (1..100).to_a

second = (1..100).to_a
puts "-------- sum of the squares\n"
sauce = first.inject {|sum, x| sum + x*x}
puts sauce
total = second.inject{|sum, y| sum + y  } 
puts "-------- square of the sums"
total = total * total
puts total
puts "----------"
puts "#{total - sauce}"