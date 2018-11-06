class FishController < ApplicationController
  
  get '/new_fish' do 
    redirect_if_not_logged_in
    erb :'fish/new_fish'
  end 
  
  post '/new_fish' do 
    redirect_if_not_logged_in
    if params[:species] == "" || params[:fishtank_id] == ""
      redirect to '/fish/new_fish'
    else 
      @fish = Fish.new(:species => params[:species], :fishtank_id => params[:fishtank_id])
      @fish.save 
      redirect to "/fish/#{@fish.id}"
    end 
  end 
  
  get '/fish/:id' do 
    redirect_if_not_logged_in
    @fish = Fish.find_by_id(params[:id])
    erb :'fish/show_fish'
  end 
  
end 