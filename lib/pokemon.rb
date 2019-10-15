class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
    db.execute(sql, name, type)
  end

  def self.find(poke_id, db)
    pokedex = db.execute("SELECT * FROM pokemon WHERE id = ?", poke_id).flatten
    Pokemon.new(id: pokedex[0], name: pokedex[1], type: pokedex[2], db: db)
  end

end
