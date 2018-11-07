require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base 
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "fishtanksarelife"
    use Rack::Flash
  end
  
  get '/' do 
    erb :home 
  end 
  
  
  helpers do 
    
    def redirect_if_not_logged_in
      if !logged_in?
        redirect to '/login'
      end 
    end 
    
    def logged_in?
      !!current_user?
    end 
    
    def current_user?
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end 
    
    def logout
      session.clear 
    end 
    
  end 
  
end 