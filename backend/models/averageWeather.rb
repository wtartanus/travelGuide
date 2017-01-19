class AverageWeather

	attr_reader :id
	attr_accessor :city_id, :jan, :feb, :mar, :apr, :may, :june, :july, :aug, :sept, :oct, :nov, :dec

	def initialize(options)
		@id = options['id'].to_i
		@city_id = options['city_id'].to_i
		@jan = options['jan'].to_i
		@feb = options['feb'].to_i
		@mar = options['mar'].to_i
		@apr = options['apr'].to_i
		@may = options['may'].to_i
		@june = options['june'].to_i
		@july = options['july'].to_i
		@aug = options['aug'].to_i
		@sept = options['sept'].to_i
		@oct = options['oct'].to_i
		@nov = options['nov'].to_i
		@dev = options['dec'].to_i
	end

	def save()
		sql = "INSERT INTO temperatures (city_id, jan, feb, mar, apr, may, june, july, aug, sept, oct, nov, dec)
               VALUES (
                 #{@city_id},
                 #{jan},
                 #{feb},
                 #{mar},
                 #{apr},
                 #{may},
                 #{june},
                 #{july},
                 #{aug},
                 #{sept},
                 #{oct},
                 #{nov},
                 #{dec}
               ) RETURNING *"

          average = SqlRunner.run(sql);
          return average
	end

	def self.find(id)
		sql = "SELECT * FROM temperatures WHERE id = #{id}"
		average = AverageWeater.map_item(sql)
		return average
	end

	def self.getByCity(cityId)
		sql = "SELECT * FROM temperatures WHERE city_id = #{cityId}"
		average = AverageWeather.map_items(sql)
		return average
	end

	def self.all() 
		sql = "SELECT * FROM temperatures"
		average = AverageWeather.map_items(sql)
		return average
	end

	def self.update(options)
		sql = "UPDATE temperatures SET 
		       city_id = #{options[:city_id]},
		       jan = '#{options[:jan]}',
		       feb = '#{options[:feb]}',
		       mar = '#{options[:mar]}',
		       apr = '#{options[:apr]}',
		       may = '#{options[:may]}',
		       june = '#{options[:june]}',
		       july = '#{options[:july]}',
		       aug = '#{options[:aug]}',
		       sept = '#{options[:sept]}',
		       oct = '#{options[:oct]}',
		       nov = '#{options[:nov]}',
		       dec = '#{options[:dec]}',
		       WHERE id = #{options[:id]}"

		 SqlRunner.run(sql)
	end

	def self.destroy(id)
		sql = "DELETE FROM temperatures WHERE id = #{id}"
		SqlRunner.run(sql)
	end

	def self.destroy_all()
		sql = "DELETE FROM temperatures"
		SqlRunner.run(sql)
	end

	def self.map_items(sql)
		average = SqlRunner.run(sql)
		result = average.map( |average| AverageWeather.new( average ) )
		return result
	end

	def self.map_item(sql)
		average = AverageWeather.map_items(sql)
		return average.first
	end

end