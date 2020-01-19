require 'rspec'
require 'word'
require 'definition'

describe '#Word' do


# describe('#definitions') do
#     it("returns an word's definitions") do
#       word = Word.new("Giant Steps", nil)
#       word.save()
#       definition = Definition.new("Naima", word.id, nil)
#       definition.save()
#       definition2 = Definition.new("Cousin Mary", word.id, nil)
#       definition2.save()
#       expect(word.definitions).to(eq([definition, definition2]))
#     end
#   end
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
      word = Word.new("Giant Steps", nil)
      word.save()
      word2 = Word.new("Blue", nil)
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe('.clear') do
    it("clears all words") do
      word = Word.new("Giant Steps", nil)
      word.save()
      word2 = Word.new("Blue", nil)
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds an word by id") do
      word = Word.new("Giant Steps", nil)
      word.save()
      word2 = Word.new("Blue", nil)
      word2.save()
      expect(Word.find(word.id)).to(eq(word))
    end
  end

  describe('#update') do
    it("updates an word by id") do
      word = Word.new("Giant Steps", nil)
      word.save()
      word.update("A Love Supreme")
      expect(word.name).to(eq("A Love Supreme"))
    end
  end

  describe('#delete') do
    it("deletes an word by id") do
      word = Word.new("Giant Steps", nil)
      word.save()
      word2 = Word.new("Blue", nil)
      word2.save()
      word.delete()
      expect(Word.all).to(eq([word2]))
    end
  end
end
