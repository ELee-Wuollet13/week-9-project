class Word

  attr_accessor :text, :id

  @@words = {}
  @@total_rows = 0

  def initialize(attributes)
    @text = attributes.fetch(:text)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def definition
    Definition.(self.definition_id)
  end

  def self.all
    @@words.values()
  end

  def save
    @@words[self.id] = Word.new({ :text => self.text, :id => self.id })
  end

  def ==(word_to_compare)
    self.text() == word_to_compare.text()
  end

  def self.clear
    @@words ={}
    @@total_rows = 0
  end

  def self.search(search)
    @@words.values().select { |a| a.text.match(/#{search}/i)}
  end

  def self.find(id)
    @@words[id]
  end

  def self.sort()
  sorted_array = []

  self.all.each do |a|
    sorted_array.push(a.name)
  end
  results = sorted_array.sort.map { |a|  self.search(a)[0] }
end

  def update(text)
      self.text = text
      @@word[self.id] = Word.new({ :text => self.text, :id => self.id})
  end

  def delete
    @@words.delete(self.id)
  end
end
