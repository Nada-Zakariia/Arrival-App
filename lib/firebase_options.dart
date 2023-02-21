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
    apiKey: 'AIzaSyA2L2fGbUskspXv3_xX-Au-LnTGZUrWLBY',
    appId: '1:786503475372:web:c5d47a786a05b18b4a7f09',
    messagingSenderId: '786503475372',
    projectId: 'graduation23-a5179',
    authDomain: 'graduation23-a5179.firebaseapp.com',
    storageBucket: 'graduation23-a5179.appspot.com',
    measurementId: 'G-3ZPS5ZZJJD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAZfaj-jAtILXnDYwcuitmeddw4KpZHlas',
    appId: '1:786503475372:android:700ea2cb4ad0e4be4a7f09',
    messagingSenderId: '786503475372',
    projectId: 'graduation23-a5179',
    storageBucket: 'graduation23-a5179.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCYoTP_ij21IbkJ8T2p4UVtQ1L8wbQndX4',
    appId: '1:786503475372:ios:90e2729f2f413ac54a7f09',
    messagingSenderId: '786503475372',
    projectId: 'graduation23-a5179',
    storageBucket: 'graduation23-a5179.appspot.com',
    androidClientId: '786503475372-m9c7n25scrpqr7tmqclt1k4ucbfmhod2.apps.googleusercontent.com',
    iosClientId: '786503475372-nchq5ilkklr9a7o99a8uuoeqhrc281f4.apps.googleusercontent.com',
    iosBundleId: 'com.example.graduationProjectApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCYoTP_ij21IbkJ8T2p4UVtQ1L8wbQndX4',
    appId: '1:786503475372:ios:90e2729f2f413ac54a7f09',
    messagingSenderId: '786503475372',
    projectId: 'graduation23-a5179',
    storageBucket: 'graduation23-a5179.appspot.com',
    androidClientId: '786503475372-m9c7n25scrpqr7tmqclt1k4ucbfmhod2.apps.googleusercontent.com',
    iosClientId: '786503475372-nchq5ilkklr9a7o99a8uuoeqhrc281f4.apps.googleusercontent.com',
    iosBundleId: 'com.example.graduationProjectApp',
  );
}
