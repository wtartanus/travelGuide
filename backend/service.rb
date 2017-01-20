require_relative "./city"

class Service

	def getInspirations()
		city = City.new()
		citys = city.all()
		return citys
	end
end