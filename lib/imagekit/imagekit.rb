require "cgi"
require "digest"
require "json"

class ImageKit
  def initialize(url, options = {}, api_key = nil)
    @url = url
    @options = options
    @api_key = api_key
  end

  def to_s
    "https://api.imagekit.co/screenshot?#{query_string}"
  end

  class << self
    attr_accessor :api_key
  end

  private

  def query_string
    params = params_without_hash
    params[:hash] = hash
    params.map do |k, v|
      "#{CGI.escape(k.to_s)}=#{CGI.escape(v.to_s)}"
    end.join("&")
  end

  def hash
    Digest::MD5.hexdigest params_without_hash.to_json + (ImageKit.api_key || @api_key)
  end

  def params_without_hash
    {
      url: @url,
      width: @options[:width].to_s,
      height: @options[:height].to_s
    }.reject { |_k, v| v.strip == "" }
  end
end
