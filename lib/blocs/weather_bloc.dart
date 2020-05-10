import 'package:bloc/bloc.dart';
import 'package:mobile_module/models/weather.dart';
import 'package:mobile_module/repo/weather_repo.dart';
import 'package:super_enum/super_enum.dart';

part 'weather_bloc.g.dart';

@superEnum
enum _WeatherEvent {
  @Data(fields: [
    DataField<String>('search'),
  ])
  LoadCityByNameEvent
}

@superEnum
enum _WeatherState {
  @object
  InitialState,
  @object
  LoadingState,
  @object
  ErrorState,
  @Data(fields: [DataField<WeatherModel>('weather')])
  IdleState,
}

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepo repo = WeatherRepo();
  @override
  WeatherState get initialState => WeatherState.initialState();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    yield* event.when(
        loadCityByNameEvent: (e) => _mapLoadCityByNameEventToState(e));
  }

  Stream<WeatherState> _mapLoadCityByNameEventToState(
      LoadCityByNameEvent e) async* {
    yield WeatherState.loadingState();
    try {
      final weather = await repo.getWeatherInCity(e.search);
      yield WeatherState.idleState(weather: weather);
    } catch (ex, st) {
      print('$ex\n$st');
      yield WeatherState.errorState();
    }
  }
}
