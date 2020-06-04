class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(pk_name, pk_type, db)
        db.execute('INSERT INTO pokemon (name, type) VALUES (?, ?)', pk_name, pk_type)
    end

    def self.find(id, db)
        data = db.execute('SELECT * FROM pokemon WHERE id = ?', id).flatten
        # binding.pry
        self.new(id: data[0], name: data[1], type: data[2], db: db)
    end

end

# Pokemon
#   .initialize
#     is initialized with keyword arguments of id, name, type and db (FAILED - 1)
#   .save
#     saves an instance of a pokemon with the correct id (FAILED - 2)
#   .find
#     finds a pokemon from the database by their id number and returns a new Pokemon object (FAILED - 3)