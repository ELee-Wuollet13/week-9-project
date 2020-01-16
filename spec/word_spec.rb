require 'rspec'
require 'word'
require 'dictionary'
require 'pry'

describe '#Word' do

  before(:each) do
    Dictionary.clear()
    Word.clear()
    # @dictionary = Dictionary.new("Grass overflow", nil)
    # @dictionary.save()
  end

  describe('#==') do
    it("is the same word if it has the same attributes as another word") do
      word = Word.new({:name => "Solid", :dictionary_id => @dictionary.id, :id => nil})
      word2 = Word.new({:name => "Solid", :dictionary_id => @dictionary.id, :id => nil})
      expect(word).to(eq(word2))
    end
  end

  describe('.all') do
    it("returns a list of all words") do
      word = Word.new("Grass overflow", @dictionary.id, nil)
      word.save()
      word2 = Word.new("Solid", @dictionary.id, nil)
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe('.clear') do
    it("clears all words") do
      word = Word.new("Grass overflow", @dictionary.id, nil)
      word.save()
      word2 = Word.new("Solid", @dictionary.id, nil)
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a word") do
      word = Word.new("Solid", @dictionary.id, nil)
      word.save()
      expect(Word.all).to(eq([word]))
    end
  end

  describe('.find') do
    it("finds a word by id") do
      word = Word.new("Grass overflow", @dictionary.id, nil)
      word.save()
      word2 = Word.new("Solid", @dictionary.id, nil)
      word2.save()
      expect(Word.find(word.id)).to(eq(word))
    end
  end

  describe('#update') do
    it("updates an word by id") do
      word = Word.new("Solid", @dictionary.id, nil)
      word.save()
      word.update("Newly Solid", @dictionary.id)
      expect(word.name).to(eq("Newly Solid"))
    end
  end

  describe('#delete') do
    it("deletes an word by id") do
      word = Word.new("Grass overflow", @dictionary.id, nil)
      word.save()
      word2 = Word.new("Solid", @dictionary.id, nil)
      word2.save()
      word.delete()
      expect(Word.all).to(eq([word2]))
    end
  end
end
