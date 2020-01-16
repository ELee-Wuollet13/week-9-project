class Word
  attr_reader :id
  attr_accessor :name

  @@words = {}
  @@total_rows = 0

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch.(:id) || @@total_rows += 1
  end

  def self.all
    @@words.values
  end

  def dictionary
    Dictionary.find(self.dictionary_id)
  end

  def ==(word_to_compare)
    self.name() == word_to_compare.name()
  end

  def self.all
    @@words.values
  end

  def save
    @@words[self.id] = Word.new(self.name, self.id)
  end

  def self.find(id)
    @@words[id]
  end

  def update(name)
    self.name = name
    @@words[self.id] = Word.new(self.name, self.id)
  end

  def delete
    @@words.delete(self.id)
  end

  def self.clear
    @@words = {}
  end
end
