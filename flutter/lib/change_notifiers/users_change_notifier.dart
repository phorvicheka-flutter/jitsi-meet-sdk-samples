import 'package:logger/logger.dart';

import '../data/models/get_users_response/get_users_response.dart';
import '../data/models/get_users_response/get_users_response_data_user.dart';
import '../data/repositories/users_repository.dart';
import 'base_change_notifier.dart';

class UsersChangeNotifier extends BaseChangeNotifier {
  // AuthRepository instance
  final UsersRepository usersRepository;
  // injecting AuthRepository instance
  UsersChangeNotifier(
    this.usersRepository,
  );

  List<GetUsersResponseDataUser> _userList = [];
  List<GetUsersResponseDataUser> get userList => _userList;

  Future<void> getUsers() async {
    await sendApiRequest(
      () async {
        // Send login request to server
        GetUsersResponse getUsersResponse = await usersRepository.getUsers();
        Logger().d(getUsersResponse.toJson());
        _userList = getUsersResponse.data;
      },
    );
  }
}
