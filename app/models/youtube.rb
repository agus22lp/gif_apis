class Youtube
	attr_accessor :info

  def initialize(link)
    @info = Yt::Video.new(url: link)
  end
end