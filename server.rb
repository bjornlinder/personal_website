require 'sinatra'
require_relative 'treasure-hunter'

set :views, File.dirname(__FILE__) + '/views'
set :public_folder, File.dirname(__FILE__) + '/public'

get '/blog/:article' do
  @path = params[:article]
  
  def format_text_html (text)
    text.gsub(/\'/, '&#39;').insert(0,"<p>").gsub("\n\n",'</p><p>')
  end
  content = File.read(File.join('public', @path.to_s))
  @text = format_text_html (content.to_s)

  @blog_data = {}
  @blog_data["pre-work.html"] = ["Launch Academy: Reflection on Pre-Work", "On Feb 16, 2014"]
  @blog_data["first-post.html"] = ["First Blog Post", "Jan 1, 2014", "images/comic.gif"]
  @blog_data["launch-academy-week-1.html"] = ["Launch Academy : Week 1", "Feb 22, 2014", "images/sudo-sandwich.png"]
  @blog_data["project-updates.html"] = ["Programming Updates - Sinatra & Other Projects", "Mar 3, 2014"]
  
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
