//import 'dart:html';

import 'package:flutter/material.dart';


import 'package:vendor_app/Screens/addmovie.dart';
import 'dart:ffi';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vendor_app/models/movie.dart';
import 'package:vendor_app/services/store.dart';
import 'package:flutter/rendering.dart';
import 'package:vendor_app/screens/MovieDetails.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../constance.dart';

//import '../constance.dart';

class Home extends StatefulWidget {
  static String routeName= '/Home';

  /*@override
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
}*/
@override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _store = Store();
  int money = 180;
  final int totalmoney = 220;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*  drawer: Drawer(
          child: Container(
           child: RaisedButton(
              onPressed: () {
             //   FirebaseAuth.instance.signOut();
              //  Navigator.of(context)
               //     .pushReplacementNamed(AuthenticationScreen.routeName);
             //  Navigator.pushNamed(context, AddMovie.id);
              },
             child: Text('Add Movies'),

           ),
         ),
        ),*/
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Movie App',
            style: TextStyle(
                fontFamily: 'Reem Kufi',
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
backgroundColor: Colors.red[400],
        /*  flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    color: <Color>[Colors.black, Colors.amber])),
          ),*/
        ),

        body: StreamBuilder<QuerySnapshot>(

          stream: _store.loadMovies(),
          builder:(context , snapshot)
          {
            if(snapshot.hasData){
              List <Movie> movies =[];
              for (var doc in snapshot.data.documents) {
                var data = doc.data();
                movies.add(Movie(
                 documentid :doc.id ,
                  mTitle: data['MovieTitle'],
                  mDescription: data['MovieDescription'],
                  mImage: data['MovieImage'],
                  mTime: data['MovieTime'],
                  mNumberofseats: data['MovieNumberofseats'],
                  c1: data['c1'],
                  c2: data['c2'],
                  c3: data['c3'],
                  c4: data['c4'],
                  c5: data['c5'],
                  c6: data['c6'],
                  c7: data['c7'],
                  c8: data['c8'],
                  c9: data['c9'],
                  c10: data['c10'],
                  c11: data['c11'],
                  c12: data['c12'],
                  c13: data['c13'],
                  c14: data['c14'],
                  c15: data['c15'],
                  c16: data['c16'],
                  c17: data['c17'],
                  c18: data['c18'],
                  c19: data['c19'],
                  c20: data['c20'],
                  c21: data['c21'],
                  c22: data['c22'],
                  c23: data['c23'],
                  c24: data['c24'],
                  c25: data['c25'],
                  c26: data['c26'],
                  c27: data['c27'],
                  c28: data['c28'],
                  c29: data['c29'],
                  c30: data['c30'],
                  c31: data['c31'],
                  c32: data['c32'],
                  c33: data['c33'],
                  c34: data['c34'],
                  c35: data['c35'],
                  c36: data['c36'],
                  c37: data['c37'],
                  c38: data['c38'],
                  c39: data['c39'],
                  c40: data['c40'],
                  c41: data['c41'],
                  c42: data['c42'],
                  c43: data['c43'],
                  c44: data['c44'],
                  c45: data['c45'],
                  c46: data['c46'],
                  c47: data['c47'],
                ));}

              return GridView.builder(
                itemCount: movies.length,
                //   itemCount : 12,
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                //childAspectRatio: .8),
                itemBuilder :(context,index)=> Padding(
                  padding:EdgeInsets.symmetric(horizontal : 30, vertical :30) ,
                  child: Stack(
                    children: <Widget>[
                      
                      Positioned.fill(
                       // child:GestureDetector(

                        //  onTap:(){Navigator.pushNamed(context, MovieDetails.id , arguments: movies[index]);} ,
                        
                      child:RaisedButton(
                      onPressed:(){Navigator.pushNamed(context, MovieDetails.id , arguments: movies[index]);} ,

                            child:Image(
                              fit: BoxFit.fitWidth,
                              image: NetworkImage(movies[index].mImage),
                            )
                        ),
                      ),
                      Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                       RaisedButton(
                        child : Text("Delete"),
                              color: Colors.red[400],
                              textColor: Colors.white,
                              onPressed:(){
                                Scaffold.of(context)
                                              .showSnackBar(SnackBar(backgroundColor: Colors.red[400],
                                            content: Text(
                                                'Sure you want to delete this Movie?!'),
                                            action: SnackBarAction(
                                              label: 'Delete',
                                              textColor: Colors.white,
                                              onPressed: () {
                                               _store.deleteMovie(movies[index].documentid);
                                                // Some code to undo the change.
                                              },
                                            ),
                                          ));
                                //_store.deleteMovie(movies[index].documentid);
                              }
                      ),           
                                  ],
                                ),        
                      Positioned(
                        bottom: 40,
                        child: Opacity(
                          opacity: .6,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(movies[index].mTitle,
                                    style : TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                                //Text(movies[index].mDescription,
                                //   style : TextStyle(fontWeight: FontWeight.bold)
                                // )
                                
                              ],

         // crossAxisAlignment: CrossAxisAlignment.center,

                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                );
            }else{
              return Center(child: Text('Loading....'));
            }
          },

        ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AddMovie()));
    },
    tooltip: 'Increment',
    child: Icon(Icons.add),
    backgroundColor: Colors.red[400],
    ),
    
    );

  }
}