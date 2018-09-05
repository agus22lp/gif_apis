class GifsDotCom
  include HTTParty
  base_uri 'https://api.gifs.com'
  #debug_output $stdout # <= will spit out all request details to the console

  def self.import(source, trim)
    post("/media/import", { body: { source: source, trim: trim }.to_json, headers: { 'Gifs-API-Key' => TestGif::Application.credentials.gifs_dot_com,
      'Content-Type' => 'application/json' }}).parsed_response["success"]["files"]["gif"]
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
