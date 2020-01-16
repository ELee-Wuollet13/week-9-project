class Dictionary
  attr_reader :id
  attr_accessor :name

  @@dictionarys = {}
  @@total_rows = 0

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def word
    Word.(self.word_id)
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
    @@words ={}
    @@total_rows = 0
  end

  def self.find(id)
    @@dictionarys[id]
  end

  def update(name)
      self.name = name
      @@dictionary[self.id] = Word.new({ :name => slef.name, :id => self.id})
  end

  def delete
    @@dictionarys.delete(self.id)
  end

end
