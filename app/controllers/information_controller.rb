class InformationController < ApplicationController

	def information
		#@authorName = params["authorName"]
		#@published = params["published"]
		#@updated = params["updated"]
		#@videoTitle = params["videoTitle"]
		@posterGender = params["posterGender"]
		@posterAge = params["posterAge"]
		@genre = params["genre"]
		@audienceGender = params["audienceGender"]
		url = "http://gdata.youtube.com/feeds/api/videos?q=#{@genre}&#{@posterGender}&max-results=10&v=2&dimensions=age#{@posterAge},#{@audienceGender}&prettyprint=true"
		url.gsub!(/\s+/, "")
		#binding.pry
		#@data = []
		@data = HTTParty.get(url)
		#URI.parse(data)
		#@data.push(data)
		#binding.pry
		render :information
	end
end