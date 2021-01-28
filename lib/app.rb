require "sinatra/base"

class Birthday < Sinatra::Base
  enable :sessions

  get "/" do
    erb :index
  end

  post "/personal_info" do
    session[:name] = params["name"]
    session[:day] = params["day"]
    session[:month] = params["month"]
    redirect "/results"
  end

  get "/results" do
    erb :results
  end


end
