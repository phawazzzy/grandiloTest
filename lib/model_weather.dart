import 'package:http/http.dart' as http;
import 'dart:convert'


class WeatherModel{
  final temp;
  final pressure;
  final humidity;
  final temp_max;
  final temp_min;

  double get getTemp => temp-272.5;
  double get getMaxTemp => temp_max-272.5;
  double get getMinTemp => temp_min-272.5;

  WeatherModel(
    this.temp, this.pressure, this.humidity, this.temp_max, this.temp_min,

  );

  factory WeatherModel.fromJson(Map<String, dynamic> json){
    return WeatherModel(
      json['temp'],
      json['pressure'],
      json['humidity'],
      json['temp_max'],
      json['temp_min']
    );
  }

}


class WeatherService{
  String city = 'lagos';
  Future<WeatherModel> getWeather(String city) async{
    final result = await http.Client().get("https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=ed72bb9f3e0b5e607e85fb8a6f251e96");
  }
}
