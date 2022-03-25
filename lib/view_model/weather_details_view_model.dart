class WeatherDetailsViewModel {
  WeatherDetailsViewModel._();

  static WeatherDetailsViewModel instance = WeatherDetailsViewModel._();

  factory WeatherDetailsViewModel() {
    return instance;
  }

  // Future<List<WeatherInfoDetails>> getFilteredWeatherInfoDetails(WeatherInfo info) async {
  //   return WeatherInfoDetails();
  // }
}
