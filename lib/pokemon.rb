class Pokemon
    attr_reader :id, :name, :type, :db
    
    def initialize(id:, name:, type:, db:)
        @id = id 
        @name = name 
        @type = type 
        @db = db 
    end
    
    # Saving a Pokemon to database by storing their name and type!
    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name,type) VALUES (?,?)", name, type) 
    end

    # Here, we are transforming a unique pokemon stored in the database back into 
    # a Pokemon object!
    def self.find(id , db)
        # Since id is unique, this will return a single row from the pokemon table 
        # The row is in matrix form (2D) array, so we index 0th element to get the array 
        # that contains the attributes of the Pokemon. 
        arr = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
        new_pokemon = arr[0]
        name = new_pokemon[1]   #name is 2nd element after id (2nd column)
        type = new_pokemon[2]   #name is in the 3rd column
        Pokemon.new(id: id ,name: name,type: type,db: db)
    end

end
