class InformationController < ApplicationController

	def information
		#@authorName = params["authorName"]
		#@published = params["published"]
		#@updated = params["updated"]
		#@videoTitle = params["videoTitle"]
		#url = "http://gdata.youtube.com/feeds/api/videos?q=male&max-results=10&v=2&dimensions=age7-18,male&prettyprint=true"
		#url.gsub!(/\s+/, "")
		#@data = []
		#data = HTTParty.get(url)
		#@data.push(data)
		#binding.pry
		#render 
		render "<div>SUCCESS</div>"
		#render "information/information"
	end
end