import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:itelecexam2/loginpage.dart';
import 'studentpage.dart';
import 'landingpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

//com.example.itelecexam2
// SHA1: A2:28:75:0F:E6:C1:40:4A:8F:B1:32:AC:E1:26:E2:E4:E7:8F:60:69
//SHA256: C9:81:BC:1C:1E:10:B6:B8:44:ED:4D:3A:88:EC:4D:9B:CB:9D:72:D9:88:BB:4A:27:BC:97:E0:3A:C3:C0:DA:C0
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: studentPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
