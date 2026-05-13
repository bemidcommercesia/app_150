import 'package:shared_preferences/shared_preferences.dart';

import 'track_source_ns2kd7py_local_datasource.dart';

class TrackSourcens2kd7pyLocalDatasourceImpl
    implements TrackSourcens2kd7pyLocalDatasource {
  static const _key = 'android_ref';

  const TrackSourcens2kd7pyLocalDatasourceImpl({
    required this.sharedPreferences,
  });

  final SharedPreferences sharedPreferences;

  @override
  Future<bool> save(String data) {
    return sharedPreferences.setString(_key, data);
  }

  @override
  String? load() {
    return sharedPreferences.getString(_key);
  }
}
