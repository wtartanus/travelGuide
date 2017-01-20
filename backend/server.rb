require ("sinatra")
require( 'sinatra/contrib/all' ) if development?
require('./models/city')


get '/inspirations' do 
	service = City.new()
    we = City.all()
	return "hello world"
end