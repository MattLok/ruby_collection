#### Problem 28
#
#	Number spiral program
# => 
####

require 'pry'
$num2 = 1001
$x = 0
$y = 1000
$test = 1000
$starting_num = $num2 * $num2
def input(num)
	arr = []
	num.times do |x|
		arr.push(Array.new(num,0))
	end
	arr
end

def fill_spiral(arr)
	num = $num2
	until $starting_num <= 0
		until ($y == 0 || arr[$x][$y] != 0)
			arr[$x][$y] = $starting_num
			$starting_num -= 1
			$y -= 1
			if arr[$x][$y] != 0
				$x +=1 
				$y +=1
				break
			end
		end
		
		until ($x >= $test || arr[$x][$y] !=0)
				arr[$x][$y] = $starting_num
				$starting_num -=1
				$x +=1
				if arr[$x][$y] != 0 
					$y += 1
					$x -= 1
					break
				end
		end
		until ($y >= $test || arr[$x][$y] != 0)
			arr[$x][$y] = $starting_num
			$starting_num -=1
			$y += 1
			if arr[$x][$y] != 0

				$x -= 1
				$y -= 1
				break
			end

		end

		until arr[$x][$y] != 0

			arr[$x][$y] = $starting_num
			$starting_num -= 1
			$x -=1
			if arr[$x][$y] != 0
				$x +=1
				$y -=1

				break
			end
		end
	end
	arr
end

def print_spiral(arr)
	arr.each do |row|
		print "#{row}\n"
	end
end

def get_diagonals(arr)
	diags = []
	diags.push((0..$test).collect{|i|arr[i][i]})
	rev = arr.reverse
	diags.push((0..$test).collect{|x|rev[x][x]})
	diags.flatten!
	diags.inject(:+)-1
end

puts get_diagonals(fill_spiral(input(1001)))
