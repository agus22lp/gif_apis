class HomeController < ApplicationController
  def index
  end

  def youtube
  	video = Youtube.new(params[:url]).info

  	render json: { id: video.id, title: video.title, duration: video.duration }
  end
end
