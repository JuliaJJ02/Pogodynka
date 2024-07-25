//that's our API service - helper
//define here all the methods we use to get our data from the API
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show immutable;

import '/constants/constants.dart';
import '/models/hourly_weather.dart';
import '/models/weather.dart';
import '/models/weekly_weather.dart';
import '/services/geolocator.dart';
import '/utils/logging.dart';

//1st our 2 urls (openweather and meteo)
//2nd our 2 variables for location - lat and lon
//3rd the instance of dio package
@immutable
class ApiHelper {
  static const baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const weeklyWeatherUrl =
      'https://api.open-meteo.com/v1/forecast?current=&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=auto';

  static double lat = 0.0;
  static double lon = 0.0;
  static final dio = Dio();

  // Get lat and lon
  static Future<void> fetchLocation() async {
    final location = await getLocation();
    lat = location.latitude;
    lon = location.longitude;
  }

  //defining main methods..
  //Current Weather
  //fetch location -> fill out lat and lon
  //then call construct with url, and put it into the url variable
  //then pass this url inside the fetchData method, and we will get our data
  //then pass it inside the response
  //lastly turn my response to better model, and return it
  static Future<Weather> getCurrentWeather() async {
    await fetchLocation();
    final url = _constructWeatherUrl();
    final response = await _fetchData(url);
    return Weather.fromJson(response);
  }

  //Hourly Weather
  static Future<HourlyWeather> getHourlyForecast() async {
    await fetchLocation();
    final url = _constructForecastUrl();
    final response = await _fetchData(url);
    return HourlyWeather.fromJson(response);
  }

  // Weekly weather
  static Future<WeeklyWeather> getWeeklyForecast() async {
    await fetchLocation();
    final url = _constructWeeklyForecastUrl();
    final response = await _fetchData(url);
    return WeeklyWeather.fromJson(response);
  }

  // Weather by City Name
  //all same like before, but also the CITY NAME string is required
  static Future<Weather> getWeatherByCityName({
    required String cityName,
  }) async {
    final url = _constructWeatherByCityUrl(cityName);
    final response = await _fetchData(url);
    return Weather.fromJson(response);
  }



  //build urls (instead of writing each in every method. all of them are in 1 separate method)
  //we are taking the base url, providing the lat and lon, metric and then Constant API key is taken from constants.dart
  static String _constructWeatherUrl() =>
      '$baseUrl/weather?lat=$lat&lon=$lon&units=metric&appid=${Constants
          .apiKey}';

  //forecast weather url
  static String _constructForecastUrl() =>
      '$baseUrl/forecast?lat=$lat&lon=$lon&units=metric&appid=${Constants
          .apiKey}';

  //weather by city url
  static String _constructWeatherByCityUrl(String cityName) =>
      '$baseUrl/weather?q=$cityName&units=metric&appid=${Constants.apiKey}';

  //weekly forecast url
  static String _constructWeeklyForecastUrl() =>
      '$weeklyWeatherUrl&latitude=$lat&longitude=$lon';

  //last method to define is to fetch data (take one of the above url and fetch data for that url)
  static Future<Map<String, dynamic>> _fetchData(String url) async {
    try {
      //dio.get -> and pass the url
      final response = await dio.get(url);

      //if the status code = 200 it means we received data successfully, then return data, otherwise - error
      if (response.statusCode == 200) {
        return response.data;
      } else {
        printWarning('Failed to load data: ${response.statusCode}');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      printWarning('Error fetching data from $url: $e');
      throw Exception('Error fetching data');
    }
  }
}