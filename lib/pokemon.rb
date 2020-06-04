require 'sqlite3'
require 'pry'

class Pokemon

    attr_accessor :id, :name, :type, :db

    @@all = []

    #db = SQLite3::Database.new("chinook.db")

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db

    end

    def self.save(name, type, db)
        db.execute('INSERT INTO pokemon (name, type) VALUES (?, ?)', name, type)
    end

    def self.find(id, db)
        pkmn_arr = db.execute('SELECT * FROM pokemon WHERE id = ?',id)[0]
        self.new(id: pkmn_arr[0], name: pkmn_arr[1], type: pkmn_arr[2], db: db)
    end

end
