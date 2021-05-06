import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:techno_weather/theme/text.dart';

class Header {
  Column build() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat('EEEE, dd MMMM').format(DateTime.now()),
          style: h4,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Hi, user 👋",
          style: h1,
        ),
        SizedBox(
          height: 60,
        ),
        Text(
          "Enter the name of the city to see the weather condition for the next 5 days!",
          style: p,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
