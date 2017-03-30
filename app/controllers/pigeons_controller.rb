class PigeonsController < ApplicationController

  get '/pigeons' do
    erb :'pigeons/index'
  end

  post '/pigeons' do
    new_pigeon = Pigeon.create(params)
    new_pigeon.save
    redirect '/pigeons'
  end

  get '/pigeons/new' do
    erb :"pigeons/new"
  end

  post '/pigeons/new' do
    new_pigeon = Pigeon.create(params[:pigeon])
    new_pigeon.save
  end

  delete '/pigeons/:id' do
    @pigeon = Pigeon.find(params[:id])
    @pigeon.destroy
    redirect '/pigeons'
  end

  patch '/pigeons/:id' do
    @pigeon = Pigeon.find(params[:id])
    @pigeon.name = params[:name]
    @pigeon.gender = params[:gender]
    @pigeon.color = params[:color]
    @pigeon.lives = params[:lives]
    @pigeon.save
    redirect "/pigeons/#{params[:id]}"
  end


  get '/pigeons/:id' do
    @pigeon = Pigeon.find(params[:id])
    erb :'pigeons/show'
  end

  get '/pigeons/:id/edit' do
    @pigeon = Pigeon.find(params[:id])
    erb :'pigeons/edit'
  end

  post '/pigeons/:id' do
    @pigeon = Pigeon.find(params[:id])
    @pigeon.update(params[:pigeon])
    @pigeon.save
  end



end
