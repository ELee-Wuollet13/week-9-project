require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  redirect to('/words')
end

get('/words') do
  @words = Word.sort
  erb(:words)
end

get('/words/search') do
  user_search = params[:search]
  @search = Word.search(user_search)
  erb(:search)
end


get ('/words/new') do
  erb(:new_word)
end

post ('/words') do
  text = params[:word_text]
  word = Word.new({:text => text, :id => nil})
  word.save()
  redirect to('/words')
end

get ('/words/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

get ('/words/:id/edit') do
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end

patch ('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.update(params[:text])
  redirect to('/words')
end

get ('/words/:id/buy') do

    @word = Word.find(params[:id].to_i())
    @word.sold
    redirect to('/words')
end
delete ('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  redirect to('/words')
end

get ('/words/:id/definitions/:definition_id') do
  @definition = Definition.find(params[:definition_id].to_i())
  erb(:definition)
end

post ('/words/:id/definitions') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.new({:text => params[:definition], :word_id => @word.id, :id => nil, :poster_text => params[:poster_text]})
  definition.save()
  erb(:word)
end

patch ('/words/:id/definitions/:definition_id') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.find(params[:definition_id].to_i())
  definition.update(params[:text], @word.id)
  erb(:word)
end

delete ('/words/:id/definitions/:definition_id') do
  definition = Definition.find(params[:definition_id].to_i())
  definition.delete
  @word = Word.find(params[:id].to_i())
  erb(:word)
end
