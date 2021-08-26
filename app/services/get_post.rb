module GetPost

  require 'uri'
  require 'net/http'

  def get_post_lists
    url = URI("https://jsonplaceholder.typicode.com/posts")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = http.request(request)

    posts = if response.code.to_i == 200
              JSON.parse(response.read_body)
            else
              []
            end

    posts
  end

  def get_post(id)
    url = URI("https://jsonplaceholder.typicode.com/posts/#{id}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = http.request(request)

    post = if response.code.to_i == 200
              JSON.parse(response.read_body)
            else
              {}
            end

    post
  end
end