class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
  end

  def self.save(name, value)
    sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
    @db.execute(sql, name, type)
  end

  def find
  end

end
