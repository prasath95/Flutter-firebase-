import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io' show Platform;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter_sam/Screens/Home.dart';
import 'package:flutter_sam/Screens/Register.dart';

import 'Screens/Login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await Firebase.initializeApp(
    name: 'db2',
    options: Platform.isIOS || Platform.isMacOS
        ? FirebaseOptions(
            appId: '1:297855924061:ios:c6de2b69b03a5be8',
            apiKey: 'AIzaSyD_shO5mfO9lhy2TVWhfo1VUmARKlG4suk',
            projectId: 'flutter-firebase-plugins',
            messagingSenderId: '297855924061',
            databaseURL: 'https://flutterfire-cd2f7.firebaseio.com',
          )
        : FirebaseOptions(
            appId: '1:424996282790:android:29df8e39f99126b48faf67',//
            apiKey: 'AIzaSyDVfe8vyss7Lbos-KD6GDOSMpzV-tN3Hxk', //
            messagingSenderId: '424996282790', //
            projectId: 'flutter-task-dd028', //
            databaseURL: 'https://flutter-task-dd028.firebaseio.com', //
          ),
  );
  //runApp(MyHomePage());
 var routes = <String, WidgetBuilder>{
   '/Home': (context) =>  Home(),
    '/Register':(context) => Register(),
    '/Login':(context) =>  Login(),
};


  runApp(MaterialApp(
     debugShowCheckedModeBanner: false,
     title: 'Flutter Task',
     home: Login(),
     routes: routes,
// Showing SplashScreen as the first screen when user launches the app.   
  ));

  
    
  //   MaterialApp(
  //   title: 'Named Routes Demo',
  //   // Start the app with the "/" named route. In this case, the app starts
  //   // on the FirstScreen widget.
  //   initialRoute: '/',
  //   routes: {
  //     // When navigating to the "/" route, build the FirstScreen widget.
  //     '/': (context) => Login(),
  //     // When navigating to the "/second" route, build the SecondScreen widget.
  //     '/Home': (context) =>  Home(),
  //   '/Register':(context) => Register(),
  //   '/Login':(context) =>  Login(),
  //   },
  // )
  
 // );
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//     title: 'Named Routes Demo',
//     // Start the app with the "/" named route. In this case, the app starts
//     // on the FirstScreen widget.
//     initialRoute: '/',
//     routes: {
//       // When navigating to the "/" route, build the FirstScreen widget.
//       '/': (context) => Login(),
//       // When navigating to the "/second" route, build the SecondScreen widget.
//       '/Home': (context) =>  Home(),
//     '/Register':(context) => Register(),
//     '/Login':(context) =>  Login(),
//     },
//   );
//   }
// }

// var routes = <String, WidgetBuilder>{
//   "/auth": (BuildContext context) => AuthScreen(),
//   "/home":(BuildContext context) => HomeScreen(),
// };


// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         theme: ThemeData(
//           primaryColor: Colors.blue
//         ),
//       home: Login(),
//       initialRoute: '/',
//       routes: <String, WidgetBuilder>{
//         '/': (context) => Login(),
//     '/Home': (context) =>  Home(),
//     '/Register':(context) => Register(),
//     '/Login':(context) =>  Login(),
//   },
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         theme: ThemeData(
//           primaryColor: Colors.blue
//         ),
//       home: Login(),
//       routes: <String, WidgetBuilder>{
//     '/Home': (BuildContext context) => new Home(),
//     '/Register':(BuildContext context) => new Register(),
//     '/Login':(BuildContext context) => new Login(),
//   },
//     );
//   }
// }

