import 'package:fashion_app/screens/details.dart';
import 'package:fashion_app/screens/page_viewer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme:
              const AppBarTheme(iconTheme: IconThemeData(color: Colors.black))),
      debugShowCheckedModeBanner: false,
      home: const PageViewScreen(),
      routes: {
        Details.detailsPageRoute: (context) => const Details(),
      },
    );
  }
}
