require ("sinatra")
require( 'sinatra/contrib/all' ) if development?
require("pry")
require("json")
require('./models/city')


get '/inspirations' do 
	service = City.new1()
    we = City.all()
    # binding.pry
    wojtek = []
    for city in we
    	woj = {
    		"city" => city.city,
    		"country" => city.country,
    		"description" => city.description,
    		"history" => city.history
    	}

    	wojtek.push(woj)
    end
	return json wojtek
end