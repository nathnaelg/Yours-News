import 'package:hooks_riverpod/hooks_riverpod.dart';


// we will define all the environment variables that we will use in our app here
final appEnvProvider = Provider<String>((ref) => throw UnimplementedError());

extension AppEnvExtension on String {
  String get baseUrl => "https://api.gataama.com";
}
