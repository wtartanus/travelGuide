class Photo

	attr_reader :id
	attr_accessor :city_id, :link

	def initialize(options)
		@id = options['id'].to_i
		@city_id = options['city_id'].to_i
		@link = options['link']
	end

	def dave()
		sql = "INSERT INTO photos (city_id, link)
               VALUES (
                 #{@city_id},
                 #{@link}
               ) RETURNING *"

          photo = SqlRunner.run(sql);
          return photo
	end

	def self.find(id)
		sql = "SELECT * FROM photos WHERE id = #{id}"
		photo = Photo.map_item(sql)
		return photo
	end

	def self.all() 
		sql = "SELECT * FROM photos"
		photos = Photo.map_items(sql)
		return photos
	end

	def self.update(update)
		sql = "UPDATE photos SET 
		       city_id = #{options[:city_id]},
		       link = '#{options[:link]}'
		       WHERE id = #{options[:id]}"

		 SqlRunner.run(sql)
	end

	def self.destroy(id)
		sql = "DELETE FROM photos WHERE id = #{id}"
		SqlRunner.run(sql)
	end

	def self.destroy_all()
		sql = "DELETE FROM photos"
		SqlRunner.run(sql)
	end

	def self.map_items(sql)
		photos = SqlRunner.run(sql)
		result = photos.map( |photo| Photo.new( photo ) )
		return result
	end

	def self.map_item(sql)
		photos = Photo.map_items(sql)
		return photos.first
	end

end