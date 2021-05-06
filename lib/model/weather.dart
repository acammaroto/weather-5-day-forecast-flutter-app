import 'package:flutter/material.dart';

class Weather {
  final int id;
  final String statusName;
  final int statusCode;
  final String statusDescription;
  final String temperature;
  final String humidity;
  final String date;
  final String icon;
  final Color weatherColor;

  Weather(
      {this.id,
      this.statusName,
      this.statusCode,
      this.statusDescription,
      this.temperature,
      this.humidity,
      this.date,
      this.icon,
      this.weatherColor});
}
