require 'net/http'

# Provides weather information from OpenWeatherMap
class OpenWeatherMapProvider
  # (city) id = 7531836   => Poznan, Poland
  #     units = metric    => Celsius degrees
  OPEN_WEATHER_MAP_URI = 'https://api.openweathermap.org/data/2.5/weather?id=7531836&units=metric&APPID='

  def initialize(id)
    @id = id
    @errors = [Timeout::Error, Errno::EINVAL, Errno::ECONNRESET,
               EOFError, Net::HTTPBadResponse,
               Net::HTTPHeaderSyntaxError, Net::ProtocolError]
  end

  # mandatory public interface method
  def fetch
    endpoint = URI(uri)
    Net::HTTP.get(endpoint)
  rescue *@errors => e
    pp e
    nil
  end

  # optional public interface method
  def uri
    OPEN_WEATHER_MAP_URI + @id
  end
end
