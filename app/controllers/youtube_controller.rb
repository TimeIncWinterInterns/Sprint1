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
			if youtuber.children[14].children[0]
				author = youtuber.children[14].children[0].text
			else
				author = ""
			end
			if youtuber.children[1]
				published = youtuber.children[1].text
			else
				published = ""
			end
			if youtuber.children[2]
				updated = youtuber.children[2].text
			else
				updated = ""
			end
			if youtuber.children[5]
				video_title = youtuber.children[5].text
			else
				video_title = ""
			end
			if youtuber.children[6].attributes["src"]
				video_url = youtuber.children[6].attributes["src"].value
			else
				video_url = "http://marshallandmagnes.files.wordpress.com/2011/11/8_x.png"
			end
			if youtuber.children[7].attributes["href"]
				redirect_page = youtuber.children[7].attributes["href"].value
			else
				redirect_page = "http://marshallandmagnes.files.wordpress.com/2011/11/8_x.png"
			end
			hash = {}
			hash["author_name"]= author
			hash["published"] = published
			hash["updated"] = updated
			hash["video_title"] = video_title
			hash["video_url"] = video_url
			hash["redirect_page"] = redirect_page
			@array.push(hash)
		end

		render :json => @array

	end

	def show 
		render :show
	end


end