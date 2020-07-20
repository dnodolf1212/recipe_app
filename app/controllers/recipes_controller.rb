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
    @recipe = current_user.recipes.build(params)
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end

  #show
  get '/recipes/:id' do 
    set_recipe
    erb :'recipes/show'
  end 

  #edit
  get '/recipes/:id/edit' do 
    set_recipe
    erb :'recipes/edit'
  end
  
  #update
  patch '/recipes/:id' do
    #binding.pry
    params.delete(:_method)
    set_recipe
    @recipe.update(params)
    redirect "/recipes/#{@recipe.id}"
  end
  
  #delete
  delete '/recipes/:id' do 
    set_recipe
    @recipe.destroy
    redirect '/recipes'
  end

  private
  def set_recipe
    @recipe = current_user.recipes.find(params[:id])
  end

end