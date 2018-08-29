
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do #loads new form
    erb :new
  end

  post '/posts' do  #creates a post
    @post = Post.create(params)
    redirect to '/posts'
  end

  get '/posts' do #loads index page
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do  #loads show page
    @post = Post.find_by_id(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do #loads edit form
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  patch '/posts/:id' do  #updates a post
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end


  delete '/posts/:id/delete' do #delete action
    @post = Post.find_by_id(params[:id])
    @post.destroy
    erb :deleted
  end


end
