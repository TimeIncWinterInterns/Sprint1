class YoutubeController < ApplicationController

	def information
		posterGender = params["posterGender"]
		posterAge = params["posterAge"]
		subscribers = params["subscribers"]
		monthlyViews = params["monthlyViews"]
		audienceGender = params["audienceGender"]
		audienceAge = params["audienceAge"]
		audienceLocation = params["audienceLocation"]
		posterLocation = params["posterLocation"]
		genre = params["genre"]

		url = "http://gdata.youtube.com/feeds/api/videos?q=#{genre}&max-results=9&v=2&&key=AIzaSyAvkL7_sQDpLa1g86QL7K4yaEkiV_OGBKc"
		url.gsub!(/\s+/, "")
		data = HTTParty.get(url)

		doc = Nokogiri::XML(data)

		@array =[]

		doc.css('entry').each do |youtuber|
			author = youtuber.children[14].children[0].text
			published = youtuber.children[1].text
			updated = youtuber.children[2].text
			video_title = youtuber.children[5].text
			# video_url = youtuber.children[6].attributes["src"].value
			# redirect_page = youtuber.children[7].attributes["href"].value
			hash = {}
			hash["author_name"]= author
			hash["published"] = published
			hash["updated"] = updated
			hash["video_title"] = video_title
			# hash["video_url"] = video_url
			# hash["redirect_page"] = redirect_page
			@array.push(hash)
		end

		render :json => @array

	end

	def show 

		render 'youtube/show'
	end


end