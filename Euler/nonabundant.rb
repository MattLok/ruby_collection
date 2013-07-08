#A perfect number is a number for which the sum of its proper
#divisors is exactly equal to the number. For example, the sum
#of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 =
#28, which means that 28 is a perfect number.

#A number n is called deficient if the sum of its proper
#divisors is less than n and it is called abundant if this sum
#exceeds n.

#As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 =
#16, the smallest number that can be written as the sum of two
#abundant numbers is 24. By mathematical analysis, it can be
#shown that all integers greater than 28123 can be written as
#the sum of two abundant numbers. However, this upper limit
#cannot be reduced any further by analysis even though it is
#known that the greatest number that cannot be expressed as
#the sum of two abundant numbers is less than this limit.

#Find the sum of all the positive integers which cannot be
#written as the sum of two


def abundant? (n)
	hold=[]
	(1..((n/2)+1)).each do |y|
		if n % y == 0
			hold.push(y)
		end
	end
	sum = hold.inject(:+)
	 if sum > n
	 	#puts n
	 	return true
	 else
	 	return false
	 end
end


def check (x, y, reg) #check if abundant numbers summed equals num in range

	if x + y == reg
		return true
	else
		return false
	end
end

abund = []
nondivis = []

(3..28123).each do |x|
	if abundant?(x) == true then abund.push(x) end

end

last = abund.length

puts last
sums = []
################# Find all possible sums of abundant nums


	 (0..(last-2)).each do |x|

	 	(x..last-1).each do |y|

	 		print "#{abund[x]} + #{abund[y]} = #{(abund[x] + abund[y])} \n"
	 		sums.push("#{(abund[x] + abund[y])}")
	 	end
	 end


puts sums.length
puts sums.uniq.length

################################################




