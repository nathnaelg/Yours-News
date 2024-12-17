import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';


// we will use this provider to store and retrieve data from local storage
final localStorageProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError(),
);
