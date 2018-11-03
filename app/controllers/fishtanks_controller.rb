class FishtanksController < ApplicationController 
  
  get '/new_fishtank' do 
    erb :'fishtanks/new_fishtank'
  end 
  
  post '/new_fishtank' do 
    if logged_in?
      if params[:name] == "" || params[:fish_capacity] == ""
        redirect to '/fishtanks/new_fishtank'
      else 
        @fishtank = Fishtank.new(:name => params[:name], :fish_capacity => params[:fish_capacity])
        @fishtank.save 
        redirect to "/fishtanks/#{@fishtank.id}"
      end 
    else 
      redirect to '/login'
    end 
  end 
  
  get '/fishtanks/:id' do 
    if logged_in?
      @fishtank = Fishtank.find_by_id(params[:id])
      erb :'/fishtanks/show_fishtank'
    else 
      redirect to '/login'
    end 
  end 
  
end 