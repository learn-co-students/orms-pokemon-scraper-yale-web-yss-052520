class Pokemon

    attr_accessor :id, :name, :type, :db
    @@count = 0

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db)
        id, name, type = db.execute("SELECT * FROM pokemon WHERE id = ?", id)[0]
        pikachu = Pokemon.new(id: id, name: name, type: type, db: db)
    end

end
