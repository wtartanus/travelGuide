require "/models/city"
require "byebug"

class Service

	def getInspirations()
		citys = City.all()
		byebug
		return citys
	end
end