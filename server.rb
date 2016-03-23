require 'sinatra'
require_relative 'treasure-hunter'
require 'sinatra/activerecord'
require_relative 'environments'
require_relative 'models/post'
require 'rest-client'

set :views, File.dirname(__FILE__) + '/views'
set :models, File.dirname(__FILE__) + '/models'
set :public_folder, File.dirname(__FILE__) + '/public'

get '/:treasure-hunter' do
  @game = Game.new
  @treasure = []
  erb 'treasure-hunter'.to_sym, layout: :layout
end

get '/dig/:d' do
  treasure = Game.treasure(params['d'].to_i)
  return treasure
end

get '/fruit-wars' do
  erb :fruit_wars, layout: :layout
end

get '/eventmy-api-demo' do
  content_type :json

  @events = RestClient.get 'http://www.eventmy.com/api/v1/events/search', {
    params: {
      token: ENV['EVENTMY_API_TOKEN'],
      start_date: params[:start_date],
      end_date: params[:end_date],
      city: params[:city],
      state: params[:state],
      limit: 11
    }
  }
  puts 'events found:'
  puts @events

  return @events
end

get '/blog/:article' do
  @path = params[:article]

  def format_text_html(text)
    text.gsub(/\'/, '&#39;').insert(0, '<p>').gsub("\n\n", '</p><p>')
  end

  begin
    @post = Post.find_by(path: @path)
    content = File.read(File.join('public', @path.to_s))
    @text = format_text_html (content.to_s)
  rescue ActiveRecord::RecordNotFound => b
  rescue Errno::ENOENT => c
    redirect '/blog'
  end

  erb :blog_post, layout: :layout
end

get '/' do
  erb :blog
end

get '/:path' do
  @path = params[:path].chomp('.html')
  @title = @path.gsub(/'-'/, ' ').split.map(&:capitalize).join(' ')
  begin
    erb @path.to_sym, layout: :layout
  rescue Errno::ENOENT
    erb :blog
  end
end
