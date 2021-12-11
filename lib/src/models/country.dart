class Country {
  Country({
    required this.name,
    required this.region,
    required this.currencies,
    required this.longitude,
    required this.latitude,
    this.flagImageUrl,
    this.coatOfArmsImageUrl,
  });

  Country.empty();

  Country.fromJson(Map<String, dynamic> json) {
    name = json['name']['common'];
    currencies = json['currencies'];
    region = json['region'];
    latitude = json['latlng'][0];
    longitude = json['latlng'][1];
    flagImageUrl = json['flags']['png'];
    coatOfArmsImageUrl = json['coatOfArms']['png'];
  }

  late final String name;
  late final String region;
  late final Map<String, dynamic> currencies;
  late final String? flagImageUrl;
  late final String? coatOfArmsImageUrl;
  late final double latitude;
  late final double longitude;
}
