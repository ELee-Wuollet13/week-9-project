require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


before(:each) do
  Word.clear()
end

describe('create an word path', {:type => :feature}) do
  it('creates an word and then goes to the word page1') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word_name', :with => 'Yellow Submarine')
    click_on('Go!')
    expect(page).to have_content('Yellow Submarine')
  end
end

describe('create a word path', {:type => :feature}) do
  it('creates an word and then goes to the word page2') do
    word = Word.new("Yellow Submarine", nil)
    word.save
    visit("/words/#{word.id}")
    fill_in('definition_name', :with => 'All You Need Is Love')
    click_on('Add definition')
    expect(page).to have_content('All You Need Is Love')
  end
end
