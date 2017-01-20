require("pg")
require("pry")

class SqlRunner

	def self.run(sql)
		begin
			db = PG.connect({dbname: 'travel', host: 'localhost', user: 'postgres', password: 'spierdalaj'})
			result = db.exec(sql)
		ensure
			db.close()
		end
		return result
	end

end