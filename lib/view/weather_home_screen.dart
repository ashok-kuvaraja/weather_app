import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_info_details.dart';
import 'package:weather_app/model/weather_info.dart';
import 'package:weather_app/view/weather_details_page.dart';
import 'package:weather_app/view_model/weather_home_view_model.dart';

class WeatherHomePage extends StatelessWidget {
  const WeatherHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Weather App'),
      ),
      body: FutureBuilder<WeatherInfo?>(
        future: HomeViewModel.instance.getWeatherInfo(),
        builder: (BuildContext context, AsyncSnapshot<WeatherInfo?> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            final WeatherInfoDetails details =
                HomeViewModel.instance.getRecentRecord(snapshot.data!);

            return ListView(
              scrollDirection: Axis.vertical,
              children: [
                Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              WeatherDetailsPage(details: details)));
                    },
                    title: const Center(
                        child: Text(
                      'Today Weather (Recent)',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Temperature: ${details.temp}'),
                        Text('Maximum  Temperature: ${details.maxTemp}'),
                        Text('Minimum Temperature: ${details.minTemp}'),
                        Text('Visibility: ${details.visibility}'),
                        Text('Wind: ${details.wind}')
                      ],
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: const Center(
                        child: Text(
                      'Forecast Weather',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Day 1:'),
                        Text('Day 2:'),
                        Text('Day 3:'),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return const Center(child: Text('Something went wrong...'));
          }
        },
      ),
    );
  }
}
