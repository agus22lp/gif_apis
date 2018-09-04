class Youtube
  include HTTParty
  include UrlVideoParser
  base_uri 'https://www.googleapis.com'

  def initialize(key)
    @key = 'AIzaSyDy65fOEPSdFx9cAprOer7GJovtgZNHKf8'
  end

  def get_info(link)
    self.class.get("/youtube/v3/videos", { query: { part: 'id, snippet, contentDetails', id: get_id(link), key: @key }})
  end
end