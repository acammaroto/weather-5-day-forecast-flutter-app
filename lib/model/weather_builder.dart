import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:techno_weather/model/weather.dart';
import 'package:techno_weather/theme/color.dart';

class WeatherBuilder {
  static List<Weather> buildWeatherConditionFromJson(dynamic data) {
    List<Weather> result = [];
    var weatherDataList = data['list'];
    String previousDate = "";
    for (var item in weatherDataList) {
      String date =
          DateFormat('EEEE, dd MMMM').format(DateTime.parse(item['dt_txt']));
      if (date != previousDate) {
        int id = item['dt'];
        int statusCode = item['weather'][0]['id'];
        String statusName = item['weather'][0]['main'].toString();
        String statusDescription = item['weather'][0]['description'].toString();
        String temperature = item['main']['temp'].toString();
        String humidity = item['main']['humidity'].toString();
        String icon = getIconBy(code: statusCode);
        Color color = getColorBy(code: statusCode);
        Weather weather = Weather(
          id: id,
          statusCode: statusCode,
          statusName: statusName,
          statusDescription: statusDescription,
          temperature: temperature,
          humidity: humidity,
          date: date,
          icon: icon,
          weatherColor: color,
        );
        result.add(weather);
      }
      previousDate = date;
    }
    return result;
  }

  static String getIconBy({code: int}) {
    if (code < 300) {
      return '🌩';
    } else if (code < 400) {
      return '🌧';
    } else if (code < 600) {
      return '☔️';
    } else if (code < 700) {
      return '☃️';
    } else if (code < 800) {
      return '🌫';
    } else if (code == 800) {
      return '☀️';
    } else if (code <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  static Color getColorBy({code: int}) {
    if (code < 300) {
      return greyThunder;
    } else if (code < 700) {
      return greyRainy;
    } else if (code < 800) {
      return blackCloudy;
    } else if (code == 800) {
      return cyanSunny;
    } else if (code <= 804) {
      return blackCloudy;
    } else {
      return greyRainy;
    }
  }
}
