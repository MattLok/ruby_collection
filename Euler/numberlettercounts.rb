

# If the numbers 1 to 5 are written out in words: one, two, three, four, five, then
#there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters
# and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is
# in compliance with British usage.



require 'numbers_and_words'

def rep s
	 s.gsub!('-','')
	 s.gsub(' ','')

end

def stuff
	self.gsub!('-', '')
	self.gsub!(' ','')
end
total =0

arr = (1..1000).to_a


	 arr.map!{|x|
	 	I18n.with_locale(:en) { x.to_words hundreds_with_union: true }
	 }
	 arr.map! do |y|
	 	y.gsub!('-','')
	 	y.gsub(' ','')
	 end


(00..999).each do |z|

	total += (arr[z].length)

end

tex = "Hi this-is-my-new-regex-test"
t = "subbing spaces and-these-hyphen things"

puts arr

puts total
