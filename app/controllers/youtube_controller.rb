class YoutubeController < ApplicationController

	def show
		binding.pry

		render :json=> @data
	end

end