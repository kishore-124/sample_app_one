module GetComment

  require 'uri'
  require 'net/http'

  def get_comment_lists(id)
    url = URI("https://jsonplaceholder.typicode.com/posts/#{id}/comments")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = http.request(request)

    comments = if response.code.to_i == 200
              JSON.parse(response.read_body)
            else
              []
            end

    comments
  end
end