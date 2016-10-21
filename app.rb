require 'sinatra/base'
ENV['RACK_ENV'] ||= "development"
require_relative 'models/link'
require_relative 'models/tag'
require_relative 'models/data_mapper_setup'

configure

class BookmarkManager < Sinatra::Base

  get '/' do
    @links = Link.all
    erb :links
  end

  get '/new' do
    erb :new_links
  end

  post '/' do
    link = Link.new(url: params[:url], title: params[:title])
    tags = params[:tag].split
    tags.each{|tag| link.tags << Tag.first_or_create(tag_name: tag)}
    # tag = Tag.first_or_create(tag_name: params[:tag])
    # link.tags << tag
    link.save
    redirect to('/')
  end

  get '/tag' do
  tag = Tag.first(tag_name: params[:filter])
  @links = tag ? tag.links : []
    erb :links
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
