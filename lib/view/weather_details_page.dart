import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_info_details.dart';

class WeatherDetailsPage extends StatelessWidget {
  const WeatherDetailsPage({Key? key, required this.details}) : super(key: key);

  final WeatherInfoDetails details;

  @override
  Widget build(BuildContext context) {
    const TextStyle style = TextStyle(fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Weather App'),
      ),
      body: Column(children: [
        const Center(
            child: Text(
          'Weather Details',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )),
        Row(
          children: [
            const Text('Temperature: ', style: style),
            Text(details.temp),
          ],
        ),
        Row(
          children: [
            const Text('Maximum  Temperature: ', style: style),
            Text(details.maxTemp),
          ],
        ),
        Row(
          children: [
            const Text('Minimum Temperature: ', style: style),
            Text(details.minTemp),
          ],
        ),
        Row(
          children: [
            const Text('Visibility: ', style: style),
            Text(details.visibility),
          ],
        ),
        Row(
          children: [
            const Text('Wind: ', style: style),
            Text(details.wind),
          ],
        )
      ]),
    );
  }
}
