configure :development do
  # db = URI.parse(ENV['DATABASE_URL'] || 'postgres:///localhost/mydb')
  # ActiveRecord::Base.establish_connection(
  #   :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
  #   :host     => ec2-54-225-124-205.compute-1.amazonaws.com,
  #   :username => gsanrtstljeamo,
  #   :password => 2b18NNhwIi0i4Srj7Ux-AI9nH0,
  #   :database => db.path[1..-1],
  #   :encoding => 'utf8'
  # )
  set :database, 'sqlite:///dev.db'
 set :show_exceptions, true
end

configure :production do
 db = URI.parse(ENV['DATABASE_URL'] || 'postgres:///localhost/mydb')

 ActiveRecord::Base.establish_connection(
   :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
   :host     => db.host,
   :username => db.user,
   :password => db.password,
   :database => db.path[1..-1],
   :encoding => 'utf8'
 )
end