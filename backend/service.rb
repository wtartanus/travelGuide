require_relative "./city"

class Service

	def getInspirations()
		city = City.new1()
		citys = city.all()
		return citys
	end
end