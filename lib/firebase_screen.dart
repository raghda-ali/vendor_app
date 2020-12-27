import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'testscreen.dart';

class Firebase_Messaging extends StatefulWidget {
    @override
    _Firebase_MessagingState createState() => _Firebase_MessagingState();
}
class _Firebase_MessagingState extends State<Firebase_Messaging> {

    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
   
@override
 void initState() {
        getDeviceToken();
        configerCallbacks();
    }
    @override
    Widget build (BuildContext context) {
        return Scaffold(
            body : Container(),
        );
    }
 

 void configerCallbacks ()
    {
        _firebaseMessaging.configure(
            onMessage: (message) async
             {
                print('onMessage: $message');
            },
            onResume: (message) async
            {
                print('onResume: $message');
            },
             onLaunch: (message) async
            {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => TestScreen()
                ));

            }
        );
    }
       void getDeviceToken() async
    {
     String deviceToken= await  _firebaseMessaging.getToken();
     print('DeviceToken : $deviceToken');
    } 

}