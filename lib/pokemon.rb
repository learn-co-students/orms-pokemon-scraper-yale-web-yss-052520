class Pokemon
    @@all = [] 
    attr_reader :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id 
        @name = name 
        @type = type 
        @db = db 
    end 

    def self.save(name, type, db)
      db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
    end

    def self.find(id, db)
       name = db.execute("SELECT pokemon.name FROM pokemon WHERE pokemon.id = ?;", id)[0][0]
       type = db.execute("SELECT pokemon.type FROM pokemon WHERE pokemon.id = ?;", id)[0][0]
        
      Pokemon.new(id: id, name: name, type: type, db: db)
    end 

      
end
