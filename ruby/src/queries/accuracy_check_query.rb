require 'net/http'
require 'csv'
require 'json'

module Queries
  class AccuracyCheckQuery

    INVALID_PATTERNS = /[\\\'\|\`\^\"\<\>\)\(\}\{\]\[\;\/\?\:\@\&\=\+\$\,\%\# ]/

    def initialize(scheme, host, bot_id, user_id, test_data)
      @scheme    = scheme.gsub(INVALID_PATTERNS, '')
      @host      = host.gsub(INVALID_PATTERNS, '')
      @bot_id    = bot_id.gsub(INVALID_PATTERNS, '')
      @user_id   = user_id.gsub(INVALID_PATTERNS, '')
      @test_data = CSV.read(test_data, headers: true)
    end

    def res_bodies
      authorized
      request.map(&:body).map do |res_body|
        JSON.parse(res_body)
      end
    end

    private

    attr_reader :scheme, :host, :bot_id, :user_id, :test_data, :req

    def uri
      URI.parse("#{scheme}://#{host}/api/v1/bots/#{bot_id}/converse/#{user_id}/secured?include=suggestions")
    end

    def authorized
      @req                 = Net::HTTP::Post.new(uri)
      @req[:authorization] = ENV['BOTPRESS_ACCESS_TOKEN']
    end

    def request
      test_data['Question'].map { |question|
        req.set_form_data(type: :text, text: question)
        net_http         = Net::HTTP.new(uri.host, uri.port)
        net_http.use_ssl = true if uri.to_s.include?('https')
        net_http.start { it.request(req) }
      }
    end
  end
end
