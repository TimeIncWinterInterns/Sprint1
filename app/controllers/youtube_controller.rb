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
		order_by = params["orderby"]
		genre = params["genre"]
		request_again = true
		total_results = 0

		location_lat_lng = ""
		max_results = 10
		start_index = 1
		@array = []
		is_results = true

		if posterLocation != ""
			posterLocation.gsub!(/\s+/, "+")
			location_url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{posterLocation}"
			location_data = HTTParty.get(location_url)
			if location_data["status"] == "OK"
				location_lat_lng = "#{location_data["results"][0]["geometry"]["location"]["lat"]},#{location_data["results"][0]["geometry"]["location"]["lng"]}"
			end
		end

		if views.include? "+"
			#views_to = views.gsub(/[\s+\+]/,"").split('-')[1]
			views_query = "yt:statistics\/@viewCount > #{views.gsub(/[\s+\+]/,"").split('-')[1]}"
			#views_from = views.gsub(/\s+/, "").split('-')[0]
			#views_to = views.gsub(/\s+/, "").split('-')[1]
		else
			views_query = "yt:statistics/@viewCount > #{views.gsub(/[\s+\+]/,"").split('-')[0]} and yt:statistics/@viewCount < #{views.gsub(/[\s+\+]/,"").split('-')[1]}"
		end

		while request_again
			#url = "http://gdata.youtube.com/feeds/api/videos?q=#{genre}&max-results=8&v=2&&key=AIzaSyAvkL7_sQDpLa1g86QL7K4yaEkiV_OGBKc"
			#url = "http://gdata.youtube.com/feeds/api/videos?q=#{genre}&start-index=#{start_index}&v=2&part=statistics&location=#{location_lat_lng}&orderby=#{order_by}&fields=entry[%{QUERY}]&key=AIzaSyA0EcuzLSYPVHkyiUGMYxKlqFtahLANVkQ"
			url = "http://gdata.youtube.com/feeds/api/videos?q=#{genre}&max-results=#{max_results}&start-index=#{start_index}&v=2&part=statistics&location=#{location_lat_lng}&orderby=#{order_by}&key=AIzaSyA0EcuzLSYPVHkyiUGMYxKlqFtahLANVkQ"
			#http://gdata.youtube.com/feeds/api/videos?q=oras&max-results=10&v=2&part=statistics&ageGroup=18-24&sort=-5000 - 8000&order=viewCount&key=AIzaSyA0EcuzLSYPVHkyiUGMYxKlqFtahLANVkQ
			#url = "https://www.googleapis.com/youtube/v3/search?q=oras&part=snippet&order=rating&q=YouTube+Data+API&type=video&videoCaption=closedCaption&key=AIzaSyD4E3VKmr0mg2TUmZ2qQXWdIX87DSaeMIk"
			#&fields=entry[yt:statistics/@viewCount > 10000 and yt:statistics/@viewCount < 50000]
			#&fields=entry[#{views_query}]
			url.gsub!(/\s+/, "+")
			#url = url % {:QUERY => views_query}
			#binding.pry
			data = HTTParty.get(url)
			doc = Nokogiri::XML(data)
			if start_index == 1
				total_results = Integer(doc.children[0].children[13].children[0].text)
			end
			if (total_results - (start_index - 1))  < 11
				request_again = false
			end
			doc.css('entry').each do |youtuber|
				author = "Not Available"
				published = "Not Available"
				updated = "Not Available"
				video_title = "Not Available"
				video_url = nil
				redirect_page = nil
				view_count = "Not Available"
				number_of_likes = "Not Available"
				number_of_dislikes = "Not Available"

				youtuber.children.each do |child|
					if child.name == "author" && child.children[0] != nil && child.children[0].name == "name"
						author = child.children[0].text
					end
					if child.name == "published"
						published = child.text
					end
					if child.name == "updated"
						updated = child.text
					end
					if child.name == "title"
						video_title = child.text
					end
					if child.name == "content"
						video_url = child.attributes["src"].value
					end
					if child.name == "link" && child.attributes["rel"].value == "alternate"
						redirect_page = child.attributes["href"].value
					end
					if child.name == "statistics"
						view_count = child.attributes["viewCount"].value
					end
					if child.name == "rating" && child.namespace.prefix == "yt"
						number_of_likes = child.attributes["numLikes"].value
						number_of_dislikes = child.attributes["numDislikes"].value
					end
				end

				if video_url == nil || redirect_page == nil
					next
				end

				hash = {}
				hash["author_name"]= author
				hash["published"] = published
				hash["updated"] = updated
				hash["video_title"] = video_title
				hash["video_url"] = video_url
				hash["redirect_page"] = redirect_page
				hash["number_of_likes"] = number_of_likes
				hash["view_count"] = view_count
				hash["number_of_dislikes"] = number_of_dislikes
				@array.push(hash)
				if @array.size == 10
					request_again = false
					break
				end
			end
			start_index += max_results
		end
		render :json => @array

	end

	def show 
		render :show
	end

end