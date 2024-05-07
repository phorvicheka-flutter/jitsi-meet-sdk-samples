import '../data/models/user/user.dart';
import '../data/models/user_login_request/user_login_request.dart';
import '../data/models/user_login_response/user_login_response.dart';
import '../data/models/user_login_response/user_login_response_user.dart';
import '../data/models/user_register_request/user_register_request.dart';
import '../data/repositories/auth_repository.dart';
import 'base_change_notifier.dart';

class AuthChangeNotifier extends BaseChangeNotifier {
  // AuthRepository instance
  final AuthRepository authRepository;
  // injecting AuthRepository instance
  AuthChangeNotifier({
    required this.authRepository,
  });

  User? get user {
    return authRepository.user;
  }

  bool get isLoggedIn {
    return authRepository.isLoggedIn;
  }

  Future<void> login(String userId, String password) async {
    // sendApiRequest will call notifyListeners()
    await sendApiRequest(
      () async {
        // Send login request to server
        UserLoginResponse userLoginResponse = await authRepository
            .login(UserLoginRequest(userId: userId, password: password));
        final userLoginResponseData = userLoginResponse.data;

        // If success login request, update and save userId and token
        await authRepository.saveUserAndAuthToken(
          userLoginResponseData.user.toUser(),
          userLoginResponseData.token,
        );
      },
    );
  }

  Future<bool> register(UserRegisterRequest userRegisterRequest) async {
    // sendApiRequest will call notifyListeners()
    bool isSuccess = await sendApiRequest(
      () async {
        // Send register request to server
        await authRepository.register(userRegisterRequest);
      },
    );
    return isSuccess;
  }

  Future<void> logout() async {
    await authRepository.logout();
    notifyListeners();
  }
}
