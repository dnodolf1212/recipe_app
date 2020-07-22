class RecipesController < ApplicationController
  #index
  get '/recipes' do 
    redirect_if_not_logged_in
    @recipes = current_user.recipes.all
    erb :'recipes/index'
  end

  #new
  get '/recipes/new' do 
    redirect_if_not_logged_in
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
    redirect_if_not_logged_in
      if set_recipe
        erb :'recipes/show'
      else
       redirect '/recipes'
      end
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