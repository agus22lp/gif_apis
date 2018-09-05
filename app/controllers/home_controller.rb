class HomeController < ApplicationController
	skip_before_action :verify_authenticity_token

  def index
  	@gifs = Giphy.all
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
  	saved = Giphy.import(params[:url], { start: params[:start].to_i, end: params[:end].to_i })
    
  	render json: { status: saved }
  end
end
