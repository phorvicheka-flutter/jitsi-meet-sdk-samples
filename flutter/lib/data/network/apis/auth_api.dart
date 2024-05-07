import '../../../constants/endpoints.dart';
import '../../models/user_login_request/user_login_request.dart';
import '../../models/user_login_response/user_login_response.dart';
import '../../models/user_register_request/user_register_request.dart';
import '../../models/user_register_response/user_register_response.dart';
import '../dio_client.dart';

class AuthApi {
  // DioClient instance
  final DioClient dioClient;
  // injecting DioClient instance
  AuthApi({
    required this.dioClient,
  });

  Future<UserLoginResponse> login(UserLoginRequest userLoginRequest) async {
    try {
      final responseData = await dioClient.post(
        Endpoints.login,
        data: userLoginRequest.toJson(),
      );
      return UserLoginResponse.fromJson(responseData);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserRegisterResponse> register(
    UserRegisterRequest userRegisterRequest,
  ) async {
    try {
      final responseData = await dioClient.post(
        Endpoints.register,
        data: userRegisterRequest.toJson(),
      );
      return UserRegisterResponse.fromJson(responseData);
    } catch (e) {
      rethrow;
    }
  }
}
