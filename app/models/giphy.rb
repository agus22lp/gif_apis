class Giphy
  include HTTParty
  base_uri 'https://upload.giphy.com'
  debug_output $stdout # <= will spit out all request details to the console

  def initialize(key)
    @key = '4RLrMZipKlEVEV1vxRkDQy7fuZGMFsVq'
  end

  def import(source, trim)
    self.class.post("/v1/gifs", { body: { source_image_url: "https://www.youtube.com/watch?v=jhyANGHDDH8",
    																			api_key: '4RLrMZipKlEVEV1vxRkDQy7fuZGMFsVq&q',
    																			tags: 'nba, basket, ball' }.to_json, headers: { 'Content-Type' => 'application/json' }})
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
