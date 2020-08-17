class RecipesController < ApplicationController
  
  get "/" do
    erb :'users/welcome'
  end
  
  #index
  get '/recipes' do 
    redirect_if_not_logged_in
    @recipes = current_user.recipes
    erb :'recipes/index'
  end

  #new
  get '/recipes/new' do 
    redirect_if_not_logged_in
    erb :'recipes/new'
  end

  #create
  post '/recipes' do
    redirect_if_not_logged_in
    @recipe = current_user.recipes.build(params)
    if !@recipe.title.empty? && !@recipe.description.empty? && !@recipe.ingredients.empty?&& !@recipe.instructions.empty?
      @recipe.save
      redirect "/recipes/#{@recipe.id}"
    else
      @error = "Please fill out all available fields"
      erb :'recipes/new'
    end
  end

  #show
  get '/recipes/:id' do 
    redirect_if_not_logged_in
    set_recipe
    if @recipe 
      erb :'recipes/show'
    else
      redirect '/recipes'
    end
  end 

  #edit
  get '/recipes/:id/edit' do 
    redirect_if_not_logged_in 
    set_recipe
    erb :'recipes/edit'
  end
  
  #update
  patch '/recipes/:id' do
    redirect_if_not_logged_in
    params.delete(:_method)
    set_recipe
    @recipe.update(params)
    redirect "/recipes/#{@recipe.id}"
  end
  
  #delete
  delete '/recipes/:id' do 
    redirect_if_not_logged_in
    set_recipe
    @recipe.destroy
    redirect '/recipes'
  end

  private

  def set_recipe
    @recipe = current_user.recipes.find_by(id: params[:id])
  end

end