class Gfycat
  include HTTParty
  base_uri 'https://api.gfycat.com'
  debug_output $stdout # <= will spit out all request details to the console

  def initialize #(key)
    @client_id = '2_dkRQFw'
    @client_secret = 'qn6Kiacvb7_YmZ7nGLnLT6gXr7yY8jW2yxk94eVwXRo_cZGIg0EIRlusNe2FQyRF'
  end

  def import  #(source, trim)
    response = self.class.post('/v1/gfycats', body: {
      fetchUrl: 'https://www.youtube.com/watch?v=jhyANGHDDH8',
      title: 'Pablo test - nba',
      tags: ['nba','pablo'],
      captions: {
        duration: 16,
        startSeconds: 63
      }
    }.to_json, headers: { 'Content-Type' => 'application/json' } )

    gfyname = response.parsed_response['gfyname']

    #self.base_uri "https://filedrop.gfycat.com"
    #self.class.post('/v1/gfycats', query: {"upload-file": gfyname })

    #HTTParty.post('https://filedrop.gfycat.com/v1/gfycats', { query: { "upload-file": gfyname }})
  end
end