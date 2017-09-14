class Url < ApplicationRecord
	validates :long_url, presence: true 
	validate :http
	before_create:shorten 

	def shorten
		self.short_url = SecureRandom.hex(5)
	end 

	def http 
		if self.long_url[0..3] != 'http' && self.long_url[0..2] == 'www'
			self.long_url = 'http://' + self.long_url 
		elsif self.long_url[0..2] != 'www' && self.long_url[0..3] != 'http'
			self.long_url = 'http://www.' + self.long_url 
		elsif self.long_url[0..3] == 'http'

		end 
	end 
end
