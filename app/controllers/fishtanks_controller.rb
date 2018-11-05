class FishtanksController < ApplicationController 
  
  get '/new_fishtank' do 
    redirect_if_not_logged_in
    erb :'fishtanks/new_fishtank'
  end 
  
  post '/new_fishtank' do 
    redirect_if_not_logged_in
    if params[:name] == "" || params[:fish_capacity] == ""
      redirect to '/fishtanks/new_fishtank'
    else 
      @fishtank = @current_user.fishtanks.build(:name => params[:name], :fish_capacity => params[:fish_capacity])
      @fishtank.save 
      redirect to "/fishtanks/#{@fishtank.id}"
    end 
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
    if params[:name] == "" || params[:fish_capacity] == ""
      redirect to "/fishtanks/#{params[:id]}/edit"
    else 
      @fishtank = Fishtank.find_by_id(params[:id])
      if @fishtank && @fishtank.user == @current_user 
        @fishtank.update(:name => params[:name], :fish_capacity => params[:fish_capacity])
        redirect to "/fishtanks/#{@fishtank.id}"
      else 
        redirect to "/fishtanks/#{@fishtank.id}/edit"
      end 
    end 
  end 
  
  post '/fishtanks/:id/delete' do 
    redirect_if_not_logged_in
    @fishtank = Fishtank.find_by_id(params[:id])
    if @fishtank && @fishtank.user == @current_user 
      @fishtank.delete 
      redirect to "/"
    end 
  end 
  
end 