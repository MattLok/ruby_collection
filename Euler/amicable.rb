
# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.

# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

# Evaluate the sum of all the amicable numbers under 10000.


def amicable(n)
	count = 0
	hold =[]

	(1..((n/2)+1)).each do |x|
		if n % x == 0
			count += 1
			hold.push(x)
		end
	end
	hold.inject(:+)
end

#puts amicable(220).inspect

def finder(x)
	total = 0
	(1..x).each do |y|

		if test(y) == true
		total = total + amicable(y)
		end
	end

	total

end
def test(num)

	hold = amicable(num)

	if num == hold
		return false
	end

	if amicable(hold) == num
		puts "#{hold} - #{amicable(hold)}"
		return true
	else
		return false
	end
end

a = amicable(220)
puts a
puts amicable(a)
puts finder(9999)
