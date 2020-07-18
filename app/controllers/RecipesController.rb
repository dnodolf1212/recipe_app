class RecipesController < ApplicationController
  #index
  get '/recipes' do 
    @recipes = Recipe.all 
    erb :'recipes/index'  
  end 
  #new
  get '/recipes/new' do 
    erb :'recipes/index'
  end
  #create

  #show

  #update

  #edit

  #delete

end