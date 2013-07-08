#
#  2520 is the smallest number
#   that can be divided by each of the numbers from 1 to 10 without any remainder.
#   What is the smallest positive number that is evenly divisible by
#     all of the numbers from 1 to 20?

#

def oneTwenty? num
	temp = (1..20).to_a


		temp.each do |x|

			if num % x != 0
				puts "#{num} not divisible by #{x}"
				return false
			end


		end

	return true
end

puts oneTwenty?(2520)

 def smallest
 	count = 232000000
 	found = false

		while found == false

			 if oneTwenty?(count) == true
			 	found = true
			 else

				count = count + 1
			end
		end

		return count

 end


puts smallest()
