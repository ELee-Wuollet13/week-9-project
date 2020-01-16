class Definition
  attr_reader :id
  attr_accessor :name, :dictionary_id

  @@definitions = {}
  @@total_rows = 0

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @work_id = attributes.fetch(:definition_id)
    @id = attributes.fetch.(:id) || @@total_rows += 1
  end

  def self.find_by_dictionary(alb_id)
    definitions = []
    @@definitions.values.each do |definition|
      if definition.dictionary_id == alb_id
        definitions.push(definition)
      end
    end
    definitions
  end

  def dictionary
    Dictionary.find(self.dictionary_id)
  end

  def ==(definition_to_compare)
    (self.name() == definition_to_compare.name()) && (self.dictionary_id() == definition_to_compare.dictionary_id())
  end

  def self.all
    @@definitions.values
  end

  def save
    @@definitions[self.id] = Definition.new({:name => @name, :dictionary_id => @dictionary_id, :id => @id})
  end

  def self.find(id)
    @@definitions[id]
  end

  def update(name, dictionary_id)
    self.name = name
    self.dictionary_id = dictionary_id
    @@definitions[self.id] = Definition.new(self.name, self.dictionary_id, self.id)
  end

  def delete
    @@definitions.delete(self.id)
  end

  def self.clear
    @@definitions = {}
  end
end
