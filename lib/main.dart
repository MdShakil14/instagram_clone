import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/colors.dart';
import '../responsive/responsive.dart';
import '../screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBRH9R18ku1dC4dTJeEDaGCEDJnJ-I91D8",
          appId: "1:180816234967:web:3caa8d0cc793fa21bbe392",
          messagingSenderId: "180816234967",
          projectId: "instagram-clone-db5cf",
          storageBucket: "instagram-clone-db5cf.appspot.com"),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // home: const ResponsiveLayout(
      //   mobileScreenLayout: MobileScreenLayout(),
      //   webScreenLayout: WebScreenLayout(),
      // ),
      home: SignUpScreen(),
    );
  }
}
