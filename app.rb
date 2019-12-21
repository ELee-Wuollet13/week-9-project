require('sinatra')
require('sinatra/reloader')
require('./lib/dictionary')
require('pry')
require('./lib/word')
also_reload('lib/**/*.rb')

# Get the detail for a specific word such as lyrics and wordwriters.
get('/dictionarys/:id/words/:word_id') do
  @word = Word.find(params[:word_id].to_i())
  erb(:word)
end

# Post a new word. After the word is added, Sinatra will route to the view for the dictionary the word belongs to.
post('/dictionarys/:id/words') do
  @dictionary = Dictionary.find(params[:id].to_i())
  word = Word.new(params[:word_name], @dictionary.id, nil)
  word.save()
  erb(:dictionary)
end

# Edit a word and then route back to the dictionary view.
patch('/dictionarys/:id/words/:word_id') do
  @dictionary = Dictionary.find(params[:id].to_i())
  word = Word.find(params[:word_id].to_i())
  word.update(params[:name], @dictionary.id)
  erb(:dictionary)
end

# Delete a word and then route back to the dictionary view.
delete('/dictionarys/:id/words/:word_id') do
  word = Word.find(params[:word_id].to_i())
  word.delete
  @dictionary = Dictionary.find(params[:id].to_i())
  erb(:dictionary)
end

get('/test') do
  @something = "this is a variable"
redirect to('/dictionarys')
end

get('/') do
  @dictionarys = Dictionary.all
redirect to('/dictionarys')
end

get('/dictionarys') do
  @dictionarys = Dictionary.all
  erb(:dictionarys)
  # binding.pry
end

get('/dictionarys/new') do
  erb(:new_dictionary)
end

get('/dictionarys/:id') do
  @dictionary = Dictionary.find(params[:id].to_i())
  erb(:dictionary)
end

post('/dictionarys') do
  name = params[:dictionary_name]
  dictionary = Dictionary.new(name, nil)
  dictionary.save()
  redirect to('/dictionarys')
end

get('/dictionarys/:id/edit') do
  @dictionary = Dictionary.find(params[:id].to_i())
  erb(:edit_dictionary)
end

patch('/dictionarys/:id') do
  @dictionary = Dictionary.find(params[:id].to_i())
  @dictionary.update(params[:name])
redirect to('/dictionarys')
end

delete('/dictionarys/:id') do
  @dictionary = Dictionary.find(params[:id].to_i())
  @dictionary.delete()
  redirect to('/dictionarys')
end

get('/custom_route') do
  "We can even create custom routes, but we should only do this when needed."
end
