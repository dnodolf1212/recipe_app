class RecipesController < ApplicationController
  #index
  get '/recipes' do 
    if loggen_in?
      @recipes = current_user.recipes.all
      erb :'recipes/index'
    else 
      redirect '/login'
    end 
  end

  #new
  get '/recipes/new' do 
    if logged_in?
    erb :'recipes/new'
    else
      redirect '/login'
    end 
  end

  #create
  post '/recipes' do
    @recipe = current_user.recipes.build(params)
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end

  #show
  get '/recipes/:id' do 
    if logged_in?
    set_recipe
    erb :'recipes/show'
    else
      redirect '/login'
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