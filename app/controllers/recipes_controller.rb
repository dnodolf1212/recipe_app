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
    @recipe = Recipe.find(params[:id])
    erb :'recipes/show'
  end 

  #edit
  get 'recipes/:id/edit' do 
    @recipe = Recipe.find(params[:id])
    erb :edit
  end
  

  #update
  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(title: params[:title], description: params[:description], ingredients: params[:ingredients], instructions: params[:instructions])
    redirect "/recipes/#{recipe.id}"
  end
  #delete
  delete '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect '/recipes'
end

end