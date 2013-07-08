

# The following iterative sequence is defined for the set of positive integers:

# n → n/2 (n is even)
# n → 3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the following sequence:
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms.
#  Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

# Which starting number, under one million, produces the longest chain?

# NOTE: Once the chain starts the terms are allowed to go above one million.
hold = Array.new()

chain =0
numhold =0


def collatz num, count

	#the end recursion state
	if num ==1 then return count end

	if num % 2 == 0
		num = (num/2)
	else
		num = (num * 3) + 1
	end

	collatz(num, count +1)
end


10.upto(1000000) do |x|

	temp = collatz(x, 1)

	if temp > chain
		chain = temp
		numhold = x
		print'. '
	end

end

puts "\n the largest chain is #{chain} and the number is #{numhold}"


