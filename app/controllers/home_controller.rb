class HomeController < ApplicationController
	skip_before_action :verify_authenticity_token

  def index
  	filename = File.dirname(__FILE__) + '/../../txt/videos.txt'
  	
  	@movies = []
  	File.readlines(filename).each do |line|
  		@movies << line
		end
  end

  def video_info
    url = params[:url]
    if url.include?("youtube") || url.include?("vimeo")
      video = VideoInfo.new(params[:url])
      render json: { video: video, status: 'ok' }
    else
  	  render json: { status: 'error' }
    end
  end

  def upload
  	filename = File.dirname(__FILE__) + '/../../txt/videos.txt'
  	client = Giphy.new
    response = client.import(params[:url], { start: params[:start].to_i, end: params[:end].to_i })
    
  	open(filename, 'a') { |f| f << "\n " + response }
  	render json: { status: 'ok' }
  end
end
