


def triangle
	cont = true
	max =0
	hold = Array.new()
	for x in 1..20000

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
	end

	puts "done"

end
def findDivisors num
	total =2
	square = Math.sqrt(num)

	for x in 2..(square)
		if num % x == 0 then total += 2 end
	end

	if total == 2 then return 1 else total end

end



triangle()

