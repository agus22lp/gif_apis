class VideoInfo
	attr_accessor :duration, :id, :image_url, :title, :provider

  def initialize(link)
  	if link.include?('youtube')
    	video = Yt::Video.new(url: link)
    	@id = video.id
  		@duration = video.duration
  		@image_url = 'https://img.youtube.com/vi/' + @id + '/0.jpg'
  		@title = video.title
  		@provider = 'youtube'
  	else
  		video = Vimeo::Simple::Video.info(vimeo_id(link)).parsed_response[0]
  		@image_url = video['id']
  		@id = video['id']
  		@duration = video['duration']
  		@image_url = video['thumbnail_large']
  		@title = video['title']
  		@provider = 'vimeo'
  	end
  end

  private

  def vimeo_id(url)
    match = url.match(/https?:\/\/(?:[\w]+\.)*vimeo\.com(?:[\/\w]*\/?)?\/(?<id>[0-9]+)[^\s]*/)
  	match[:id] if match.present?
  end
end