class Giphy
  include HTTParty
  base_uri 'https://upload.giphy.com'
  #debug_output $stdout # <= will spit out all request details to the console
  GIPHY_URL = 'https://giphy.com/gifs/'

  def self.import(source, trim)
    response = post("/v1/gifs", { query: { source_image_url: source, api_key: TestGif::Application.credentials.giphy }})
    GIPHY_URL + response.parsed_response["data"]["id"] + '/html5'
  end
end
# curl -X POST -H "Gifs-API-Key: gifs56d63999f0f34" -H "Content-Type: application/json" -d '{ "source": "https://www.youtube.com/watch?v=jhyANGHDDH8", "trim": { "start": 118, "end": 122 } }' "https://api.gifs.com/media/import"
# {
#   "success": {
#     "page": "https://gifs.com/gif/APVWzz",
#     "oembed": "https://gifs.com/oembed/APVWzz",
#     "embed": "<iframe src='https://gifs.com/embed/APVWzz' frameborder='0' scrolling='no' width='640' height='360' style='-webkit-backface-visibility: hidden;-webkit-transform: scale(1);' ></iframe>",
#     "files": {
#       "gif": "https://j.gifs.com/APVWzz.gif",
#       "jpg": "https://j.gifs.com/APVWzz.jpg",
#       "mp4": "https://j.gifs.com/APVWzz.mp4"
#     }
#   }
# }
