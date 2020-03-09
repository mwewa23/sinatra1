require 'sqlite3'
if File.exists?("maindata.db")
  File.delete("maindata.db")
end

db = SQLite3::Database.new("maindata.db")
db.execute <<-SQL
    create table results(
      id integer primary key,
      email varchar,
      grade varchar);
  SQL
  
db.execute("insert into results(email,id,grade) values(?,?,?);",["sam@example.com",11,"B"]);
db.execute("insert into results(email,id,grade) values(?,?,?);",["mary@life.co",19,"A"]);
db.execute("insert into results(email,id,grade) values(?,?,?);",["tim@me.com",28,"C"]);


require 'sinatra'
get "/results" do
    @results = db.execute("SELECT * FROM results;")
    erb :results
end
  