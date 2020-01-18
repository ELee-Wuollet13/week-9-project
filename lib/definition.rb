class Definition
  attr_reader :id
  attr_accessor :text, :word_id

  @@definitions = {}
  @@total_rows = 0

  def initialize(id, text, word_id)
    @text = text
    @word_id = word_id
    @id = id || @@total_defs += 1
  end

  def ==(definition_to_compare)
    (self.text() == definition_to_compare.text()) && (self.word_id() == definition_to_compare.word_id())
  end


  def self.all
    @@definitions.values
  end

  def save
    @@definitions[self.id] = Definition.new({:text => @text, :word_id => @word_id, :id => @id})
  end

  def self.find(id)
    @@definitions[id]
  end

  def update(text, word_id)
    self.text = text
    self.word_id = word_id
    @@definitions[self.id] = Definition.new({:text => @text, :word_id => @word_id, :id => @id})
  end

  def delete
    @@definitions.delete(self.id)
  end

  def self.clear
    @@definitions = {}
  end
end

def self.find_by_word(find_id)
  definitions = []
  @@definitions.values.each do |definition|
    if definition.word_id == find_id
      definitions.push(definition)
    end
  end
  definitions
end

def word
  word.find(self.word_id)
end
