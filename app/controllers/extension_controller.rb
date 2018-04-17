class ExtensionController  < ApplicationController

  def scrape
    page = Nokogiri::HTML(RestClient.get(params[:url]))
    @json = search_with_title(page) || search_for_addresses(page) || {error: "No results found"}
    render json: @json
  end

  private

  def search_with_title(page)
    title = page.xpath('//title').first.text.split(' ').join('+')
    @result = RestClient.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{title}&key=#{ENV['google_api_key']}")
    @json = JSON.parse(@result)
    if @json["status"] == "OK"
      return @json["results"]
    else
      return nil
    end
  end

  def search_for_addresses(page)
    text = page.text
    if !text.valid_encoding?
      text.encode!( text.encoding, "binary", :invalid => :replace, :undef => :replace, :replace => "?")
    end
    text = text.scan(/^.*[,]\s[A-Z][A-Z]/).map{|string| string.strip}
    places = []
    text.each do |address|
      @result = RestClient.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=places+near+#{address.split(' ').join('+')}&key=#{ENV['google_api_key']}")
      @json = JSON.parse(@result)
      if @json["status"] == "OK"
        place = @json["results"].first
        places << place
      end
    end
    places
  end

end
