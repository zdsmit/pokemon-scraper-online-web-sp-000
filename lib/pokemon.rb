class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
  end

  def self.save(name, type, db)
    sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id = ?"
    db.execute(sql, id).map do |match|
      pokemon_id = match[0]
      name = match[1]
      type = match[2]
      pokemon = Pokemon.new(id: pokemon_id, name: name, type: type, db: db)
      pokemon
    end
  end

end
