class HomeController < ApplicationController
	skip_before_action :verify_authenticity_token

  def index
  	filename = File.dirname(__FILE__) + '/../../txt/videos.txt'
  	
  	@movies = []
  	File.readlines(filename).each do |line|
  		@movies << line
		end
  end

  def youtube
  	video = Youtube.new(params[:url]).info

  	render json: { id: video.id, title: video.title, duration: video.duration }
  end

  def upload
  	filename = File.dirname(__FILE__) + '/../../txt/videos.txt'
  	client = GifsDotCom.new('')

  	response = client.import(params[:url], { start: params[:start].to_i, end: params[:end].to_i })
  	open(filename, 'a') { |f| f << "\n " + response.parsed_response["success"]["files"]["gif"] }
  	render json: { status: 'ok' }
  end
end
