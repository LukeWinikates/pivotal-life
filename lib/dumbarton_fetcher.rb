class DumbartonFetcher
  def initialize(token)
    url = "http://services.my511.org/Transit2.0/GetNextDeparturesByStopCode.aspx?token=#{token}&stopCode=58409"
    @data = fetch_data(url)
  end

  def fetch_data(url)
    response = Nokogiri::XML(Net::HTTP.get(URI(url)))
    response.css("DepartureTime").map do |departure_time|
      Integer(departure_time.text)
    end
  end

  def data
    @data
  end
end