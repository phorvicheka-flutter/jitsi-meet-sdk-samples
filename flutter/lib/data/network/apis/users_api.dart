import '../../../constants/endpoints.dart';
import '../../models/get_users_response/get_users_response.dart';
import '../dio_client.dart';

class UsersApi {
  // DioClient instance
  final DioClient dioClient;
  // injecting DioClient instance
  UsersApi({
    required this.dioClient,
  });

  Future<GetUsersResponse> getUsers() async {
    try {
      final responseData = await dioClient.get(Endpoints.users);
      return GetUsersResponse.fromJson(responseData);
    } catch (e) {
      rethrow;
    }
  }
}
