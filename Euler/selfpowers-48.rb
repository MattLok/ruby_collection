####
#
#Self powers
#Problem 48
#The series, 11 + 22 + 33 + ... + 1010 = 10405071317.
#Find the last ten digits of the series, 11 + 22 + 33 + ... + 10001000.
####

arr = Array.new()
(1..1000).each do |x|
	arr << x**x
end

puts arr.inject(:+).to_s[-10,10]
