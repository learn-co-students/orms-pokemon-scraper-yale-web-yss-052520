class Pokemon
    attr_reader :id, :name, :type, :db
    
    def initialize(id:, name:, type:, db:)
        @id = id 
        @name = name 
        @type = type 
        @db = db 
    end
    
    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name,type) VALUES (?,?)", name, type) 
    end

    def self.find(id , db)
        ary = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
        name = ary[0][1]
        type = ary[0][2]
        Pokemon.new(id: id ,name: name,type: type,db: db)
    end

end
