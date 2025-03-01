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
        return windows;
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
    apiKey: 'AIzaSyCiltyYNJ3coHPgy-XiyDH2nyamG2KEZsM',
    appId: '1:1070715038996:web:d48ed2ec83425f88e66601',
    messagingSenderId: '1070715038996',
    projectId: 'myflutter-69908',
    authDomain: 'myflutter-69908.firebaseapp.com',
    storageBucket: 'myflutter-69908.appspot.com',
    measurementId: 'G-BEYX284F83',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCy9ZsccTZo-qo0BJrJtbmIuRZpp9I3Bng',
    appId: '1:1070715038996:android:11325a82d6f5f412e66601',
    messagingSenderId: '1070715038996',
    projectId: 'myflutter-69908',
    storageBucket: 'myflutter-69908.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBew8lY5YsnEk29mHbQk-BuP-jb54ZnoCo',
    appId: '1:1070715038996:ios:d62f4995cb7bcbb4e66601',
    messagingSenderId: '1070715038996',
    projectId: 'myflutter-69908',
    storageBucket: 'myflutter-69908.appspot.com',
    iosBundleId: 'com.example.myapp2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBew8lY5YsnEk29mHbQk-BuP-jb54ZnoCo',
    appId: '1:1070715038996:ios:d62f4995cb7bcbb4e66601',
    messagingSenderId: '1070715038996',
    projectId: 'myflutter-69908',
    storageBucket: 'myflutter-69908.appspot.com',
    iosBundleId: 'com.example.myapp2',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCiltyYNJ3coHPgy-XiyDH2nyamG2KEZsM',
    appId: '1:1070715038996:web:362ab0b23098dbe6e66601',
    messagingSenderId: '1070715038996',
    projectId: 'myflutter-69908',
    authDomain: 'myflutter-69908.firebaseapp.com',
    storageBucket: 'myflutter-69908.appspot.com',
    measurementId: 'G-C11YGC1PB0',
  );
}
