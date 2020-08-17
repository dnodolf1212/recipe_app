class UsersController < ApplicationController
  
  get '/signup' do 
   erb :'users/signup'
  end

  post '/signup' do 
    @user = User.new(params)
    if @user.user_name.empty? || @user.password.empty?
      @error = "Username and password cannot be blank"
      erb :'users/signup'
    elsif
      User.find_by(user_name: @user.user_name, email: @user.email)
      @error = "This account is taken."
      erb :'users/signup'
    else
      @user.save
      session[:user_id] = @user.id
      redirect '/recipes'
    end
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
      @error = 'Invalid info, try again'
      erb :'users/login'
    end 
  end

  delete '/logout' do 
    session.destroy 
    redirect '/recipes'
  end

end 