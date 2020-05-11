import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_module/blocs/search_bloc.dart';
import 'package:mobile_module/blocs/weather_bloc.dart';
import 'package:mobile_module/common/cities.dart';
import 'package:mobile_module/common/styles.dart';

class SettingsScreen extends StatefulWidget {
  final WeatherBloc weatherBloc;

  const SettingsScreen({Key key, this.weatherBloc}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextEditingController searchController;
  SearchBloc _searchBloc;

  @override
  void initState() {
    _searchBloc = BlocProvider.of<SearchBloc>(context);
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.lightBlue, Colors.amber])),
        child: SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 20),
                  child: CupertinoTextField(
                    controller: searchController,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    placeholder: 'Write city name',
                  ),
                ),
                BlocBuilder<SearchBloc, SearchState>(
                  bloc: _searchBloc,
                  builder: (context, state) => AnimatedContainer(
                    padding: state.whenOrElse(
                        orElse: (_) => EdgeInsets.symmetric(vertical: 10),
                        initialState: (_) => EdgeInsets.zero),
                    height: state.whenOrElse(
                        orElse: (_) => 50, initialState: (_) => 0),
                    duration: Duration(milliseconds: 300),
                    child: Text(
                      state.when(
                          idleState: (state) =>
                              'City ${state.weather.city.cityName} found',
                          errorState: (_) => 'Can\'t find this city :c',
                          initialState: (_) => '',
                          loadingState: (_) => ''),
                      style: Styles.commonText,
                    ),
                  ),
                ),
                BlocBuilder<SearchBloc, SearchState>(
                  bloc: _searchBloc,
                  builder: (context, state) => CupertinoButton(
                      onPressed: () {
                        state.whenOrElse(orElse: (_) {
                          _searchBloc.add(SearchCityByName(
                              searchCity: searchController.text));
                        }, idleState: (state) {
                          widget.weatherBloc.add(LoadCityByNameEvent(
                              search: searchController.text));
                          Navigator.of(context).pop();
                        });
                      },
                      color: Colors.red,
                      child: state.whenOrElse(
                          orElse: (_) => Text(
                                state.whenOrElse(
                                    orElse: (_) => 'Find city!',
                                    idleState: (state) => 'Show weather'),
                                style: Styles.commonText,
                              ),
                          loadingState: (_) => CircularProgressIndicator())),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Or choose city from list',
                  style: Styles.commonText,
                ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(left: 30, right: 30, top: 10),
                    children: <Widget>[
                      for (var city in Cities.list)
                        GestureDetector(
                          onTap: () {
                            widget.weatherBloc
                                .add(LoadCityByNameEvent(search: city));
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.black12),
                            child: Center(
                              child: Text(
                                city,
                                style: Styles.commonText,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
