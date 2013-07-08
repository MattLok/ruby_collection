

def triangle
	cont = true
	max =0
	hold = Array.new()
	for x in 1000..10000
			hold.push((0..x).reduce(:+))
	end
	puts hold.last
	hold.each do |y|
		if findDivisors(y) > max
			max = findDivisors(y)
			puts "#{y} ---#{max} divisors"
		end
		if max == 500

			puts "\n\n\n #{y} has 500 divisors"
		end
		print " ."
	end
end

def findDivisors num
	total =0
	for x in 1..num
		if num % x == 0 then total += 1 end
	end
	return total
end



triangle()
