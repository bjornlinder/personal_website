require 'sinatra'

set :views, File.dirname(__FILE__) + '/views'
set :public_folder, File.dirname(__FILE__) + '/public'

get '/' do
  @main_nav=[]
  [children: [title, title, title]]
  erb :index
end

[index,title,link,parent,icon=nil]

def find_lost_children (title)
  @main_nav.sort_by!{|link| link[0]}.each do |link|
    children=[]
    children << link[1] if link[3]==title
    return children
  end
end

def we_must_go_deeper (title)
  menu_html=""
  we_must_go_deeper(parent=main)
  @main_nav.each do |link|
    if link[3]==parent
      menu_html << "<a href='#{title[0].downcase.gsub}'> #{title[1]} %>"
      children=find_lost_children(title) #sends children to method 
      children.each {|child| we_must_go_deeper(child)}
    end
  end
end

we_must_go_deeper(main)

  @main_nav[]
  
  we_must_go_deeper if menu_array[0] == menu_array[2]
    we_must_go_deeper(menu_array)
  end
  
  @main_nav.each {|link| menu_html << "<a href='#{link[0].downcase.gsub}'> #{link[1]} %>" }
  #menu_html << we_must_go_deeper (menu_array[2])
  return menu_html
end

def children (link)
  menu_html=[]
  @menu
<a href='#{link.downcase.gsub}'> link 


@title=@path.gsub(/'-'/,' ').split.map(&:capitalize).join(' ')

get '/blog/:article' do
  erb :blog
  def format_text_html (text)
    text.gsub(/\'/, '&#39;').insert(0,"<p>").gsub(/\\n/,'<p></p>')
  end

  #generating tags from text
  #searching by tags
end
 #formats text (adding <p> tags)
# "<p>Hello, world! The current time is #{Time.now}.</p>"


#send_file File.expand_path('index.html', settings.public_folder)
 #formats text (adding <p> tags)
# "<p>Hello, world! The current time is #{Time.now}.</p>"



=begin
Inline Templates
Templates may be defined at the end of the source file:

require 'sinatra'

get '/' do
  haml :index
end

__END__

@@ layout
%html
  = yield

@@ index
%div.title Hello world.

#<!--<% @tasks.each do |task| %>
 # <li><%= task %></li>
#<% end %>
#-->








configure do
  mime_type :plain, 'text/plain'
end

before '/plain-text' do
    content_type :plainrequire "menu recursion"
    
end
require "menu recursion"

get '/html' do
  '<h1>You should see HTML rendered.</h1>'
end
require "menu recursion"

get '/plain-text' do
  '<h1>You should see plain text rendered.</h1>'
end

