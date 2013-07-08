

a =1
b = 2


cont = true

while cont #(a < 500)

	while b < 500
		c = 1000 - b -a

		if (a*a) + (b*b) == (c *c)
			puts "found #{a} + #{b} + #{c} = 1000!"
			cont = false
		end

		print '.'
		b += 1
	end
	a += 1
	b = (a +1)
	puts a
end

