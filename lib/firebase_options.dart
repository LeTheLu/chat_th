// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCQJ6Vno_zDlMR6xWkDOt5DVUZ-h6hqmzg',
    appId: '1:955701865851:web:03ea96ea8d0e5289ce61de',
    messagingSenderId: '955701865851',
    projectId: 'appchatth-61c35',
    authDomain: 'appchatth-61c35.firebaseapp.com',
    storageBucket: 'appchatth-61c35.appspot.com',
    measurementId: 'G-J5ZLCEXGKP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBWveko-xSGAEFTQd8_oVYIbmw6IkPwOIM',
    appId: '1:955701865851:android:9cdc778567b313bdce61de',
    messagingSenderId: '955701865851',
    projectId: 'appchatth-61c35',
    storageBucket: 'appchatth-61c35.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyApRRALZQZ2OgSTM2W_BKQBhgU4qU7LPHo',
    appId: '1:955701865851:ios:5096dda8689d2f28ce61de',
    messagingSenderId: '955701865851',
    projectId: 'appchatth-61c35',
    storageBucket: 'appchatth-61c35.appspot.com',
    iosClientId: '955701865851-09v1dfvcsdm576alknbk2hell6jfidc2.apps.googleusercontent.com',
    iosBundleId: 'com.example.appChatTh',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyApRRALZQZ2OgSTM2W_BKQBhgU4qU7LPHo',
    appId: '1:955701865851:ios:5096dda8689d2f28ce61de',
    messagingSenderId: '955701865851',
    projectId: 'appchatth-61c35',
    storageBucket: 'appchatth-61c35.appspot.com',
    iosClientId: '955701865851-09v1dfvcsdm576alknbk2hell6jfidc2.apps.googleusercontent.com',
    iosBundleId: 'com.example.appChatTh',
  );
}
