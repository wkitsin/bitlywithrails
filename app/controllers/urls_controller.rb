class UrlsController < ApplicationController

	def index
		@urls = Url.all 
	end 

	def show 
		byebug
		@urls = Url.find(params[:id])
	end 
end
