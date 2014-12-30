class RootController < ApplicationController

	def index
		client = YouTubeIt::Client.new(:dev_key => "AIzaSyAvkL7_sQDpLa1g86QL7K4yaEkiV_OGBKc")
		render "root/index"
	end
end