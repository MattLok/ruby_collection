#NASA API



 require 'HTTParty'
 require 'json'




class Nasa
	include HTTParty

	base_uri "data.nasa.gov/api"

	def get_category_index

	response = self.class.get("/get_category_index/")
	data = JSON.parse(response.body)
	cat = data["categories"]
	cat.each do |x|
		print "#{x['title']} - ID : #{x['id']} \n"
	end


	end

	def get_dataset (id)

	 response = self.class.get("/get_dataset?id=#{id}")
	 data = JSON.parse(response.body)
		print "\n#{data['post']['title']} - #{data['post']['id']} - #{data['post']['url']}\n------------\n"
		puts data['post']['content'].gsub!(/(<[^>]*>)|\n|\t/s) {""}

	 end

	def get_category_datasets (id, count =10)
		response = self.class.get("/get_category_datasets/?id=#{id}&count=#{count}&dev=1")
		data = JSON.parse(response.body)

		 data['posts'].each do |x|
			print "\n#{x['title']} - ID:#{x['id']} - URL: #{x['url']} \n -----------\n"
			puts x['content'].gsub!(/(<[^>]*>)|\n|\t/s) {""} #GSUB removes all of the html tags from the content paragraph
		end

	end

	def search (term)

		term.sub!(" ", "+")

		response = self.class.get("/get_search_results/?search=#{term}")
		data = JSON.parse(response.body)

		print "#{data['count']} Results returned for '#{term}'\n\n"

		data['posts'].each do |x|

			print "#{x['title']} -ID: #{x['id']}\nURL: #{x['url']}\n\n"

		end
	end

	def get_date_datasets (d,count =100) #Format YYYY, YYYY-MM, YYYY-MM-DD

		response = self.class.get("/get_date_datasets/?date=#{d}&count=#{count}")
		data = JSON.parse(response.body)

		print "#{data['count_total']} Total records for #{d}\n\n"
		 puts data['page:2']
		data['posts'].each do |x|
			print "#{x['title']} - ID:#{x['id']}\n"
		end



	end

	def get_recent_sets(count =15)
		response = self.class.get("/get_recent_datasets?count=#{count}")
		data = JSON.parse(response.body)

		data['posts'].each do |x|
			print "#{x['title']} - ID: #{x['id']} \n"
		end
	end

end


 a = Nasa.new()

################ Interacting with User ###############


going  = true

while going
	puts "Nasa API: Commands - Category Index - Category Sets - Data Set - Recent Sets - Data Set - Search"

	 input = gets.chomp.downcase

	 case input
	 when 'category index'
	 	a.get_category_index
	 when 'category sets'
	 	print "Please enter the Category ID:\n"
	 	id = gets.chomp
	 	a.get_category_datasets(id)
	 when "data set"
	 	print "Please enter the Data Set ID:\n"
	 	id = gets.chomp
	 	a.get_dataset(id)
	 when "recent sets"
	 	a.get_recent_sets
	 when "search"
	 	print "Enter your search \n"
	 	search = gets.chomp
	 	a.search(search)

	 when "quit"
	 	going = false
	 else

	 	puts "Try Again"
	 end


end


######################################################









