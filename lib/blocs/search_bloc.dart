import 'package:bloc/bloc.dart';
import 'package:mobile_module/models/weather.dart';
import 'package:mobile_module/repo/weather_repo.dart';
import 'package:super_enum/super_enum.dart';

part 'search_bloc.g.dart';

@superEnum
enum _SearchState {
  @object
  InitialState,
  @object
  LoadingState,
  @object
  ErrorState,
  @Data(fields: [DataField<WeatherModel>('weather')])
  IdleState,
}

@superEnum
enum _SearchEvent {
  @Data(fields: [DataField<String>('searchCity')])
  SearchCityByName,
  @object
  ResetEvent,
}

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final WeatherRepo weatherRepo = WeatherRepo();

  @override
  SearchState get initialState => SearchState.initialState();

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    yield* event.when(
        searchCityByName: (e) => _mapSearchCityByNameEventToState(e),
        resetEvent: (e) => _mapResetEventToState(e));
  }

  Stream<SearchState> _mapResetEventToState(ResetEvent e) async* {
    yield SearchState.initialState();
  }

  Stream<SearchState> _mapSearchCityByNameEventToState(
      SearchCityByName e) async* {
    yield SearchState.loadingState();
    try {
      final weather = await weatherRepo.getWeatherInCity(e.searchCity);
      yield SearchState.idleState(weather: weather);
    } catch (ex, st) {
      print('$ex\n$st');
      yield SearchState.errorState();
    }
  }
}
