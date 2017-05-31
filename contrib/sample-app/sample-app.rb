require 'sinatra'
require 'digest'
require 'prime'
require 'json'

set :bind, '0.0.0.0'

def decode(request)
  JSON.parse(request.body.read)
end

get '/' do
  'Welcome to the "Distributed Load Testing Using Kubernetes" sample web app\n'
end

post '/login' do
  "/login - device: #{params['device']}"
end

post '/metrics' do
  "/metrics - device: #{params['device']}, timestamp: {} \n"
end

# Calculate the Nth prime number to use up CPU and time
post '/nth_prime' do
  Prime.first(params['primes'].to_i).last.to_s
end

post '/post_json' do
  data = params['data']
  Digest::MD5.hexdigest data
end
  
