require "pry"
class Pokemon
    attr_reader :id, :name, :type, :db
    @@all = []

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
        self.class.all << self
    end

    def self.save(name, type, db)
        id = find_id(name, type)
        db.execute("INSERT INTO pokemon (id, name, type) VALUES (?, ?, ?);", id, name, type)
    end

    def self.find_id(name, type)
        all().find{|pokemon| pokemon.name == name && type == type}.id
    end

    def self.find(id_number, db)
        array = db.execute("SELECT name, type FROM pokemon WHERE id = ?", id_number)[0]
        # binding.pry
        Pokemon.new(id: id_number, name: array[0], type: array[1], db: db)
    end


    def self.all()
        @@all
    end
end
