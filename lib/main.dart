import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_module/ui/home/home_screen.dart';

import 'blocs/search_bloc.dart';
import 'blocs/weather_bloc.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherBloc>(
          create: (_) => WeatherBloc(),
        ),
        BlocProvider<SearchBloc>(
          create: (_) => SearchBloc(),
        )
      ],
      child: CupertinoApp(
        title: 'Flutter',
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
//          child: CupertinoPageScaffold(
//          navigationBar: CupertinoNavigationBar(
//            padding: EdgeInsetsDirectional.only(start: 10, end: 10),
//            trailing: CupertinoButton(
//              onPressed: () {},
//              padding: EdgeInsets.only(right: 5, top: 5, bottom: 5),
//              child: Icon(
//                CupertinoIcons.settings_solid,
//                size: 30,
//              ),
//            ),
//            middle: Text('Kiev'),
//          ),

//          ),
      ),
    );
  }
}
