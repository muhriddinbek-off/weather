class WeatherForecast {
  final List<Forecastday> forecastday;
  WeatherForecast({
    required this.forecastday,
  });
  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    List<Forecastday> forecastdays = [];
    json["forecastday"].forEach((e) => forecastdays.add(Forecastday.fromJson(e)));
    return WeatherForecast(
      forecastday: List.from(forecastdays),
    );
  }
}

class Forecastday {
  final String data;
  final Day day;
  final Astro astro;
  final List<Hour> hour;

  Forecastday({
    required this.data,
    required this.day,
    required this.astro,
    required this.hour,
  });
  factory Forecastday.fromJson(Map<String, dynamic> json) {
    List<Hour> hours = [];
    json["hour"].forEach((e) => hours.add(Hour.fromJson(e)));
    return Forecastday(
      data: json["date"] as String? ?? "",
      day: Day.fromJson(json["day"]),
      astro: Astro.fromJson(json["astro"]),
      hour: List.from(hours),
    );
  }
}

class Day {
  final num maxtempC;
  final num mintempC;
  final num maxwindMph;
  final num uv;
  final num dailyChanceOfRain;
  final num dailyChanceOfSnow;
  final String icon;
  Day({
    required this.dailyChanceOfRain,
    required this.dailyChanceOfSnow,
    required this.maxtempC,
    required this.maxwindMph,
    required this.mintempC,
    required this.uv,
    required this.icon,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      dailyChanceOfRain: json["daily_chance_of_rain"] as num? ?? 0,
      dailyChanceOfSnow: json["daily_chance_of_snow"] as num? ?? 0,
      maxtempC: json["maxtemp_c"] as num? ?? 0,
      maxwindMph: json["maxwind_mph"] as num? ?? 0,
      mintempC: json["mintemp_c"] as num? ?? 0,
      uv: json["uv"] as num? ?? 0,
      icon: json["condition"]["icon"] as String? ?? "",
    );
  }
}

class Astro {
  final String sunrise;
  final String sunset;
  Astro({
    required this.sunrise,
    required this.sunset,
  });
  factory Astro.fromJson(Map<String, dynamic> json) {
    return Astro(
      sunrise: json["sunrise"] as String? ?? "",
      sunset: json["sunset"] as String? ?? "",
    );
  }
}

class Hour {
  final String time;
  final num tempC;
  final String text;
  final String icon;
  final num chanceOfRain;
  final num chanceOfSnow;
  Hour({
    required this.chanceOfRain,
    required this.chanceOfSnow,
    required this.icon,
    required this.tempC,
    required this.text,
    required this.time,
  });
  factory Hour.fromJson(Map<String, dynamic> json) {
    return Hour(
      chanceOfRain: json["chance-of_rain"] as num? ?? 0,
      chanceOfSnow: json["chance_of_snow"] as num? ?? 0,
      icon: json["condition"]["icon"] as String? ?? "",
      tempC: json["temp_c"] as num? ?? 0,
      text: json["condition"]["text"] as String? ?? "",
      time: json["time"] as String? ?? "",
    );
  }
}
