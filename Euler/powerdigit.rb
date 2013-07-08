

# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

# What is the sum of the digits of the number 2^1000?



total = 2**1000


temp = total.to_s.split("").map{|x| x.to_i}
hold =0

temp.each do |y|
	hold += y
end


puts total

puts hold


