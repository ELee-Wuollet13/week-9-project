require 'rspec'
require 'word'
require 'dictionary'

describe '#Word' do

describe('#words') do
    it("returns an word's words") do
      word = Word.new("first listed", nil)
      word.save()
      word = Word.new("Bell", word.id, nil)
      word.save()
      word2 = Word.new("Things", word.id, nil)
      word2.save()
      expect(word.words).to(eq([word, word2]))
    end
  end
  before(:each) do
    Word.clear()
  end

  describe('#==') do
    it("is the same word if it has the same attributes as another word") do
      word = Word.new("Blue", nil)
      word2 = Word.new("Blue", nil)
      expect(word).to(eq(word2))
    end
  end

  describe(".all") do
    it("returns an empty array when there are no words") do
      expect(Word.all()).to(eq([]))
    end
  end
  describe('#save') do
    it("saves an word") do
      word = Word.new("All that you are", nil) # nil added as second argument
      word.save()
      word2 = Word.new("Golden", nil) # nil added as second argument
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe('.clear') do
    it("clears all words") do
      word = Word.new("Reaching", nil)
      word.save()
      word2 = Word.new("Stuff", nil)
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds an word by id") do
      word = Word.new("Grass overflow", nil)
      word.save()
      word2 = Word.new("Blue", nil)
      word2.save()
      expect(Word.find(word.id)).to(eq(word))
    end
  end

  describe('#update') do
    it("updates an word by id") do
      word = Word.new("Grass overflow", nil)
      word.save()
      word.update("A holiday suprise")
      expect(word.name).to(eq("A holiday suprise"))
    end
  end

  describe('#delete') do
    it("deletes an word by id") do
      word = Word.new("Grass overflow", nil)
      word.save()
      word2 = Word.new("Blue", nil)
      word2.save()
      word.delete()
      expect(Word.all).to(eq([word2]))
    end
  end

end
