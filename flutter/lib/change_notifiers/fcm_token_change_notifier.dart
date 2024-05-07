import '../data/models/save_fcm_token_request/save_fcm_token_request.dart';
import '../data/repositories/fcm_token_repository.dart';
import 'base_change_notifier.dart';

class FcmTokenChangeNotifier extends BaseChangeNotifier {
  final FcmTokenRepository fcmTokenRepository;
  String? _fcmToken;
  String? get fcmToken => _fcmToken;

  bool _isSucceedSaveFcmToken = false;
  bool get isSucceedSaveFcmToken => _isSucceedSaveFcmToken;
  void setIsSucceedSaveFcmToken(bool isSucceed) {
    _isSucceedSaveFcmToken = isSucceed;
    notifyListeners();
  }

  FcmTokenChangeNotifier(this.fcmTokenRepository);

  Future<void> setFcmToken(String? fcmToken) async {
    _fcmToken = fcmToken;
    notifyListeners();
  }

  Future<void> saveFcmToken(
    SaveFcmTokenRequest saveFcmTokenRequest,
  ) async {
    bool isSuccess = await sendApiRequest(
      () async {
        await fcmTokenRepository.saveFcmTokenToServer(saveFcmTokenRequest);
      },
    );
    setIsSucceedSaveFcmToken(isSuccess);
  }
}
