require 'sinatra'
require_relative 'treasure-hunter'
require 'sinatra/activerecord'
require_relative 'environments'
require_relative 'models/post'

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

get '/:path' do
  @path = params[:path].chomp('.html')
  @title = @path.gsub(/'-'/, ' ').split.map(&:capitalize).join(' ')
  begin
    erb @path.to_sym, layout: :layout
  rescue Errno::ENOENT
    erb :fruit_wars
  end
end

get '/' do
  erb :fruit_wars
end
