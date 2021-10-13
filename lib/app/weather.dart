class Weather {
  late String city;
  late int temperature;
  late int humidity;
  late int feelslike;
  late String weatherDescriptions;
  late String iconURL;

  Weather({
    required this.city,
    required this.temperature,
    required this.humidity,
    required this.feelslike,
    required this.weatherDescriptions,
    required this.iconURL

  });

  factory Weather.fromJson(Map<dynamic, dynamic> json) {
    return Weather(
        city: json['location']['name'],
        temperature: json['current']['temperature'],
        humidity: json['current']['humidity'],
        feelslike: json['current']['feelslike'],
        weatherDescriptions: json['current']['weather_descriptions'][0],
        iconURL: json['current']['weather_icons'][0]
    );
  }
}