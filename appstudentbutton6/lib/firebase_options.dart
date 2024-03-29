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
    apiKey: 'AIzaSyBLBGKq8vhfso7zudALwlkFeQCWDVEWYw8',
    appId: '1:388569274967:android:601b60fb0573eb917e6112',
    messagingSenderId: '388569274967',
    projectId: 'botonestudiantil',
    databaseURL: 'https://botonestudiantil-default-rtdb.firebaseio.com',
    storageBucket: 'botonestudiantil.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA3dD6NO4lejckIKf2d_cNoX3w0Sf-Ofl8',
    appId: '1:388569274967:ios:e4d7aa337f9f1d7d7e6112',
    messagingSenderId: '388569274967',
    projectId: 'botonestudiantil',
    databaseURL: 'https://botonestudiantil-default-rtdb.firebaseio.com',
    storageBucket: 'botonestudiantil.appspot.com',
    iosClientId: '388569274967-0lcl2500er6ci31aqoeq71nbmp70lp6i.apps.googleusercontent.com',
    iosBundleId: 'com.StudentButton.appstudentbutton6',
  );
}
