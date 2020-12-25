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
        'MovieNumberofseats' : movie.mNumberofseats
      }
    );

  }
}