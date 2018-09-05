module UrlVideoParser
  def get_id(url)
    youtube_formats = [
      %r(https?://youtu\.be/(.+)),
      %r(https?://www\.youtube\.com/watch\?v=(.*?)(&|#|$)),
      %r(https?://www\.youtube\.com/embed/(.*?)(\?|$)),
      %r(https?://www\.youtube\.com/v/(.*?)(#|\?|$)),
      %r(https?://www\.youtube\.com/user/.*?#\w/\w/\w/\w/(.+)\b)
    ]

    url.strip!

    if url.include? "youtu"
      youtube_formats.find { |format| url =~ format } and $1
      $1
    elsif url.include? "vimeo"
      match = url.match(/https?:\/\/(?:[\w]+\.)*vimeo\.com(?:[\/\w]*\/?)?\/(?<id>[0-9]+)[^\s]*/)
      match[:id] if match.present?
    else
      return nil # There should probably be some error message here
    end
  end
end
