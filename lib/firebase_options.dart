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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCnWPBWSc0KjjuFJw0aGHmV8_C_PrDxCG0',
    appId: '1:267280604190:web:e48b74bec319c1c6faa20f',
    messagingSenderId: '267280604190',
    projectId: 'todoapp-b0558',
    authDomain: 'todoapp-b0558.firebaseapp.com',
    storageBucket: 'todoapp-b0558.appspot.com',
    measurementId: 'G-N6J71GXRBB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBFXBnh7ceBYWAEdXrHWKtIR_xbxjYI_20',
    appId: '1:267280604190:android:a2fcd0f2513120f4faa20f',
    messagingSenderId: '267280604190',
    projectId: 'todoapp-b0558',
    storageBucket: 'todoapp-b0558.appspot.com',
  );
}
