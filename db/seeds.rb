require 'csv'

file = File.join(File.dirname(__FILE__), 'data/posts.csv')
puts "Reading from file #{file}"

CSV.foreach(file, headers: true) do |row|
  post_attr = {
    title: row['title'],
    path: row['path'],
    date_created: Date.parse(row['date_created']),
    media: row['media'],
    preview_media: row['preview_media']
  }

  Post.create!(post_attr) if Post.where(post_attr).count == 0
end
