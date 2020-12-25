import 'package:flutter/material.dart';
import 'package:vendor_app/Screens/addmovie.dart';

class Home extends StatefulWidget {
  static String id= 'Home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
@override
Widget build (BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.red[200],
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: double.infinity,
        ),
        RaisedButton(
          onPressed:() {
            Navigator.pushNamed(context, AddMovie.id);
          },
          child: Text('Add Movies'),
        ),
         RaisedButton(
          onPressed:() {},
          child: Text('View Booked Seats'),
        ),
          
      ],
    )
  );
}  
}