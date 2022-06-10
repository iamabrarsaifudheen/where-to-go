import 'package:flutter/material.dart';
import 'package:where_to_go/screens/add_place.dart';
import 'package:where_to_go/screens/place_list.dart';
import 'package:where_to_go/wrapper.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Where To Go',
        theme: ThemeData(
          fontFamily: 'Inter',
          primaryColor: const Color(0xff083554),
        ),
        home: PlaceList());
  }
}
