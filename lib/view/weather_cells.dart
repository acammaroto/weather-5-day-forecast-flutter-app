import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:techno_weather/model/weather.dart';
import 'package:techno_weather/theme/text.dart';

class WeatherListCell {
  Container buildFirtCell({data: Weather}) {
    return Container(
      decoration: BoxDecoration(
        color: data.weatherColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              DateFormat('EEEE, dd MMMM').format(DateTime.now()),
              style: data.statusCode > 800 ? h4Light : h4,
            ),
            Text(
              "${data.icon}",
              style: TextStyle(fontSize: 100),
            ),
            //Text("Mid Temp: ${values[0].temperature}°", style: h1),
            Align(
              alignment: Alignment.center,
              child: Text(
                "${data.statusName} | ${data.statusDescription} | ${data.humidity}% humidity",
                style: data.statusCode > 800 ? h3Light : h3,
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Container buildCell({data: Weather}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: data.weatherColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 0,
              child: Text(
                "${data.icon}",
                style: TextStyle(fontSize: 100),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.date,
                    style: data.statusCode > 800 ? h4Light : h4,
                  ),
                  Text(
                    "${data.statusName} | ${data.statusDescription} | ${data.humidity}% humidity",
                    style: data.statusCode > 800 ? h3Light : h3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
