class Dictionary
  attr_reader :id, :name

  @@dictionarys = {}
  @@total_rows = 0

  def initialize(name, id)
    @name = name
    @id = id || @@total_rows += 1
  end

  def words
    Word.(self.id)
  end

  def self.all
    @@dictionarys.values()
  end

  def save
    @@dictionarys[self.id] = Dictionary.new(self.name, self.id)
  end

  def ==(dictionary_to_compare)
    self.name() == dictionary_to_compare.name()
  end

  def self.clear

    @@total_rows = 0
  end

  def self.find(id)
    @@dictionarys[id]
  end

  def update(name)
      @name = name
  end

  def delete
    @@dictionarys.delete(self.id)
  end

end
