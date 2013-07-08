

def py
	for a in 1..500

		for b in 1..500

			c =1000 - b - a
			if (a*a) + (b*b) == c*c
				puts "found #{a} + #{b} + #{c} = 1000"
				return a * b * c
			end
		end
	end
end


py()


