import 'package:apple_maps_flutter/apple_maps_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_module/blocs/search_bloc.dart';
import 'package:mobile_module/blocs/weather_bloc.dart';
import 'package:mobile_module/common/styles.dart';
import 'package:mobile_module/models/weather.dart';
import 'package:mobile_module/ui/settings/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AppleMapController _appleMapController;
  bool _isMapShown = false;
  WeatherBloc weatherBloc;

  @override
  void initState() {
    weatherBloc = BlocProvider.of<WeatherBloc>(context);
    weatherBloc.add(LoadCityByNameEvent(search: 'Moscow'));
    super.initState();
  }

  void _onMapCreated(AppleMapController controller) {
    _appleMapController = controller;
  }

  void _showOrHideMap() {
    setState(() {
      _isMapShown = !_isMapShown;
    });
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
                      child: Text('Error! Re-run and don\'t do this anymore)'),
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
                              child: CupertinoButton(
                                padding: EdgeInsets.zero,
                                child: Icon(
                                  CupertinoIcons.gear_big,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  BlocProvider.of<SearchBloc>(context)
                                      .add(SearchEvent.resetEvent());
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      builder: (context) => SettingsScreen(
                                            weatherBloc: weatherBloc,
                                          )));
                                },
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                _buildWeatherData(state.weather),
                                AnimatedContainer(
                                    height: _isMapShown ? 400 : 0,
                                    duration: Duration(milliseconds: 300),
                                    padding: EdgeInsets.only(
                                        top: 20, left: 30, right: 30),
                                    child: AppleMap(
                                      onMapCreated: _onMapCreated,
                                      initialCameraPosition:
                                          const CameraPosition(
                                        target: LatLng(0.0, 0.0),
                                      ),
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ));
          }),
    );
  }

  Widget _buildWeatherData(WeatherModel weather) {
    return Column(
      children: <Widget>[
        Text(
          weather.city.cityName,
          style: Styles.titleText,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          '${weather.temp.round()} ° C',
          style: Styles.commonText,
        ),
        Image.network(
          weather.weatherIconUrl,
          scale: 0.5,
          fit: BoxFit.fill,
        ),
        Text(
          '${weather.clouds} % Cloudiness',
          style: Styles.commonText,
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  'Wind',
                  style: Styles.commonText,
                ),
                Text(
                  '${weather.windSpeed} km/h',
                  style: Styles.commonText,
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  'Humidity',
                  style: Styles.commonText,
                ),
                Text(
                  '${weather.humidity} %',
                  style: Styles.commonText,
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        CupertinoButton(
          child: Text(
            'Show on map',
            style: Styles.commonText,
          ),
          onPressed: () {
            _showOrHideMap();
            if (_isMapShown) {
              _appleMapController.animateCamera(CameraUpdate.newLatLngZoom(
                  LatLng(weather.city.latitude, weather.city.longitude), 17));
            }
          },
        ),
      ],
    );
  }
}
