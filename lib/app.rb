require "sinatra/base"

class Birthday < Sinatra::Base

  get "/" do
    erb :index
  end

  post "/personal_info" do
    redirect "/results"
  end

  get "/results" do
    "Ace"
  end


end
