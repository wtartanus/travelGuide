class Activity

	attr_reader :id
	attr_accessor :city_id, :name, :description, :address, :photo_link

	def initialize()
	end

	def initialize(options)
		@id = options['id'].to_i
		@city_id = options['city_id'].to_i
		@name = options['name']
		@description = options['description']
		@address = options['address']
		@photo_link = options['photo_link']
	end

	def save()
		sql = "INSERT INTO photos (city_id, name, description, address, photo_link)
               VALUES (
                 #{@city_id},
                 #{@name},
                 #{@description},
                 #{@address},
                 #{@photo_link}
               ) RETURNING *"

          activity = SqlRunner.run(sql);
          return activity
	end

	def self.find(id)
		sql = "SELECT * FROM activities1 WHERE id = #{id}"
		activity = Photo.map_item(sql)
		return activity
	end

	def self.getByCity(cityId)
		sql = "SELECT * FROM activities1 WHERE city_id = #{cityId}"
		activity = Photo.map_items(sql)
		return activity
	end

	def self.all() 
		sql = "SELECT * FROM activities1"
		activity = Photo.map_items(sql)
		return activity
	end

	def self.update(options)
		sql = "UPDATE activities1 SET 
		       city_id = #{options[:city_id]},
		       name = '#{options[:name]}',
		       description = '#{options[:description]}',
		       address = '#{options[:address]}',
		       photo_link = '#{options[:photo_link]}',
		       WHERE id = #{options[:id]}"

		 SqlRunner.run(sql)
	end

	def self.destroy(id)
		sql = "DELETE FROM activities1 WHERE id = #{id}"
		SqlRunner.run(sql)
	end

	def self.destroy_all()
		sql = "DELETE FROM activities1"
		SqlRunner.run(sql)
	end

	def self.map_items(sql)
		activies = SqlRunner.run(sql)
		result = activities.map( |activity| Photo.new( activity ) )
		return result
	end

	def self.map_item(sql)
		activities = Activity.map_items(sql)
		return activities.first
	end

end