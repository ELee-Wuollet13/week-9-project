class Word
  attr_reader :id
  attr_accessor :name, :dictionary_id

  @@words = {}
  @@total_rows = 0

  def initialize(name, dictionary_id, id)
    @name = name
    @dictionary_id = dictionary_id
    @id = id || @@total_rows += 1
  end

  def self.find_by_dictionary(alb_id)
    words = []
    @@words.values.each do |word|
      if word.dictionary_id == alb_id
        words.push(word)
      end
    end
    words
  end

  def dictionary
    Dictionary.find(self.dictionary_id)
  end

  def ==(word_to_compare)
    (self.name() == word_to_compare.name()) && (self.dictionary_id() == word_to_compare.dictionary_id())
  end

  def self.all
    @@words.values
  end

  def save
    @@words[self.id] = Word.new(self.name, self.dictionary_id, self.id)
  end

  def self.find(id)
    @@words[id]
  end

  def update(name, dictionary_id)
    self.name = name
    self.dictionary_id = dictionary_id
    @@words[self.id] = Word.new(self.name, self.dictionary_id, self.id)
  end

  def delete
    @@words.delete(self.id)
  end

  def self.clear
    @@words = {}
  end
end
