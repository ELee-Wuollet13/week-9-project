require 'rspec'
require 'definition'
require 'word'
require 'pry'

describe '#Definition' do

  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new("The first word", nil)
    @word.save()
  end

  describe('#==') do
    it("is the same definition if it has the same attributes as another definition") do
      definition = Definition.new("C-3P0", @word.id, nil)
      definition2 = Definition.new("C-3P0", @word.id, nil)
      expect(definition).to(eq(definition2))
    end
  end

  describe('.all') do
    it("returns a list of all definitions") do
      definition = Definition.new("The first word", @word.id, nil)
      definition.save()
      definition2 = Definition.new("C-3P0", @word.id, nil)
      definition2.save()
      expect(Definition.all).to(eq([definition, definition2]))
    end
  end

  describe('.clear') do
    it("clears all definitions") do
      definition = Definition.new("The first word", @word.id, nil)
      definition.save()
      definition2 = Definition.new("C-3P0", @word.id, nil)
      definition2.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a definition") do
      definition = Definition.new("C-3P0", @word.id, nil)
      definition.save()
      expect(Definition.all).to(eq([definition]))
    end
  end

  describe('.find') do
    it("finds a definition by id") do
      definition = Definition.new("The first word", @word.id, nil)
      definition.save()
      definition2 = Definition.new("C-3P0", @word.id, nil)
      definition2.save()
      expect(Definition.find(definition.id)).to(eq(definition))
    end
  end

  describe('#update') do
    it("updates an definition by id") do
      definition = Definition.new("C-3P0", @word.id, nil)
      definition.save()
      definition.update("R2-D2", @word.id)
      expect(definition.name).to(eq("R2-D2"))
    end
  end

  describe('#delete') do
    it("deletes an definition by id") do
      definition = Definition.new("The first word", @word.id, nil)
      definition.save()
      definition2 = Definition.new("C-3P0", @word.id, nil)
      definition2.save()
      definition.delete()
      expect(Definition.all).to(eq([definition2]))
    end
  end
end
