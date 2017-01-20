require './sqlRunner'

class City

	attr_reader :id
	attr_accessor :city, :country, :description, :history

	def self.new1()
	end

	def initialize(options)
	   @id = options['id'].to_i
       @city = options['city']
       @country = options['country']
       @description = options['description']
       @history = options['history']
	end



	def save()
		sql = "INSERT INTO photos (city, country, descritption, history)
               VALUES (
                 #{@city},
                 #{@country},
                 #{@description},
                 #{@history}
               ) RETURNING *"

          city = SqlRunner.run(sql);
          return city
	end

	def self.find(id)
		sql = "SELECT * FROM inspirations WHERE id = #{id}"
		city = City.map_item(sql)
		return city
	end

	def self.getByCityName(city)
		sql = "SELECT * FROM inspirations WHERE city = #{city}"
		city = City.map_items(sql)
		return city
	end

	def self.all() 
		sql = "SELECT * FROM inspirations"
		citys = City.map_items(sql)
		return citys
	end

	def self.update(options)
		sql = "UPDATE photos SET 
		       city = #{options[:city]},
		       country = '#{options[:country]}',
		       descritption = '#{options[:description]}',
		       history = '#{options[:history]}'
		       WHERE id = #{options[:id]}"

		 SqlRunner.run(sql)
	end

	def self.destroy(id)
		sql = "DELETE FROM inspirations WHERE id = #{id}"
		SqlRunner.run(sql)
	end

	def self.destroy_all()
		sql = "DELETE FROM inspirations"
		SqlRunner.run(sql)
	end

	def self.map_items(sql)
		citys = SqlRunner.run(sql)

		result = citys.map{ | city | City.new( city )}

		return result
	end

	def self.map_item(sql)
		citys = City.map_items(sql)
		return Citys.first
	end

end