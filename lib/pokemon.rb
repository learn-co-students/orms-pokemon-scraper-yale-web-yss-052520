class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(identifier, database)
        pokemon = database.execute("SELECT name, type FROM pokemon WHERE id = ?", identifier)
        Pokemon.new(id: identifier, name: pokemon[0][0], type: pokemon[0][1], db: database)
    end
end
