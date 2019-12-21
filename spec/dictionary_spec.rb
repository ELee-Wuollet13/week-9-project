require 'rspec'
require 'dictionary'
require 'word'

describe '#Dictionary' do

describe('#words') do
    it("returns an dictionary's words") do
      dictionary = Dictionary.new("first listed", nil)
      dictionary.save()
      word = Word.new("Bell", dictionary.id, nil)
      word.save()
      word2 = Word.new("Things", dictionary.id, nil)
      word2.save()
      expect(dictionary.words).to(eq([word, word2]))
    end
  end
  before(:each) do
    Dictionary.clear()
  end

  describe('#==') do
    it("is the same dictionary if it has the same attributes as another dictionary") do
      dictionary = Dictionary.new("Blue", nil)
      dictionary2 = Dictionary.new("Blue", nil)
      expect(dictionary).to(eq(dictionary2))
    end
  end

  describe(".all") do
    it("returns an empty array when there are no dictionarys") do
      expect(Dictionary.all()).to(eq([]))
    end
  end
  describe('#save') do
    it("saves an dictionary") do
      dictionary = Dictionary.new("All that you are", nil) # nil added as second argument
      dictionary.save()
      dictionary2 = Dictionary.new("Golden", nil) # nil added as second argument
      dictionary2.save()
      expect(Dictionary.all).to(eq([dictionary, dictionary2]))
    end
  end

  describe('.clear') do
    it("clears all dictionarys") do
      dictionary = Dictionary.new("Reaching", nil)
      dictionary.save()
      dictionary2 = Dictionary.new("Stuff", nil)
      dictionary2.save()
      Dictionary.clear()
      expect(Dictionary.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds an dictionary by id") do
      dictionary = Dictionary.new("Grass overflow", nil)
      dictionary.save()
      dictionary2 = Dictionary.new("Blue", nil)
      dictionary2.save()
      expect(Dictionary.find(dictionary.id)).to(eq(dictionary))
    end
  end

  describe('#update') do
    it("updates an dictionary by id") do
      dictionary = Dictionary.new("Grass overflow", nil)
      dictionary.save()
      dictionary.update("A holiday suprise")
      expect(dictionary.name).to(eq("A holiday suprise"))
    end
  end

  describe('#delete') do
    it("deletes an dictionary by id") do
      dictionary = Dictionary.new("Grass overflow", nil)
      dictionary.save()
      dictionary2 = Dictionary.new("Blue", nil)
      dictionary2.save()
      dictionary.delete()
      expect(Dictionary.all).to(eq([dictionary2]))
    end
  end

end
