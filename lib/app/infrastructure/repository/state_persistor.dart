import 'package:async_redux/async_redux.dart';
import 'package:promodoro/app/application/store/states/app_state.dart'
    as defaultApp;
import 'package:promodoro/app/infrastructure/services/app_database.dart';

class AppStatePersistor<AppState> extends Persistor<AppState> {
  AppStatePersistor({
    required this.fromJson,
    required this.toJson,
    this.appStorageKey = 'app-state',
    this.throttleDuration = const Duration(seconds: 2),
  });

  final String appStorageKey;
  final AppState Function(Map<String, dynamic>) fromJson;
  final Duration throttleDuration;

  // Create storage
  final Map<String, dynamic> Function(AppState) toJson;
  final AppDatabase _appDatabase = AppDatabase(
    currentAppState: defaultApp.AppState.initial(),
  );

  @override
  Future<void> deleteState() async {}

  @override
  Future<void> persistDifference({
    required AppState? lastPersistedState,
    required AppState newState,
  }) async {
    final List<String> cols = defaultApp.AppState.initial()
        .toJson()
        .keys
        .map((String s) => s)
        .toList();
    await _appDatabase.init(
      cols,
    );
    _appDatabase.updateData(newState as defaultApp.AppState);

    print('UPDATED STATE: ${await _appDatabase.readData()}');
  }

  @override
  Future<AppState?> readState() async {
    /// check if the state from local storage is empty and
    /// return null, otherwise return the parsed state as an actual object
    /// of type [AppState]
    final List<String> cols = defaultApp.AppState.initial()
        .toJson()
        .keys
        .map((String s) => s)
        .toList();
    await _appDatabase.init(
      cols,
    );
    defaultApp.AppState readState = await _appDatabase.readData();

    return readState as AppState;
  }

  @override
  Future<void> saveInitialState(AppState initialState) async {
    final List<String> cols = (initialState as defaultApp.AppState)
        .toJson()
        .keys
        .map((String s) => s)
        .toList();
    await _appDatabase.init(
      cols,
    );

    _appDatabase.saveData(initialState);

    return persistDifference(lastPersistedState: null, newState: initialState);
  }

  @override
  Duration get throttle => throttleDuration;
}
