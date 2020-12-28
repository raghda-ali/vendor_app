import 'package:vendor_app/Screens/view_seats.dart';
import 'package:vendor_app/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/Screens/Home.dart';

class MovieDetails extends StatefulWidget {
  static String id ='MovieDetails';

  @override
  _FilmeDetailsState createState() => _FilmeDetailsState();
}

class _FilmeDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context){
    Movie movie = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body : Stack(
        children: <Widget>[
          Container(
            /* height : MediaQuery.of(context).size.height,*/
            width : MediaQuery.of(context).size.width,
            child :Image(
              fit : BoxFit.fitWidth,
              height: 500,
              image: NetworkImage(movie.mImage),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    Icons.arrow_back_ios,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Column(
              children: <Widget>[
                Opacity(
                  child: Container(
                    color : Colors.white30,
                    /* width : MediaQuery.of(context).size.width,
                   height: MediaQuery.of(context).size.height,*/
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children : <Widget>[
                          Text(
                            movie.mTitle,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height : 10),
                          Text(
                            movie.mDescription,
                            style: TextStyle(
                              fontSize: 15 ,fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height : 10),
                          Text(
                            movie.mTime,
                            style: TextStyle(
                              fontSize: 16 ,fontWeight: FontWeight.w800,
                            ),
                          ),
                          RaisedButton(
                              child : Text("View Seats"),
                              color: Colors.black,
                              textColor: Colors.white,
                              onPressed:(){
                                Navigator.pushNamed(context, BuyTicket.id , arguments: movie);
                              }

                          )
                        ],
                      ),
                    ),
                  ),
                  opacity: .5,
                ),
              ],

            ),
          ),
        ],
      ),
    );

  }
}
