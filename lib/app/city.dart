class City {
  late String city;
  City({
    required this.city,

  });

  factory City.fromJson(Map<dynamic, dynamic> json) {
    return City(
        city: json['results'][0]['city'],
    );
  }
}