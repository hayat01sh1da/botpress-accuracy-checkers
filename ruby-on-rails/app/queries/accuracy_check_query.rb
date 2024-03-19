class AccuracyCheckQuery

  INVALID_PATTERNS = /[\\\'\|\`\^\"\<\>\)\(\}\{\]\[\;\/\?\:\@\&\=\+\$\,\%\# ]/

  def initialize(test_params)
    @scheme       = test_params[:scheme]
    @host         = test_params[:host].gsub(INVALID_PATTERNS, '')
    @bot_id       = test_params[:bot_id].gsub(INVALID_PATTERNS, '')
    @user_id      = test_params[:user_id].gsub(INVALID_PATTERNS, '')
    @access_token = test_params[:access_token].chomp
    @test_data    = CSV.read(test_params[:test_data], headers: true)
  end

  def res_bodies
    authorize!
    request.map(&:body).map { |res_body|
      JSON.parse(res_body)
    }
  end

  private

  attr_reader :scheme, :host, :bot_id, :user_id, :access_token, :test_data, :req

  def uri
    URI.parse("#{scheme}://#{host}/api/v1/bots/#{bot_id}/converse/#{user_id}/secured?include=suggestions")
  end

  def authorize!
    @req                 = Net::HTTP::Post.new(uri)
    @req[:authorization] = access_token
  end

  def request
    test_data['Question'].map { |question|
      req.set_form_data(type: :text, text: question)
      net_http         = Net::HTTP.new(uri.host, uri.port)
      net_http.use_ssl = true if uri.to_s.include?('https')
      net_http.start { _1.request(req) }
    }
  end
end
