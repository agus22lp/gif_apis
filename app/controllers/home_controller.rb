class HomeController < ApplicationController
  def index
  end

  def youtube
  	info = Youtube.new(params[:url]).info

  	render json: { title: info.title, duration: info.duration } 
  end
end
