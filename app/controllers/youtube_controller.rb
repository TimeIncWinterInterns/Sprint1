class YoutubeController < ApplicationController

	def information
		posterGender = params["posterGender"]
		posterAge = params["posterAge"]
		subscribers = params["subscribers"]
		views = params["views"]
		audienceGender = params["audienceGender"]
		audienceAge = params["audienceAge"]
		audienceLocation = params["audienceLocation"]
		posterLocation = params["posterLocation"]
		genre = params["genre"]



		url = "http://gdata.youtube.com/feeds/api/videos?q=#{genre}&max-results=9&v=2&part=statistics&ageGroup=#{posterAge}&sort=-#{views}&order=viewCount&key=AIzaSyA0EcuzLSYPVHkyiUGMYxKlqFtahLANVkQ"

		url.gsub!(/\s+/, "")
		data = HTTParty.get(url)
		doc = Nokogiri::XML(data)

		@array =[]



		doc.css('entry').each do |youtuber|
			if youtuber.children[14].children[0]
				author = youtuber.children[14].children[0].text
			else
				author = "Not Available"
			end
			if youtuber.children[1]
				published = youtuber.children[1].text
			else
				published = "Not Available"
			end
			if youtuber.children[2]
				updated = youtuber.children[2].text
			else
				updated = "Not Available"
			end
			if youtuber.children[5]
				video_title = youtuber.children[5].text
			else
				video_title = "Not Available"
			end
			if youtuber.children[6].attributes["src"]
				video_url = youtuber.children[6].attributes["src"].value
			else
				video_url = "http://www.ncl.eu/images/mg/NCL/s/184/all-ships_image-not-available.jpg"
			end
			if youtuber.children[7].attributes["href"]
				redirect_page = youtuber.children[7].attributes["href"].value
			else
				redirect_page = "http://www.ncl.eu/images/mg/NCL/s/184/all-ships_image-not-available.jpg"
			end
			if youtuber.children[23].name == "statistics"
				view_count = youtuber.children[23].attributes["viewCount"].value
			elsif youtuber.children[24].name == "statistics"
				view_count = youtuber.children[24].attributes["viewCount"].value
			elsif youtuber.children[25].name == "statistics"
				view_count = youtuber.children[25].attributes["viewCount"].value
			elsif youtuber.children[26].name == "statistics"
				view_count = youtuber.children[26].attributes["viewCount"].value
			else
				view_count = "Not Available"
			end
			# if youtuber.children[28] != nil
			# 	average_rating = youtuber.children[28].attributes["average"].value
			# 	number_of_raters = youtuber.children[28].attributes["numRaters"].value
			# elsif youtuber.children[26].attributes == {}
			# 	average_rating = youtuber.children[27].attributes["average"].value
			# 	number_of_raters = youtuber.children[27].attributes["numRaters"].value
			# else
			# 	average_rating = "Not Available"
			# 	number_of_raters = "Not Available"
			# end
			if youtuber.children[25].name == "rating" && youtuber.children[25].namespace.prefix == "yt"
				number_of_likes = youtuber.children[25].attributes["numLikes"].value
				number_of_likes = youtuber.children[25].attributes["numLikes"].value
			elsif youtuber.children[26].name == "rating" && youtuber.children[26].namespace.prefix == "yt"
				number_of_likes = youtuber.children[26].attributes["numLikes"].value
				number_of_likes = youtuber.children[26].attributes["numLikes"].value
			elsif youtuber.children[27].name == "rating" && youtuber.children[27].namespace.prefix == "yt"
				number_of_likes = youtuber.children[27].attributes["numLikes"].value
				number_of_likes = youtuber.children[27].attributes["numLikes"].value
			elsif youtuber.children[28].name == "rating"
				number_of_likes = youtuber.children[28].attributes["numLikes"].value
				number_of_dislikes = youtuber.children[28].attributes["numDislikes"].value
			elsif youtuber.children[29].name == "rating"
				number_of_likes = youtuber.children[29].attributes["numLikes"].value
				number_of_dislikes = youtuber.children[29].attributes["numDislikes"].value
			elsif youtuber.children[30].namespace == "rating" && youtuber.children[27].namespace.prefix == "yt"
				number_of_likes = youtuber.children[30].attributes["numLikes"].value
				number_of_likes = youtuber.children[30].attributes["numLikes"].value
			else 
				number_of_likes = "Not Available"
				number_of_dislikes = "Not Available"
			end
			hash = {}
			hash["author_name"]= author
			hash["published"] = published
			hash["updated"] = updated
			hash["video_title"] = video_title
			hash["video_url"] = video_url
			hash["redirect_page"] = redirect_page
			hash["number_of_likes"] = number_of_likes
			hash["number_of_dislikes"] = number_of_dislikes
			@array.push(hash)
		end

		render :json => @array

	end

	def show 
		render :show
	end


end