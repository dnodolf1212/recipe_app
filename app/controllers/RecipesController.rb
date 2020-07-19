class RecipesController < ApplicationController
  #index
  get '/recipes' do 
    @recipes = current_user.recipes 
    erb :'recipes/index'  
  end 
  #new
  get '/recipes/new' do 
    erb :'recipes/new'
  end
  #create
  post '/recipes' do
    "Hey Booby" 
    #binding.pry
    #@recipe = current_user.recipes.build(params)
    #@recipe.save
    redirect "/recipes/#{recipe.id}"
  end
  #show
  get '/recipes/:id' do 
   # @recipe = Recipe.find(params[:id])
    erb :'recipes/show'
  end 

  #update

  #edit

  #delete

end