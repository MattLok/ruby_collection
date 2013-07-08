

puts "Enter a number to find the digital root"

num2 = gets.chomp


def getroot num

	temp=0
	arr = num.split("").map(&:to_i)

	arr.each do |x|
		temp+= x
	end

	if temp >= 10
		getroot(temp.to_s)
	else

		return temp
	end
end



puts getroot(num2)
