#!/usr/bin/env ruby

require_relative 'lib/google_translate_provider'
require_relative 'lib/open_weather_map_provider'
require_relative 'lib/weather_forecast'

OPEN_WEATHER_MAP_APP_ID = ENV['OPEN_WEATHER_MAP_APP_ID'] || 'YOUR_ID'
GOOGLE_CLOUD_PROJECT_ID = ENV['GOOGLE_CLOUD_PROJECT_ID'] || 'PROJECT_ID'
GOOGLE_CLOUD_CREDENTIALS_PATH = ENV['GOOGLE_CLOUD_CREDENTIALS_PATH'] || 'CREDENTIALS_PATH'

weather   = OpenWeatherMapProvider.new(OPEN_WEATHER_MAP_APP_ID)
translate = GoogleTranslateProvider.new(GOOGLE_CLOUD_PROJECT_ID,
                                        GOOGLE_CLOUD_CREDENTIALS_PATH)

cli = WeatherForecast.new(weather, translate)
cli.forecast
