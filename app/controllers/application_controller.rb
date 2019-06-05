
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @article = Article.create(title: params[:title], content: params[:content])
    
    redirect "/articles/#{@article.id}"
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    #binding.pry
    @article = Article.find_by(id: params[:id])
    #binding.pry
    erb :show
  end

  get '/articles/:id/edit' do
    # byebug
    @article = Article.find_by(id: params[:id])
    
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(title: params[:title], content: params[:content])
    # binding.pry
    redirect "/articles/#{@article.id}"
  end

  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.delete
    
    redirect "/articles"
  end

end
