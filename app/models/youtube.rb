class Youtube
  include HTTParty
  include UrlVideoParser
  base_uri 'https://www.googleapis.com'
  debug_output $stdout

  def initialize(key)
    @key = TestGif::Application.credentials.youtube
  end

  def get_info(link)
    self.class.get("/youtube/v3/videos", { query: { part: 'id, snippet, contentDetails', id: get_id(link), key: @key }})
  end
end