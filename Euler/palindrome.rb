

def isPalindrome? num
	#num.to_s

	if num.to_s == num.to_s.reverse
		true
	else
		false
	end


end


def largestP
	first = (1..999).to_a.reverse

	second = (1..999).to_a.reverse
	found = true
	pali= []


		first.each do |x|

			second.each do |y|

				if isPalindrome?(x * y)
				 puts "You found it #{x} * #{y} = #{x*y}"
				 pali.push(x*y)
				end
			end
		end

		puts pali.max
end

largestP()

puts isPalindrome?(112)
