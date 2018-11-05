class UsersController < ApplicationController 
  
  get '/users/:slug' do 
    redirect_if_not_logged_in
    @user = User.find_by_slug(params[:slug])
    erb :'/users/profile'
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
      redirect to "/users/#{@user.slug}"
    end 
  end 
  
  get '/login' do 
    erb :'users/login'
  end 
  
  post '/login' do 
    @user = User.find_by(:email => params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id 
      redirect to "/users/#{@user.slug}"
    else 
      redirect to '/login'
    end 
  end 
  
  get '/logout' do 
    logout
    redirect to '/login'
  end 
  
end 