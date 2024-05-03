// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCMuCG5rdRpdRTa-pJQaibijsuJF7apTuo',
    appId: '1:930888783605:android:b3d2720e659e8e112217bc',
    messagingSenderId: '930888783605',
    projectId: 'h-project-2b3c9',
    storageBucket: 'h-project-2b3c9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAhN9kS6gGCJEazO9sMYzDN3zltzlUNA4s',
    appId: '1:930888783605:ios:126f0d2b90e6f71c2217bc',
    messagingSenderId: '930888783605',
    projectId: 'h-project-2b3c9',
    storageBucket: 'h-project-2b3c9.appspot.com',
    androidClientId: '930888783605-65dd129fdlcp100r5f1i5aa5q8nmslis.apps.googleusercontent.com',
    iosClientId: '930888783605-qlkq0iifjmr3brunpsv7r1jrao8q3kn8.apps.googleusercontent.com',
    iosBundleId: 'com.example.sampleApp',
  );
}
