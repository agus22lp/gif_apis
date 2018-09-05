class Youtube
  include HTTParty
  base_uri 'https://www.googleapis.com'

  def self.get_info(id)
    get("/youtube/v3/videos", { query: { part: 'id, snippet, contentDetails', id: id, key: TestGif::Application.credentials.youtube }})
  end
end