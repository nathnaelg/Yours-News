import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../repository/auth_repository.dart';


// we will define the state of our auth feature here
// this state will have two properties isAuthenticated and isLoading
// isAuthenticated will be used to check if the user is authenticated or not
// isLoading will be used to check if the login request is in progress or not

class AuthState {
  final bool isAuthenticated;
  final bool isLoading;

  AuthState({
    required this.isAuthenticated,
    this.isLoading = false,
  });

  AuthState copyWith({
    bool? isAuthenticated,
    bool? isLoading,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;

  AuthNotifier(this._authRepository) : super(AuthState(isAuthenticated: false));

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true);
    try {
      await _authRepository.login(email, password);
      state = state.copyWith(isAuthenticated: true);
    } catch (e) {
      state = state.copyWith(isAuthenticated: false);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) {
    final authRepository = ref.read(authRepositoryProvider);
    return AuthNotifier(authRepository);
  },
);

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepository(Dio()), 
);
