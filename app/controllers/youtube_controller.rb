class YoutubeController < ApplicationController

	def show
		binding.pry
		genre = params["genre"]
		posterAge = params["posterAge"]
		posterGender = params["posterGender"]
		subscribers= params["subscribers"]
		monthlyViews = params["monthlyViews"]
		audienceAge = params["audienceAge"]
		audienceLocation = params["audienceLocation"],
		posterLocation = params["posterLocation"]

		url = "http://gdata.youtube.com/feeds/api/videos?q=#{genre}&max-results=10&v=2&key=AIzaSyAvkL7_sQDpLa1g86QL7K4yaEkiV_OGBKc"

		# &dimensions=age#{posterAge},#{posterGender},#{posterLocation}&prettyprint=true&metrics=#{subscribers}

		url.gsub!(/\s+/, "")
		@data = []
		data = HTTParty.get(url)
		@data.push(data)

		render :json=> @data
	end

end