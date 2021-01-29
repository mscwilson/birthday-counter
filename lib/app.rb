require "sinatra/base"
require_relative "birthday_counter"
# require "date"

class Birthday < Sinatra::Base
  enable :sessions

  get "/" do
    erb :index
  end

  post "/personal_info" do
    p params
    session[:name] = params["name"]
    session[:day] = params["day"]
    session[:month] = params["month"]
    redirect "/results"
  end

  get "/results" do
    p session[:day]
    p session[:month]
    @birthday_greeter = BirthdayCounter.new(session[:day], session[:month])
    erb :results
  end


end
