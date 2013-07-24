#
#	Double Base Palindromes
# Problem 36
#

#The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.
#Find the sum of all numbers, less than one million,
# which are palindromic in base 10 and base 2.
#(Please note that the palindromic number, in either base, may not include leading zeros.)

def first_million
	palindromes = []
	(1..999999).each do |x|
		rev = x.to_s.reverse
		if x.to_s == rev
			palindromes << x
		end
	end
	palindromes
end

def base_palindromes(arr)
	base_pali = []
	arr.each do |x|
		base = x.to_s(2)
		if base == base.reverse
			base_pali << x
		end
	end
	base_pali
end

puts base_palindromes(first_million()).inject(:+)

