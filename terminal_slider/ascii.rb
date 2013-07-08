#### ASCII Slider Project


class Slider

  attr_accessor :length, :bar, :indicator

  def initialize (length = 10, bar = '=' , indicator = '[]')
    @length = length
    @bar = bar
    @indicator = indicator
    create_slider


  end

  def create_slider

    @slide = Array.new(@length, @bar)

    @slide.push(@indicator)
    @slide.push(Array.new(@length,@bar))
    @slide.flatten!

    draw_slider

  end

  def slide_bar(newbar)
    self.bar = newbar
    draw_slider

  end

  def draw_slider
    print "| "
    for y in (0..@slide.length-1)
      
      if @slide[y] == @indicator
        print "#{@indicator}"
      else
      print "#{@bar}"
    end
    end
    print " |"
    puts

  end

  def find_slider
     @slide.index(@indicator)
  end

  def position(spaces)

    if spaces.class == Float 
      float_move(spaces)
    else


      current = (find_slider)
      newpos = ((find_slider)+spaces)

      if((current +spaces) >= @slide.length)
        newpos = (current +spaces) % @slide.length
      end

      @slide[find_slider], @slide[newpos] = @slide[newpos], @slide[find_slider]
      
      draw_slider
    end

  end

  def find_center

    center = @length 

    @slide[find_slider], @slide[center] = @slide[center], @slide[find_slider]

    draw_slider
  end

  def float_move (value)
    value *= 10

    if value < 0 
      value *= -1

      increment = (value % @length).round

      current = (find_slider)
      newpos = ((find_slider)-increment)

      if((current -increment) <=  0)       # @slide.length)
        newpos = (current - increment) % @slide.length
      end

      @slide[find_slider], @slide[newpos] = @slide[newpos], @slide[find_slider]

      draw_slider

    else

      increment = (value % @length).round

      current = (find_slider)
      newpos = ((find_slider)+increment)

      if((current +increment) >= @slide.length)
        newpos = (current +increment) % @slide.length
      end

      @slide[find_slider], @slide[newpos] = @slide[newpos], @slide[find_slider]

      draw_slider



    end
    

  end

end

# a = Slider.new(10, '-','x')

# b = Slider.new(10, '-','o')

print "Command me\n Horizonatal track? : "
track = gets.chomp
print "Slider length : \n"
len = gets.chomp.to_i
user = Slider.new(len,track,'[]')
going = true

while (going)

  input = gets.chomp

  if input == '<'
    user.position(-1)
  elsif input == '>'
    user.position(1)
  elsif input == "|"
    user.find_center
  elsif input == "change"
    print "Give me new character:\n"
    char = gets.chomp
    user.slide_bar(char)
  elsif input == 'quit'
    going = false
  elsif input.include?('.')
    user.position(input.to_f)
  else
    user.position(input.to_i)

  end
    


end







