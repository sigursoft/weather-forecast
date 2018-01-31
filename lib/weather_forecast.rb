require 'json'

# Main logic is here
class WeatherForecast
  def initialize(api, translator)
    @api = api
    @translator = translator
  end

  def forecast
    response = @api.fetch
    data = JSON.parse(response)
    if data['cod'] == 200
      print_description(data)
      print_temp(data)
    elsif data['cod'] == 401
      puts 'Invalid OpenWeatherMap API APP ID!'
    else
      pp data
    end
  end

  private

  def print_description(data)
    desc = @translator.translate(data['weather'][0]['description'], 'be')
    puts "Сёння ў Познані #{desc.to_s.downcase}."
  end

  def print_temp(data)
    puts "Актуальная тэмпература паветра: #{data['main']['temp']}°C."
  end
end
