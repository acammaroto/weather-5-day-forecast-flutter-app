import 'package:flutter/material.dart';
import 'package:techno_weather/view/weather_cells.dart';

class WeatherListView {
  ListView build({data: dynamic}) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return index == 0
            ? WeatherListCell().buildFirtCell(data: data[index])
            : WeatherListCell().buildCell(data: data[index]);
      },
    );
  }
}
