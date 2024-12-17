import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yours_news/features/auth/repository/auth_repository.dart';
import 'auth_repository_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AuthRepository authRepository;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    authRepository = AuthRepository(mockDio);
  });

  test('login success', () async {
    when(mockDio.post(any, data: anyNamed('data')))
        .thenAnswer((_) async => Response(
              data: {'token': 'token'},
              statusCode: 200,
              requestOptions: RequestOptions(path: ''),
            ));

    await authRepository.login('naol@gmail.com', 'naol');

    verify(mockDio.post(
      any,
      data: {'email': 'naol@gmail.com', 'password': 'naol'},
    )).called(1);
  });

  test('login failure', () async {
    when(mockDio.post(any, data: anyNamed('data'))).thenThrow(DioException(
      requestOptions: RequestOptions(path: ''),
      error: 'Unauthorized',
    ));

    expect(
        () async => await authRepository.login('email@email.com', 'password'),
        throwsException);
  });
}
