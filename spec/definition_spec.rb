require 'rspec'
require 'definition'
require 'definition'
require 'pry'

describe '#Definition' do

  before(:each) do
    Definition.clear()
    Definition.clear()
    @definition = Definition.new("Grass overflow", nil)
    @definition.save()
  end

  describe('#==') do
    it("is the same definition if it has the same attributes as another definition") do
      definition = Definition.new({:name => "Solid", :definition_id => @definition.id, :id => nil})
      definition2 = Definition.new({:name => "Solid", :definition_id => @definition.id, :id => nil})
      expect(definition).to(eq(definition2))
    end
  end

  describe('.all') do
    it("returns a list of all definitions") do
      definition = Definition.new("Grass overflow", @definition.id, nil)
      definition.save()
      definition2 = Definition.new("Solid", @definition.id, nil)
      definition2.save()
      expect(Definition.all).to(eq([definition, definition2]))
    end
  end

  describe('.clear') do
    it("clears all definitions") do
      definition = Definition.new("Grass overflow", @definition.id, nil)
      definition.save()
      definition2 = Definition.new("Solid", @definition.id, nil)
      definition2.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a definition") do
      definition = Definition.new("Solid", @definition.id, nil)
      definition.save()
      expect(Definition.all).to(eq([definition]))
    end
  end

  describe('.find') do
    it("finds a definition by id") do
      definition = Definition.new("Grass overflow", @definition.id, nil)
      definition.save()
      definition2 = Definition.new("Solid", @definition.id, nil)
      definition2.save()
      expect(Definition.find(definition.id)).to(eq(definition))
    end
  end

  describe('#update') do
    it("updates an definition by id") do
      definition = Definition.new("Solid", @definition.id, nil)
      definition.save()
      definition.update("Newly Solid", @definition.id)
      expect(definition.name).to(eq("Newly Solid"))
    end
  end

  describe('#delete') do
    it("deletes an definition by id") do
      definition = Definition.new("Grass overflow", @definition.id, nil)
      definition.save()
      definition2 = Definition.new("Solid", @definition.id, nil)
      definition2.save()
      definition.delete()
      expect(Definition.all).to(eq([definition2]))
    end
  end
end