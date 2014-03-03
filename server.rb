require 'sinatra'
require 'pry'

set :views, File.dirname(__FILE__) + '/views'
set :public_folder, File.dirname(__FILE__) + '/public'

#<a href='#{link.downcase.gsub}'> link 

get '/blog/:article' do
  @path=params[:path]
  @date="On Jan 1, 2014"
  def format_text_html (text)
    text.gsub(/\'/, '&#39;').insert(0,"<p>").gsub("\n",'<p></p>')
  end
  content=File.read(File.join('public', 'pre-work.html'))
  #class BlogPost def initialize (title,page_title,header,date,image_path)
  #CSV.foreach('lackp_starting_rosters.csv', headers: true) do |row|
  #  member = Members_struct.new(index_value,row[0],row[1],row[2],row[3])
  #Blog_data=Struct.new(:title, :page_title, :header, :date, :image_path)  
  @blog_data = []
  @blog_data << ["pre-work", "Blog / Life, the Universe and Everything", "Launch Academy: Reflection on Pre-Work", "On Jan 1, 2014", "images/comic.gif"]

  #pre_work=Blog_data.new("pre-work", "Blog / Life, the Universe and Everything", "Launch Academy: Reflection on Pre-Work", "On Jan 1, 2014")
    
  @text = format_text_html (content.to_s)

  erb :blog_post, :layout => :layout
end

get '/:path' do
  @path=params[:path]
  @title=@path.gsub(/'-'/,' ').split.map(&:capitalize).join(' ')
  begin
    erb params[:path].to_sym, :layout => :layout
  rescue Errno::ENOENT
    erb :index
  end 
end
