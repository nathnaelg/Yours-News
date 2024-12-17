import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yours_news/features/auth/provider/auth_provider.dart';
import 'package:yours_news/features/auth/repository/auth_repository.dart';

import 'auth_provider_test.mocks.dart';


@GenerateMocks([AuthRepository])
void main() {
  late AuthNotifier authNotifier;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    authNotifier = AuthNotifier(mockAuthRepository);
  });

  test('login success', () async {
    // Mocking a successful login
    when(mockAuthRepository.login(any, any))
        .thenAnswer((_) async => Future.value());

    await authNotifier.login('naol@gmail.com', 'naol');

    expect(authNotifier.state.isAuthenticated, true);
    expect(authNotifier.state.isLoading, false);
  });

  test('login failure', () async {
    // Mocking a failed login
    when(mockAuthRepository.login(any, any))
        .thenThrow(Exception('Login failed'));

    await authNotifier.login('email@test.com', 'password');

    expect(authNotifier.state.isAuthenticated, false);
    expect(authNotifier.state.isLoading, false);
  });
}
