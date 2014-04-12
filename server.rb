require 'sinatra'
require_relative 'treasure-hunter'
require 'sinatra/activerecord'
require_relative 'environments'
require_relative 'blog'
require_relative 'models/comment'
require_relative 'models/post'
require 'pry'

set :views, File.dirname(__FILE__) + '/views'
set :models, File.dirname(__FILE__) + '/models'
set :public_folder, File.dirname(__FILE__) + '/public'


get '/:treasure-hunter' do
	@game = Game.new
  @treasure = []
  erb "treasure-hunter".to_sym, layout: :layout
end

get '/dig' do  
  treasure = Game.treasure(params['d'].to_i)  
  return treasure
end

get '/blog/:article' do
  @path = params[:article]
  
  def format_text_html (text)
    text.gsub(/\'/, '&#39;').insert(0,"<p>").gsub("\n\n",'</p><p>')
  end
  
	begin 
		@post = Post.find_by(path: @path)
	  content = File.read(File.join('public', @path.to_s))
	  @text = format_text_html (content.to_s)
		@post_comments = Comment.where(post_id: @post.id).all
	rescue ActiveRecord::RecordNotFound => b
	rescue Errno::ENOENT => c
		redirect '/blog'
	end
  
  erb :blog_post, :layout => :layout
end

get '/:path' do
  @path=params[:path].chomp('.html')
  @title=@path.gsub(/'-'/,' ').split.map(&:capitalize).join(' ')
  begin
    erb @path.to_sym, :layout => :layout
  rescue Errno::ENOENT
    erb :index
  end 
end

get '/' do
  erb :index
end

post '/blog/:post_id/comments' do
	def sanitized_data (params)
		sanitized_params = params.select{|key,value| [:name,:body,:message,:post_id].include?(key)}
		sanitized_params.each do |k,v| 
			if v.is_a?(String) 
				v.gsub!(/[;\*]/,'')
			end
		end
	end

	@post = Post.find(params[:post_id])
	newComment = Comment.new(sanitized_data({:name => params["name"],:body => params["comment"],:message => params["message"],:post_id  => @post.id}))
	  newComment.save
  redirect back
end

