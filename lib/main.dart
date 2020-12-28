import 'package:flutter/material.dart';
import 'package:vendor_app/Screens/MovieDetails.dart';
import 'package:vendor_app/Screens/view_seats.dart';
import 'Screens/addmovie.dart';
import 'Screens/Home.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Home(),
    routes: {
      AddMovie.id : (context)=>AddMovie(),
      MovieDetails.id:(context)=>MovieDetails(),
      BuyTicket.id:(context)=>BuyTicket(),
    },
    );
  }
}    

     