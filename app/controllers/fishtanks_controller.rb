class FishtanksController < ApplicationController 
  
  get '/new_fishtank' do 
    redirect_if_not_logged_in
    erb :'fishtanks/new_fishtank'
  end 
  
  post '/new_fishtank' do 
    redirect_if_not_logged_in
    @fishtank = @current_user.fishtanks.create(:name => params[:name], :gallons => params[:gallons])
    
    if !@fishtank.valid?
      flash_error(@user)
      redirect to '/fishtanks/new_fishtank'
    end 
      
    redirect to "/fishtanks/#{@fishtank.id}"
  end 
  
  get '/fishtanks/:id' do 
    redirect_if_not_logged_in
    @fishtank = Fishtank.find_by_id(params[:id])
    erb :'/fishtanks/show_fishtank'
  end 
  
  get '/fishtanks/:id/edit' do 
    redirect_if_not_logged_in
    @fishtank = Fishtank.find_by_id(params[:id])
    if @fishtank && @fishtank.user == @current_user 
      erb :'fishtanks/edit_fishtank'
    else 
      redirect to '/'
    end 
  end 
  
  patch '/fishtanks/:id' do 
    redirect_if_not_logged_in
    if params[:name] == "" || params[:gallons] == ""
      redirect to "/fishtanks/#{params[:id]}/edit"
    else 
      @fishtank = Fishtank.find_by_id(params[:id])
      if @fishtank && @fishtank.user == @current_user 
        @fishtank.update(:name => params[:name], :gallons => params[:gallons])
        redirect to "/fishtanks/#{@fishtank.id}"
      else 
        redirect to "/fishtanks/#{@fishtank.id}/edit"
      end 
    end 
  end 
  
  post '/fishtanks/:id/delete' do 
    redirect_if_not_logged_in
    @fishtank = Fishtank.find_by_id(params[:id])
    if @current_user != @fishtank.user
      @fishtank.delete 
      redirect to "/"
    end 
  end 
  
end 