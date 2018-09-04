class VideoInfo
  include UrlVideoParser
	attr_accessor :duration, :id, :image_url, :title, :provider

  def initialize(link)
  	if link.include?('youtube')
    	video = Youtube.new(1).get_info(link).parsed_response["items"][0]
    	@id = video["id"]
  		@duration = duration(video["contentDetails"]["duration"])
  		@image_url = 'https://img.youtube.com/vi/' + @id + '/0.jpg'
  		@title = video["snippet"]["title"]
  		@provider = 'youtube'
  	else
  		video = Vimeo::Simple::Video.info(get_id(link)).parsed_response[0]
  		@image_url = video['id']
  		@id = video['id']
  		@duration = video['duration']
  		@image_url = video['thumbnail_large']
  		@title = video['title']
  		@provider = 'vimeo'
  	end
  end

  private

  def duration(dur)
    pattern = "PT"
    pattern += "%HH" if dur.include? "H"
    pattern += "%MM" if dur.include? "M"
    pattern += "%SS"
    DateTime.strptime(dur, pattern).seconds_since_midnight.to_i
  end
end