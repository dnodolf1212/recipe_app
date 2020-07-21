class UsersController < ApplicationController
  
  get '/signup' do 
   erb :'users/signup'
  end

  post '/signup' do 
    user = User.create(params)
    session[:user_id] = user.id
    redirect '/recipes'
  end

  get '/login' do 
    erb :'users/login'
  end

  post '/login' do 
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id 
      redirect '/recipes'
    else
      @error = 'invalid info, try again'
      erb :'users/login'
    end 
  end

  delete '/logout' do 
    session.destroy 
    redirect '/recipes'
  end

end 