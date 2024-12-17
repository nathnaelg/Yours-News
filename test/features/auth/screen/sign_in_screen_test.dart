import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yours_news/features/auth/provider/auth_provider.dart';
import 'package:yours_news/features/auth/screen/signin_screen.dart';

import 'sign_in_screen_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AuthNotifier>()])
void main() {
  late MockAuthNotifier mockAuthNotifier;

  setUp(() {
    mockAuthNotifier = MockAuthNotifier();
  });

  Widget createSignInScreen() {
    return ProviderScope(
      overrides: [
        authProvider.overrideWith((ref) => mockAuthNotifier),
      ],
      child: const MaterialApp(
        home: SignIn(),
      ),
    );
  }

  testWidgets('Sign in button shows loading and triggers login',
      (WidgetTester tester) async {
    when(mockAuthNotifier.state)
        .thenReturn(AuthState(isAuthenticated: false, isLoading: false));

    await tester.pumpWidget(createSignInScreen());

    final emailField = find.byType(TextField).first;
    final passwordField = find.byType(TextField).last;
    final signInButton = find.byType(ElevatedButton);

    await tester.enterText(emailField, 'naol@gmail.com');
    await tester.enterText(passwordField, 'naol');
    await tester.tap(signInButton);

    verify(mockAuthNotifier.login('naol@gmail.com', 'naol')).called(1);
  });
}
