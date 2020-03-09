require 'sinatra'
enable :sessions
get "/set" do
    session[:message] = params[:message]
    "session saved"
  end 
  get "/get" do
    session[:message]
  end

# get '/getdoc' do
#   "<!DOCTYPE html>
#   <html>
#   <head>
#   <style>
#   li { 
#       color: red; 
#   }
#   </style>
#   </head>
#  <body>
#  <h1>How to be a Supportive Friend</h1>
#   <ul>
#   <li>Check in consistantly</li>
#   <li>Avoid leading questions</li>
#   <li>Use reflective listening</li>
#   </ul>
#   <h4>Let us know if you need some extra coaching on that</h4>
#   </body>
#   </html>"

# end


# get '/post_it' do
#   "<html><head></head><body>
# <form action='/submitted' method='POST'>
#     Message:
#     <input type='text' name='message'>
#     <input type='submit' value='Send'>
#   </form>
# </body>
# </html>"
# end
post "/submitted" do
    "<h1>Form Submitted</h1>"
  end
  
  get "/logon" do
      '<html><head></head><body>
<form action="/logon" method="POST">
    <input type="username" name="username">
    <input type="password" name="password">
    <input type="submit" value="Logon">
  </form>
</body></html>'
      
  end
  
  
  post "/logon" do
      if params[:username] == "bob" and params[:password] == "pass"
      "SUCCESS"
      else
      "FAILURE"
      end
  end
  
get "/name" do
    '<html>
    <head></head>
    <body>
        <form action="/hello" method="POST">
            Name: <input type="text" name="name">
            <input type="submit" value="submit">
        </form>
    </body>
</html>'
end

post "/hello" do
    session[:name]=params[:name]
    "Saved the name"
end

get "/greet" do
    "Hello #{session[:name]}"
end

get "/howmany" do
    erb :howmany
end

post "/candles" do
    @candles = params[:candles]
    erb :candles
end