import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_module/blocs/weather_bloc.dart';
import 'package:mobile_module/common/styles.dart';
import 'package:mobile_module/repo/weather_repo.dart';
import 'package:mobile_module/ui/settings/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherRepo repo = WeatherRepo();
  WeatherBloc weatherBloc;

  @override
  void initState() {
    weatherBloc = BlocProvider.of<WeatherBloc>(context);
    weatherBloc.add(LoadCityByNameEvent(search: 'Moscow'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: BlocBuilder<WeatherBloc, WeatherState>(
          bloc: weatherBloc,
          builder: (context, state) {
            return state.when(
                initialState: (_) => Center(
                      child: CircularProgressIndicator(),
                    ),
                loadingState: (_) => Center(
                      child: CircularProgressIndicator(),
                    ),
                errorState: (_) => Center(
                      child: Text('LOLKEK'),
                    ),
                idleState: (state) => Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.lightBlue, Colors.amber])),
                      child: SafeArea(
                        child: ListView(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topRight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  CupertinoButton(
                                    child: Icon(
                                      CupertinoIcons.location_solid,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {},
                                  ),
                                  CupertinoButton(
                                    padding: EdgeInsets.zero,
                                    child: Icon(
                                      CupertinoIcons.gear_big,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                                  SettingsScreen(
                                                    weatherBloc: weatherBloc,
                                                  )));
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  state.weather.city.cityName,
                                  style: Styles.titleText,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  '${state.weather.temp.round()} ° C',
                                  style: Styles.commonText,
                                ),
                                Image.network(
                                  state.weather.weatherIconUrl,
                                  scale: 0.5,
                                  fit: BoxFit.fill,
                                ),
                                Text(
                                  '${state.weather.clouds} % Cloudiness',
                                  style: Styles.commonText,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  'Wind',
                                  style: Styles.commonText,
                                ),
                                Text(
                                  '${state.weather.windSpeed} km/h',
                                  style: Styles.commonText,
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  '${state.weather.humidity} % Humidity',
                                  style: Styles.commonText,
                                ),
                                CupertinoButton(
                                  child: Text(
                                    'Show on map',
                                    style: Styles.commonText,
                                  ),
                                  onPressed: () {},
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ));
          }),
    );
  }
}
