require 'sinatra'

set :views, File.dirname(__FILE__) + '/views'
set :public_folder, File.dirname(__FILE__) + '/public'

get '/:path' do
  @title=params[:path]
  erb :index, :layout => :layout
end


#generating tags from text
#searching by tags
'comment = <form action="/comment" method = "post">
  <input type = "text" name = "name"></input>
  <input type = "text" name = "comment"></input>
  <input type = "submit" name = "submit" value = "submit"></input>
</form>'

#class BlogPost def initialize (title,page_title,header,date,image_path)
#CSV.foreach('lackp_starting_rosters.csv', headers: true) do |row|
#  member = Members_struct.new(index_value,row[0],row[1],row[2],row[3])
#Blog_data=Struct.new(:title, :page_title, :header, :date, :image_path)  