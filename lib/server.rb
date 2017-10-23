require "sinatra"

get "/" do
  status 200
  puts "Simple GET, with body ", request.body.inspect
end

get "/foobar" do
  puts "Asked for non-existent resource"
  status 404
end

post "/form" do
  puts "Simple POST, with body", request.body.inspect
  puts "and query string ", request.query_string
  puts "and parameters"
  params.keys do |key|
    puts key.inspect, ": ", params[key] # I expected this to create output...
  end
  puts "including parameter 'My': ", params['My'] # i.e., this output
end

get "/tea" do
  status 200
  puts "Pouring tea for two"
end

get "/coffee" do
  status 418
  puts "This guy thinks I'm a coffeepot, I'll tell him---"
  body "I'm a teapot"
end
