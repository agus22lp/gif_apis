class Giphy < ApplicationRecord
  #debug_output $stdout # <= will spit out all request details to the console

  def self.import(source, trim)
    # trim: trim /we don't have trim
    response = HTTParty.post("https://upload.giphy.com/v1/gifs", { query: { source_image_url: source, api_key: TestGif::Application.credentials.giphy }})

    data = HTTParty.get("https://api.giphy.com/v1/gifs/#{response.parsed_response["data"]["id"]}", { query: { api_key: TestGif::Application.credentials.giphy }}).parsed_response["data"]

    self.create(api_id: data["id"], slug: data["slug"], url: data["url"], bitly_url: data["bitly_url"], embed_url: data["embed_url"], username: data["username"],
                source: data["source"], source_tld: data["source_tld"], source_post_url: data["source_post_url"], title: data["title"])
  end

  def html5_url
    "https://media.giphy.com/media/#{api_id}/giphy.gif"
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
#   }Giphy
# }
