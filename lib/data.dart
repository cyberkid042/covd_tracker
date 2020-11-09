class World {
  final int cases;
  final int deaths;
  final int recovered;

  World({this.cases, this.deaths, this.recovered});

  factory World.fromJson(Map<String, dynamic> json) {
    return World(
      cases: json['cases'],
      deaths: json['deaths'],
      recovered: json['recovered'],
    );
  }
}

class Country {
  final String country;
  final int todayCases;
  final int todayDeaths;
  final int cases;
  final int deaths;
  final int recovered;
  final int active;
  final int critical;
  final int casesPerOneMillion;

  Country(
      {this.cases,
      this.deaths,
      this.recovered,
      this.country,
      this.active,
      this.casesPerOneMillion,
      this.critical,
      this.todayCases,
      this.todayDeaths});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      country: json['country'],
      cases: json['cases'],
      todayCases: json['todayCases'],
      deaths: json['deaths'],
      todayDeaths: json['todayDeaths'],
      recovered: json['recovered'],
      active: json['active'],
      critical: json['critical'],
      casesPerOneMillion: json['casesPerOneMillion'],
    );
  }
}
