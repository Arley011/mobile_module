import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_module/blocs/weather_bloc.dart';
import 'package:mobile_module/common/styles.dart';

class SettingsScreen extends StatefulWidget {
  final WeatherBloc weatherBloc;

  const SettingsScreen({Key key, this.weatherBloc}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextEditingController searchController;

  @override
  void initState() {
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
    return CupertinoPageScaffold(
      child: Container(
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
                      EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 30),
                  child: CupertinoTextField(
                    controller: searchController,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    placeholder: 'Write city name',
                  ),
                ),
                CupertinoButton(
                  onPressed: () {
                    widget.weatherBloc.add(
                        LoadCityByNameEvent(search: searchController.text));
                    print('search: ${searchController.text}');
                    Navigator.of(context).pop();
                  },
                  color: Colors.red,
                  child: Text(
                    'Show weather in city',
                    style: Styles.commonText,
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
