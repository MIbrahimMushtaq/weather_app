import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../utils/utils.dart';
import 'daily_model.dart';

class DailyForecastView extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;
  const DailyForecastView({super.key, required this.weatherDataDaily});

  // string manipulation
  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 499,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Clr.dividerLine.withAlpha(150),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            alignment: Alignment.topLeft,
            child: const Text(
              'Next Days',
              style: TextStyle(
                color: Clr.textCotorBtack,
                fontSize: 17,
              ),
            ),
          ),
          dailyList()
        ],
      ),
    );
  }

  Widget dailyList() {
    return SizedBox(
      height: 430,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        // scrollDirection: Axis.vertical,
        itemCount: weatherDataDaily.daily.length > 7
            ? 7
            : weatherDataDaily.daily.length,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              Container(
                height: 60,
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(
                        getDay(weatherDataDaily.daily[index].dt),
                        style: const TextStyle(
                          color: Clr.textCotorBtack,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset(
                        'assets/weather/${weatherDataDaily.daily[index].weather![0].icon}.png',
                      ),
                    ),
                    Text(
                        '${weatherDataDaily.daily[index].temp!.max}°/${weatherDataDaily.daily[index].temp!.min}°')
                  ],
                ),
              ),
              Container(
                height: 1,
                color: Clr.dividerLine,
              )
            ],
          );
        }),
      ),
    );
  }
}
