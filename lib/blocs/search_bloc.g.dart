// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_bloc.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class SearchState extends Equatable {
  const SearchState(this._type);

  factory SearchState.initialState() = InitialState;

  factory SearchState.loadingState() = LoadingState;

  factory SearchState.errorState() = ErrorState;

  factory SearchState.idleState({@required WeatherModel weather}) = IdleState;

  final _SearchState _type;

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
      case _SearchState.InitialState:
        return initialState(this as InitialState);
      case _SearchState.LoadingState:
        return loadingState(this as LoadingState);
      case _SearchState.ErrorState:
        return errorState(this as ErrorState);
      case _SearchState.IdleState:
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
      case _SearchState.InitialState:
        return initialState(this as InitialState);
      case _SearchState.LoadingState:
        return loadingState(this as LoadingState);
      case _SearchState.ErrorState:
        return errorState(this as ErrorState);
      case _SearchState.IdleState:
        return idleState(this as IdleState);
    }
  }

  R whenOrElse<R>(
      {R Function(InitialState) initialState,
      R Function(LoadingState) loadingState,
      R Function(ErrorState) errorState,
      R Function(IdleState) idleState,
      @required R Function(SearchState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _SearchState.InitialState:
        if (initialState == null) break;
        return initialState(this as InitialState);
      case _SearchState.LoadingState:
        if (loadingState == null) break;
        return loadingState(this as LoadingState);
      case _SearchState.ErrorState:
        if (errorState == null) break;
        return errorState(this as ErrorState);
      case _SearchState.IdleState:
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
      @required FutureOr<R> Function(SearchState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _SearchState.InitialState:
        if (initialState == null) break;
        return initialState(this as InitialState);
      case _SearchState.LoadingState:
        if (loadingState == null) break;
        return loadingState(this as LoadingState);
      case _SearchState.ErrorState:
        if (errorState == null) break;
        return errorState(this as ErrorState);
      case _SearchState.IdleState:
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
      case _SearchState.InitialState:
        if (initialState == null) break;
        return initialState(this as InitialState);
      case _SearchState.LoadingState:
        if (loadingState == null) break;
        return loadingState(this as LoadingState);
      case _SearchState.ErrorState:
        if (errorState == null) break;
        return errorState(this as ErrorState);
      case _SearchState.IdleState:
        if (idleState == null) break;
        return idleState(this as IdleState);
    }
  }

  @override
  List get props => const [];
}

@immutable
class InitialState extends SearchState {
  const InitialState._() : super(_SearchState.InitialState);

  factory InitialState() {
    _instance ??= const InitialState._();
    return _instance;
  }

  static InitialState _instance;
}

@immutable
class LoadingState extends SearchState {
  const LoadingState._() : super(_SearchState.LoadingState);

  factory LoadingState() {
    _instance ??= const LoadingState._();
    return _instance;
  }

  static LoadingState _instance;
}

@immutable
class ErrorState extends SearchState {
  const ErrorState._() : super(_SearchState.ErrorState);

  factory ErrorState() {
    _instance ??= const ErrorState._();
    return _instance;
  }

  static ErrorState _instance;
}

@immutable
class IdleState extends SearchState {
  const IdleState({@required this.weather}) : super(_SearchState.IdleState);

  final WeatherModel weather;

  @override
  String toString() => 'IdleState(weather:${this.weather})';
  @override
  List get props => [weather];
}

@immutable
abstract class SearchEvent extends Equatable {
  const SearchEvent(this._type);

  factory SearchEvent.searchCityByName({@required String searchCity}) =
      SearchCityByName;

  factory SearchEvent.resetEvent() = ResetEvent;

  final _SearchEvent _type;

//ignore: missing_return
  R when<R>(
      {@required R Function(SearchCityByName) searchCityByName,
      @required R Function(ResetEvent) resetEvent}) {
    assert(() {
      if (searchCityByName == null || resetEvent == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _SearchEvent.SearchCityByName:
        return searchCityByName(this as SearchCityByName);
      case _SearchEvent.ResetEvent:
        return resetEvent(this as ResetEvent);
    }
  }

//ignore: missing_return
  Future<R> asyncWhen<R>(
      {@required FutureOr<R> Function(SearchCityByName) searchCityByName,
      @required FutureOr<R> Function(ResetEvent) resetEvent}) {
    assert(() {
      if (searchCityByName == null || resetEvent == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _SearchEvent.SearchCityByName:
        return searchCityByName(this as SearchCityByName);
      case _SearchEvent.ResetEvent:
        return resetEvent(this as ResetEvent);
    }
  }

  R whenOrElse<R>(
      {R Function(SearchCityByName) searchCityByName,
      R Function(ResetEvent) resetEvent,
      @required R Function(SearchEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _SearchEvent.SearchCityByName:
        if (searchCityByName == null) break;
        return searchCityByName(this as SearchCityByName);
      case _SearchEvent.ResetEvent:
        if (resetEvent == null) break;
        return resetEvent(this as ResetEvent);
    }
    return orElse(this);
  }

  Future<R> asyncWhenOrElse<R>(
      {FutureOr<R> Function(SearchCityByName) searchCityByName,
      FutureOr<R> Function(ResetEvent) resetEvent,
      @required FutureOr<R> Function(SearchEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _SearchEvent.SearchCityByName:
        if (searchCityByName == null) break;
        return searchCityByName(this as SearchCityByName);
      case _SearchEvent.ResetEvent:
        if (resetEvent == null) break;
        return resetEvent(this as ResetEvent);
    }
    return orElse(this);
  }

//ignore: missing_return
  Future<void> whenPartial(
      {FutureOr<void> Function(SearchCityByName) searchCityByName,
      FutureOr<void> Function(ResetEvent) resetEvent}) {
    assert(() {
      if (searchCityByName == null && resetEvent == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _SearchEvent.SearchCityByName:
        if (searchCityByName == null) break;
        return searchCityByName(this as SearchCityByName);
      case _SearchEvent.ResetEvent:
        if (resetEvent == null) break;
        return resetEvent(this as ResetEvent);
    }
  }

  @override
  List get props => const [];
}

@immutable
class SearchCityByName extends SearchEvent {
  const SearchCityByName({@required this.searchCity})
      : super(_SearchEvent.SearchCityByName);

  final String searchCity;

  @override
  String toString() => 'SearchCityByName(searchCity:${this.searchCity})';
  @override
  List get props => [searchCity];
}

@immutable
class ResetEvent extends SearchEvent {
  const ResetEvent._() : super(_SearchEvent.ResetEvent);

  factory ResetEvent() {
    _instance ??= const ResetEvent._();
    return _instance;
  }

  static ResetEvent _instance;
}
