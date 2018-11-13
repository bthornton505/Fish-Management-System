class FishController < ApplicationController
  
  get '/new_fish' do 
    redirect_if_not_logged_in
    erb :'fish/new_fish'
  end 
  
  post '/new_fish' do 
    redirect_if_not_logged_in
    @fish = Fish.create(:species => params[:species], :fishtank_id => params[:fishtank_id])
    
    if !@fish.valid?
      flash_error(@user)
      redirect to '/fish/new_fish'
    end  
      
    redirect to "/fish/#{@fish.id}"
  end 
  
  get '/fish/:id' do 
    redirect_if_not_logged_in
    @fish = Fish.find_by_id(params[:id])
    erb :'fish/show_fish'
  end 
  
  get '/fish/:id/edit' do 
    redirect_if_not_logged_in
    @fish = Fish.find_by_id(params[:id])
    if @fish && @fish.fishtank.user == @current_user
      erb :'/fish/edit_fish'
    else 
      redirect to '/'
    end 
  end 
  
  patch '/fish/:id' do 
    redirect_if_not_logged_in
    if params[:species] == "" || params[:fishtank_id] == ""
      redirect to "/fish/#{params[:id]}/edit"
    else 
      @fish = Fish.find_by_id(params[:id])
      if @fish && @fish.fishtank.user == @current_user
        @fish.update(:species => params[:species], :fishtank_id => params[:fishtank_id])
        redirect to "/fish/#{@fish.id}"
      else 
        redirect to "/fish/#{@fish.id}/edit"
      end 
    end 
  end 
  
  delete '/fish/:id/delete' do 
    redirect_if_not_logged_in
    @fish = Fish.find_by_id(params[:id])
    if @fish && @fish.fishtank.user == @current_user
      @fish.delete 
      redirect to "/users/#{@current_user.slug}"
    end 
  end 
  
  
end 