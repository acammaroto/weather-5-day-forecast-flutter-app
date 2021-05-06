# 5 Days Weather Forecast Flutter App

This is just a simple app that show the weather conditions for the next 5 days. 

## Getting Started

Since this is simple Flutter application I did't use such complex pattern like BloC or Provider. Even if Google's Team suggest to use Providers when you work with remote data I dediced to keep it lean and simple. 

## How it work
Every time the user hit the "enter button" after typed a city in the search bar the app call the openweather api using a Future.

```dart
NetworkingHelper http = NetworkingHelper();
http.getDataFor(city: city).then((value) {
   ...
    }).catchError((error) {
     ...
    });
```

If the API call status return 200 the data are passed to a builder in order to obtain the correct list model to create the view. 

Since the api call returns a forecast of 5days/3hours and there is no way to get from the backend just one entry per day. For this reason the builder checks the date of every entry in order to take only one wheather contidion per day.

```dart
List<Weather> buildWeatherConditionFromJson(dynamic data) {
    List<Weather> result = [];
    var weatherDataList = data['list'];
    String previousDate = "";
    for (var item in weatherDataList) {
      String date =
          DateFormat('EEEE, dd MMMM').format(DateTime.parse(item['dt_txt']));
      if (date != previousDate) {
        ...
        result.add(weather);
      }
      previousDate = date;
    }
    return result;
  }
```