// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_bloc.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class WeatherEvent extends Equatable {
  const WeatherEvent(this._type);

  factory WeatherEvent.loadCityByNameEvent({@required String search}) =
      LoadCityByNameEvent;

  final _WeatherEvent _type;

//ignore: missing_return
  R when<R>({@required R Function(LoadCityByNameEvent) loadCityByNameEvent}) {
    assert(() {
      if (loadCityByNameEvent == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _WeatherEvent.LoadCityByNameEvent:
        return loadCityByNameEvent(this as LoadCityByNameEvent);
    }
  }

//ignore: missing_return
  Future<R> asyncWhen<R>(
      {@required
          FutureOr<R> Function(LoadCityByNameEvent) loadCityByNameEvent}) {
    assert(() {
      if (loadCityByNameEvent == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _WeatherEvent.LoadCityByNameEvent:
        return loadCityByNameEvent(this as LoadCityByNameEvent);
    }
  }

  R whenOrElse<R>(
      {R Function(LoadCityByNameEvent) loadCityByNameEvent,
      @required R Function(WeatherEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _WeatherEvent.LoadCityByNameEvent:
        if (loadCityByNameEvent == null) break;
        return loadCityByNameEvent(this as LoadCityByNameEvent);
    }
    return orElse(this);
  }

  Future<R> asyncWhenOrElse<R>(
      {FutureOr<R> Function(LoadCityByNameEvent) loadCityByNameEvent,
      @required FutureOr<R> Function(WeatherEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _WeatherEvent.LoadCityByNameEvent:
        if (loadCityByNameEvent == null) break;
        return loadCityByNameEvent(this as LoadCityByNameEvent);
    }
    return orElse(this);
  }

//ignore: missing_return
  Future<void> whenPartial(
      {FutureOr<void> Function(LoadCityByNameEvent) loadCityByNameEvent}) {
    assert(() {
      if (loadCityByNameEvent == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _WeatherEvent.LoadCityByNameEvent:
        if (loadCityByNameEvent == null) break;
        return loadCityByNameEvent(this as LoadCityByNameEvent);
    }
  }

  @override
  List get props => const [];
}

@immutable
class LoadCityByNameEvent extends WeatherEvent {
  const LoadCityByNameEvent({@required this.search})
      : super(_WeatherEvent.LoadCityByNameEvent);

  final String search;

  @override
  String toString() => 'LoadCityByNameEvent(search:${this.search})';
  @override
  List get props => [search];
}

@immutable
abstract class WeatherState extends Equatable {
  const WeatherState(this._type);

  factory WeatherState.initialState() = InitialState;

  factory WeatherState.loadingState() = LoadingState;

  factory WeatherState.errorState() = ErrorState;

  factory WeatherState.idleState({@required WeatherModel weather}) = IdleState;

  final _WeatherState _type;

//ignore: missing_return
  R when<R>(
      {@required R Function(InitialState) initialState,
      @required R Function(LoadingState) loadingState,
      @required R Function(ErrorState) errorState,
      @required R Function(IdleState) idleState}) {
    assert(() {
      if (initialState == null ||
          loadingState == null ||
          errorState == null ||
          idleState == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _WeatherState.InitialState:
        return initialState(this as InitialState);
      case _WeatherState.LoadingState:
        return loadingState(this as LoadingState);
      case _WeatherState.ErrorState:
        return errorState(this as ErrorState);
      case _WeatherState.IdleState:
        return idleState(this as IdleState);
    }
  }

//ignore: missing_return
  Future<R> asyncWhen<R>(
      {@required FutureOr<R> Function(InitialState) initialState,
      @required FutureOr<R> Function(LoadingState) loadingState,
      @required FutureOr<R> Function(ErrorState) errorState,
      @required FutureOr<R> Function(IdleState) idleState}) {
    assert(() {
      if (initialState == null ||
          loadingState == null ||
          errorState == null ||
          idleState == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _WeatherState.InitialState:
        return initialState(this as InitialState);
      case _WeatherState.LoadingState:
        return loadingState(this as LoadingState);
      case _WeatherState.ErrorState:
        return errorState(this as ErrorState);
      case _WeatherState.IdleState:
        return idleState(this as IdleState);
    }
  }

  R whenOrElse<R>(
      {R Function(InitialState) initialState,
      R Function(LoadingState) loadingState,
      R Function(ErrorState) errorState,
      R Function(IdleState) idleState,
      @required R Function(WeatherState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _WeatherState.InitialState:
        if (initialState == null) break;
        return initialState(this as InitialState);
      case _WeatherState.LoadingState:
        if (loadingState == null) break;
        return loadingState(this as LoadingState);
      case _WeatherState.ErrorState:
        if (errorState == null) break;
        return errorState(this as ErrorState);
      case _WeatherState.IdleState:
        if (idleState == null) break;
        return idleState(this as IdleState);
    }
    return orElse(this);
  }

  Future<R> asyncWhenOrElse<R>(
      {FutureOr<R> Function(InitialState) initialState,
      FutureOr<R> Function(LoadingState) loadingState,
      FutureOr<R> Function(ErrorState) errorState,
      FutureOr<R> Function(IdleState) idleState,
      @required FutureOr<R> Function(WeatherState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _WeatherState.InitialState:
        if (initialState == null) break;
        return initialState(this as InitialState);
      case _WeatherState.LoadingState:
        if (loadingState == null) break;
        return loadingState(this as LoadingState);
      case _WeatherState.ErrorState:
        if (errorState == null) break;
        return errorState(this as ErrorState);
      case _WeatherState.IdleState:
        if (idleState == null) break;
        return idleState(this as IdleState);
    }
    return orElse(this);
  }

//ignore: missing_return
  Future<void> whenPartial(
      {FutureOr<void> Function(InitialState) initialState,
      FutureOr<void> Function(LoadingState) loadingState,
      FutureOr<void> Function(ErrorState) errorState,
      FutureOr<void> Function(IdleState) idleState}) {
    assert(() {
      if (initialState == null &&
          loadingState == null &&
          errorState == null &&
          idleState == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _WeatherState.InitialState:
        if (initialState == null) break;
        return initialState(this as InitialState);
      case _WeatherState.LoadingState:
        if (loadingState == null) break;
        return loadingState(this as LoadingState);
      case _WeatherState.ErrorState:
        if (errorState == null) break;
        return errorState(this as ErrorState);
      case _WeatherState.IdleState:
        if (idleState == null) break;
        return idleState(this as IdleState);
    }
  }

  @override
  List get props => const [];
}

@immutable
class InitialState extends WeatherState {
  const InitialState._() : super(_WeatherState.InitialState);

  factory InitialState() {
    _instance ??= const InitialState._();
    return _instance;
  }

  static InitialState _instance;
}

@immutable
class LoadingState extends WeatherState {
  const LoadingState._() : super(_WeatherState.LoadingState);

  factory LoadingState() {
    _instance ??= const LoadingState._();
    return _instance;
  }

  static LoadingState _instance;
}

@immutable
class ErrorState extends WeatherState {
  const ErrorState._() : super(_WeatherState.ErrorState);

  factory ErrorState() {
    _instance ??= const ErrorState._();
    return _instance;
  }

  static ErrorState _instance;
}

@immutable
class IdleState extends WeatherState {
  const IdleState({@required this.weather}) : super(_WeatherState.IdleState);

  final WeatherModel weather;

  @override
  String toString() => 'IdleState(weather:${this.weather})';
  @override
  List get props => [weather];
}
