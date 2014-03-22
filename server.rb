require 'sinatra'
require_relative 'treasure-hunter'
require 'sinatra/activerecord'
require_relative 'environments'
require_relative 'blog'

set :views, File.dirname(__FILE__) + '/views'
set :models, File.dirname(__FILE__) + '/models'
set :public_folder, File.dirname(__FILE__) + '/public'

get '/blog/:article' do
  @path = params[:article]
  
  def format_text_html (text)
    text.gsub(/\'/, '&#39;').insert(0,"<p>").gsub("\n\n",'</p><p>')
  end

  @blog_data = {}
  @blog_data["pre-work.html"] = ["Launch Academy: Reflection on Pre-Work", "On Feb 16, 2014"]
  @blog_data["first-post.html"] = ["First Blog Post", "Jan 1, 2014", "images/comic.gif"]
  @blog_data["launch-academy-week-1.html"] = ["Launch Academy : Week 1", "Feb 22, 2014", "images/sudo-sandwich.png"]
  @blog_data["project-updates.html"] = ["Programming Updates - Sinatra & Other Projects", "Mar 3, 2014"]
  @blog_data["test-driven-development.html"] = ["Test Driven Development", "Mar 9, 2014"]
  
	if @blog_data.has_key?(@path)
	  content = File.read(File.join('public', @path.to_s))
	  @text = format_text_html (content.to_s)
		@comments_enabled = false
	else
		@comments_enabled = true
		post = Post.find_by(path: @path)
		@blog_data[@path] = [post.title, post.created_at]
		@post_comments = Comment.where(post_id = @postid).all
		@postid = post.id
		@text = post.body
	end
  
  erb :blog_post, :layout => :layout
end

class Post < ActiveRecord::Base
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

get '/treasure-hunter' do
	@@games = {}
	#create grid in ruby, save grid in javascript
	#@grid
end

post '/comment' do
	#   comment = 
	#   @who_said_it = 
	# @private_message = 
	# puts @what_was_said
	
	#write to DB here...
	newComment = Comment.new({:name => params["name"],:body => params["comment"],:message => params["message"]})
	  # newComment.name = params["name"]
	  # newComment.comment = params["comment"]
	  # newComment.commenttext = params["message"]
	  newComment.save
  redirect back
end

