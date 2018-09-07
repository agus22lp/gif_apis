class Gif < ApplicationRecord

  def self.import(source, trim)
    data = HTTParty.post("https://api.gifs.com/media/import", { body: { source: source, trim: trim}.to_json,
      headers: { 'Gifs-API-Key' => TestGif::Application.credentials.gifs_dot_com, 'Content-Type' => 'application/json' }})

    if data.parsed_response['success']
      api_id = URI.parse(data.parsed_response['success']['page']).path.split('/').last
      self.create(api_id: api_id, url: data.parsed_response['success']['files']['gif'], mp4: data.parsed_response['success']['files']['mp4'])
    else
      false
    end
  end

end
  