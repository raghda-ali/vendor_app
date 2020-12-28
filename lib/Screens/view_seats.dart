import 'package:vendor_app/models/movie.dart';
import 'package:vendor_app/services/store.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/widget/cinema_seats.dart';
import 'package:vendor_app/services/store.dart';
import '../constance.dart';
import 'package:vendor_app/screens/Home.dart';

class BuyTicket extends StatelessWidget {
  final GlobalKey<FormState> _globalkey = GlobalKey<FormState>();
  final _store = Store();
  static String id ='BuyTicket';

 // var title;

 // BuyTicket(this.title);
  @override
  Widget build(BuildContext context) {
    Movie movie = ModalRoute.of(context).settings.arguments;
    return Scaffold(

      backgroundColor: kBackgroundColor,
      body: Form(
        key: _globalkey,
        child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:15.0 , left:15.0),
              child: Row(
                children: <Widget>[
                  Container(

                    width: MediaQuery.of(context).size.width * .12,
                    height: MediaQuery.of(context).size.width * .12,
                    decoration: kRoundedFadedBorder,
                    child: IconButton(
                        icon: Icon(
                          Icons.keyboard_arrow_left,
                          size: 28.0,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                 /* SizedBox(
                    width: MediaQuery.of(context).size.width * .75,
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),*/
                ],
              ),
            ),
            Container(

              margin: EdgeInsets.symmetric(vertical: 10.0),
              width: MediaQuery.of(context).size.width * .9,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  topLeft: Radius.circular(25.0),
                ),
              ),
              /*child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      CalendarDay(
                        dayNumber: '9',
                        dayAbbreviation: 'TH',
                      ),
                      CalendarDay(
                        dayNumber: '10',
                        dayAbbreviation: 'FR',
                      ),
                      CalendarDay(
                        dayNumber: '11',
                        dayAbbreviation: 'SA',
                      ),
                      CalendarDay(
                        dayNumber: '12',
                        dayAbbreviation: 'SU',
                        isActive: true,
                      ),
                      CalendarDay(
                        dayNumber: '13',
                        dayAbbreviation: 'MO',
                      ),
                    ],
                  ),
                ),
              ),*/
            ),
           /* SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  ShowTime(
                    time: '11:00',
                    price: 5,
                    isActive: false,
                  ),
                  ShowTime(
                    time: '12:30',
                    price: 10,
                    isActive: true,
                  ),
                  ShowTime(
                    time: '12:30',
                    price: 10,
                    isActive: false,
                  ),
                  ShowTime(
                    time: '12:30',
                    price: 10,
                    isActive: false,
                  ),
                  ShowTime(
                    time: '12:30',
                    price: 10,
                    isActive: false,
                  ),
                ],
              ),
            ),*/
            Padding( 
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.tv,
                    color: kPimaryColor,
                    size: 25.0,
                  ),
                  SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Cinema Seats', style: kMainTextStyle),
                     // Text('panthapath , 1205 Dhaka, Bangladesh',
                        //  style:
                          //    TextStyle(color: Colors.white30, fontSize: 18.0)),
                      SizedBox(height: 10.0),
                      Row(
                        children: <Widget>[
                          Text('2D', style: kMainTextStyle),
                          SizedBox(width: 10.0),
                          // Text('3D',
                              //style: TextStyle(
                                 // color: Colors.white30,
                                //  fontSize: 18.0,
                              //    fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  ),
                  SizedBox(width: 20.0),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: 30.0,
                    color: Colors.white38,
                  )
                ],
              ),
            ),
            Center(child: Image.asset('assets/images/screen.png')),
            Padding(
              padding: EdgeInsets.all(0),
              child: Column(
                children: <Widget>[
                  // First Seat Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20),
                      ),
                      CienmaSeat(
                        isReserved: movie.c1 ,
                        isSelected: false,
                        val: 'c1',
                      ),
                      CienmaSeat(
                        isReserved: movie.c2 ,
                        isSelected: false,
                        val: 'c2',),
                      CienmaSeat(
                        isReserved: movie.c3 ,
                        isSelected: false,
                        val: 'c3',
                      ),
                      CienmaSeat(
                        isReserved: movie.c4 ,
                        isSelected: false,
                        val: 'c4',
                      ),

                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(
                        isReserved: movie.c5 ,
                        isSelected: false,
                        val: 'c5',
                      ),
                      CienmaSeat(
                        isReserved: movie.c6 ,
                        isSelected: false,
                        val: 'c6',
                      ),
                      CienmaSeat(
                        isReserved: movie.c7 ,
                        isSelected: false,
                        val: 'c7',
                      ),
                      CienmaSeat(
                          isReserved: movie.c8 ,
                          isSelected: false,
                          val:'8'),
                      CienmaSeat(
                          isReserved: movie.c9,
                          isSelected: false,
                          val:'9'),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20),
                      ),
                    ],
                  ),
                  // Second Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CienmaSeat(
                          isReserved: movie.c10 ,
                          isSelected: false,
                          val:'10'),
                      CienmaSeat(
                          isReserved: movie.c11 ,
                          isSelected: false,
                          val:'11'),
                      CienmaSeat(
                          isReserved: movie.c12 ,
                          isSelected: false,
                          val:'12'),
                      CienmaSeat(
                          isReserved: movie.c13 ,
                          isSelected: false,
                          val:'13'),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(
                          isReserved: movie.c14 ,
                          isSelected: false,
                          val:'14'),
                      CienmaSeat(
                          isReserved: movie.c15 ,
                          isSelected: false,
                          val:'15'),
                      CienmaSeat(
                          isReserved: movie.c16,
                          isSelected: false,
                          val:'16'),
                      CienmaSeat(
                          isReserved: movie.c17,
                          isSelected: false,
                          val:'17'),
                      CienmaSeat(
                          isReserved: movie.c18,
                          isSelected: false,
                          val:'18'),
                    ],
                  ),
                  // Third  Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CienmaSeat(
                          isReserved: movie.c19 ,
                          isSelected: false,
                          val:'19'),
                      CienmaSeat(
                          isReserved: movie.c20 ,
                          isSelected: false,
                          val:'20'),
                      CienmaSeat(
                          isReserved: movie.c21,
                          isSelected: false,
                          val:'21'),
                      CienmaSeat(
                          isReserved: movie.c22,
                          isSelected: false,
                          val:'22'),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(
                          isReserved: movie.c23,
                          isSelected: false,
                          val:'23'),
                      CienmaSeat(
                          isReserved: movie.c24,
                          isSelected: false,
                          val:'24'  ),
                      CienmaSeat(
                          isReserved: movie.c25,
                          isSelected: false,
                          val:'25'),
                      CienmaSeat(
                          isReserved: movie.c26,
                          isSelected: false,
                          val:'26'),
                      CienmaSeat(
                          isReserved: movie.c27,
                          isSelected: false,
                          val:'27'),

                    ],
                  ),
                  // 4TH Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CienmaSeat(
                          isReserved: movie.c28,
                          isSelected: false,
                          val:'28'),
                      CienmaSeat(
                          isReserved: movie.c29,
                          isSelected: false,
                          val:'29'),
                      CienmaSeat(
                          isReserved: movie.c30,
                          isSelected: false,
                          val:'30'),
                      CienmaSeat(
                          isReserved: movie.c31,
                          isSelected: false,
                          val:'31'),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(
                          isReserved: movie.c32,
                          isSelected: false,
                          val:'32'),
                      CienmaSeat(
                          isReserved: movie.c33,
                          isSelected: false,
                          val:'33'),
                      CienmaSeat(
                          isReserved: movie.c34,
                          isSelected: false,
                          val:'34'),
                      CienmaSeat(
                          isReserved: movie.c35,
                          isSelected: false,
                          val:'35'),
                      CienmaSeat(
                          isReserved: movie.c36,
                          isSelected: false,
                          val:'36'),

                    ],
                  ),
                  // 5TH Row
                 
                  // 6TH Row
                  // final Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20),
                      ),
                      CienmaSeat(
                          isReserved: movie.c37,
                          isSelected: false,
                          val:'37'),
                      CienmaSeat(
                          isReserved: movie.c38,
                          isSelected: false,
                          val:'38'),
                      CienmaSeat(
                          isReserved: movie.c39,
                          isSelected: false,
                          val:'39'),
                      CienmaSeat(
                          isReserved: movie.c40,
                          isSelected: false,
                          val:'40'),
                      CienmaSeat(
                          isReserved: movie.c41,
                          isSelected: false,
                          val:'41'),

                      SizedBox(
                      ),
                      CienmaSeat(
                          isReserved: movie.c44,
                          isSelected: false,
                          val:'42'),
                      CienmaSeat(
                          isReserved: movie.c43,
                          isSelected: false,
                          val:'43'),
                      CienmaSeat(
                          isReserved: movie.c44,
                          isSelected: false,
                          val:'44'),
                      CienmaSeat(
                          isReserved: movie.c45,
                          isSelected: false,
                          val:'45'),
                      CienmaSeat(
                          isReserved: movie.c46,
                          isSelected: false,
                          val:'46'),
                      CienmaSeat(
                          isReserved: movie.c47,
                          isSelected: false,
                          val:'47'),

                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
 ],
        ),
      ),
      ),
    );
  }
}