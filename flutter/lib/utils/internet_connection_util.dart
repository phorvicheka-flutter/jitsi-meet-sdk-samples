import 'package:connectivity_plus/connectivity_plus.dart';

abstract class InternetConnectionUtil {
  static Future<bool> isConnected({Connectivity? connectivity}) async {
    final List<ConnectivityResult> connectivityResult =
        await (connectivity ?? Connectivity()).checkConnectivity();

    return !connectivityResult.contains(ConnectivityResult.none);
  }
}
