class RepositoriesController < ApplicationController
	before_action :authenticate_user
  
  def index
  	response = Faraday.get "https://api.github.com/user/repos", {}, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    @repos = JSON.parse(response.body)
  end

  def create
  	response = Faraday.post "https://api.github.com/user/repos", {name: params[:name]}.to_json, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}  
    redirect_to root_path
  end

end
