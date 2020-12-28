import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vendor_app/models/movie.dart';

class Store 
{
  // ignore: deprecated_member_use
  final FirebaseFirestore _firestore = Firestore.instance;
  addMovie(Movie movie)
  {
    _firestore.collection('Movies').add(
      {
        'MovieTitle' :movie.mTitle,
        'MovieDescription' : movie.mDescription,
        'MovieImage' : movie.mImage,
        'MovieTime' :movie.mTime,
        'c1' : movie.c1,
        'c2' : movie.c2,
        'c3' : movie.c3,
        'c4' : movie.c4,
        'c5' : movie.c5,
        'c6' : movie.c6,
        'c7' : movie.c7,
        'c8' : movie.c8,
        'c9' : movie.c9,
        'c10' : movie.c10,
        'c11' : movie.c11,
        'c12' : movie.c12,
        'c13' : movie.c13,
        'c14' : movie.c14,
        'c15' : movie.c15,
        'c16' : movie.c16,
        'c17' : movie.c17,
        'c18' : movie.c18,
        'c19' : movie.c19,
        'c20' : movie.c20,
        'c21' : movie.c21,
        'c22' : movie.c22,
        'c23' : movie.c23,
        'c24' : movie.c24,
        'c25' : movie.c25,
        'c26' : movie.c26,
        'c27' : movie.c27,
        'c28' : movie.c28,
        'c29' : movie.c29,
        'c30' : movie.c30,
        'c31' : movie.c31,
        'c32' : movie.c32,
        'c33' : movie.c33,
        'c34' : movie.c34,
        'c35' : movie.c35,
        'c36' : movie.c36,
        'c37' : movie.c37,
        'c38' : movie.c38,
        'c39' : movie.c39,
        'c40' : movie.c40,
        'c41' : movie.c41,
        'c42' : movie.c42,
        'c43' : movie.c43,
        'c44' : movie.c44,
        'c45' : movie.c45,
        'c46' : movie.c46,
        'c47' : movie.c47,
      }
    );

  }
}