import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techno_weather/model/weather.dart';
import 'package:techno_weather/model/weather_builder.dart';
import 'package:techno_weather/service/networking.dart';
import 'package:techno_weather/theme/color.dart';
import 'package:techno_weather/view/header.dart';
import 'package:techno_weather/view/weather_list.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();
  ListView weather = ListView();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void getWeatherDataBy({city: String}) async {
    NetworkingHelper http = NetworkingHelper();
    http.getDataFor(city: city).then((value) {
      List<Weather> values =
          WeatherBuilder.buildWeatherConditionFromJson(value);
      print(values);
      setState(() {
        weather = WeatherListView().build(data: values);
      });
    }).catchError((error) {
      setState(() {
        weather = ListView();
      });
      showDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
                title: Text("Ops"),
                content: Text(
                    "There is a thunder upon your internet connection or you are searching for a unknown location. Please retry."),
                actions: <Widget>[
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text("OK"),
                    onPressed: () => {Navigator.pop(context)},
                  ),
                ],
              ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header().build(),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: whiteGrey, borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Icon(CupertinoIcons.search),
                    Flexible(
                      child: CupertinoTextField(
                        placeholder: "City name...",
                        controller: _searchController,
                        onEditingComplete: () {
                          getWeatherDataBy(city: _searchController.text);
                          FocusScope.of(context).unfocus();
                        },
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(child: weather),
            ],
          ),
        ),
      ),
    );
  }
}
