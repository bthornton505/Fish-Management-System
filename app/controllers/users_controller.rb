class UsersController < ApplicationController 
  
  get '/profile' do 
    @user = User.find_by(params[:username])
    erb :'users/profile'
  end 
  
  get '/signup' do 
    erb :'users/signup'
  end 
  
  post '/signup' do 
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    else 
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @user.save 
      session[:user_id] = @user.id 
      redirect to '/profile'
    end 
  end 
  
  get '/logout' do 
    logout!
    redirect to '/login'
  end 
  
end 