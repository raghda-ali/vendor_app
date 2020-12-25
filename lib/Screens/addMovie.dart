
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vendor_app/services/store.dart';
import 'package:vendor_app/models/movie.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
class AddMovie extends StatefulWidget {
  static String id= 'AddMovie';

  @override
  _AddMovieState createState() => _AddMovieState();
}
TextEditingController timeCtl = TextEditingController();
class _AddMovieState extends State<AddMovie> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final _store = Store();
  File _image;   
  
    String _title,_description,_photo,_time;
    int _numberofseats;
  Future getImageFromCam() async{
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });

  }

  Future getImageFromGallery() async{
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

Future uploadImage() async {    
  Reference storageReference = FirebaseStorage.instance.ref().child('Uploads/image4');        
  UploadTask uploadTask = storageReference.putFile(_image);   
   var  imageUrl= await (await uploadTask).ref.getDownloadURL();
 }  
@override
Widget build(BuildContext context){
  return Scaffold(
  backgroundColor: Colors.green[50],
  body: Form(
    key: _globalKey,
    child:Padding(padding : EdgeInsets.only(top:50 , right:20 , left :20),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(child:
          Container(
          width:MediaQuery.of(context).size.width ,
          height: 100,
          child: Center(
            child: _image == null ? Text('No selected images') :Image.file(_image),
          ),
        ),
        ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FloatingActionButton(
            heroTag: null,
            backgroundColor: Colors.red[300],
            mini: true,
            onPressed: getImageFromCam,
            child: Icon(Icons.add_a_photo),
            ),
             FloatingActionButton(
               heroTag: null,
               backgroundColor: Colors.red[300],
               mini: true,
               onPressed: getImageFromGallery,
               child: Icon(Icons.wallpaper),
            ),
        ],
      ),
      
        Padding(
          padding: EdgeInsets.only(top: 25.0),
         ),
      TextFormField(
        style: TextStyle(color : Colors.black),
                  decoration: InputDecoration(
                    labelText:"Movie Title",
                    border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color:Colors.blue,width: 1),
                      ), 
                      disabledBorder: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.blue)
                         ),
                  ),
                  onSaved: (value)
                  {
                   _title = value;
                  },
      ),
     Padding(
          padding: EdgeInsets.only(top: 10.0),
         ),
       TextFormField(
        style: TextStyle(color : Colors.black),
                  decoration: InputDecoration(
                    labelText:"Movie Description",
                    border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color:Colors.blue,width: 1),
                      ), 
                      disabledBorder: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.blue)
                         ),
                  ),
                  onSaved: (value)
                  {
                    _description =value;
                  },
      ),
       Padding(
          padding: EdgeInsets.only(top: 10.0),
         ),
         TextFormField(
        style: TextStyle(color : Colors.black),
                  decoration: InputDecoration(
                    labelText:"ImageUrl",
                    border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color:Colors.blue,width: 1),
                      ), 
                      disabledBorder: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.blue)
                         ),
                  ),
                  onSaved: (value)
                  {
                   _photo=value;
                  },
      ),
       Padding(
          padding: EdgeInsets.only(top: 10.0),
         ),
       TextFormField(
        style: TextStyle(color : Colors.black),
          controller: timeCtl,  // add this line.
                  decoration: InputDecoration(
                    labelText:"Movie Time",
                    border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color:Colors.blue,width: 1),
                      ), 
                      disabledBorder: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.blue)
                         ),
                  ),
                   onSaved: (value)
                  {
                   _time=value;
                  },
                ),
                  
       Padding(
          padding: EdgeInsets.only(top: 10.0),
         ),
       TextFormField(
        style: TextStyle(color : Colors.black),
                  decoration: InputDecoration(
                    labelText:"Number of seats",
                    border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color:Colors.blue,width: 1),
                      ), 
                      disabledBorder: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.blue)
                         ),
                  ),
                  onSaved: (value)
                  {
                    _numberofseats = int.parse(value) ;
                  },
      ),
 Padding(
          padding: EdgeInsets.only(top: 10.0),
         ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 RaisedButton(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  color: Colors.white60,
                    onPressed: (){
                      if(_globalKey.currentState.validate())
                      {
                        _globalKey.currentState.save();
                        _store.addMovie(Movie(
                           mTitle : _title,
                          mDescription : _description,
                          mImage : _photo,
                          mTime : _time,
                          mNumberofseats : _numberofseats
                        ));
                      }
                    },  
                    child: Text('Add Movie'),      
                   ),
               
             
             SizedBox(width: 8),
             RaisedButton(
               color: Colors.white60,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
              onPressed: (){
                uploadImage();
              },
              child: Text('Upload Image'),
             ),
               ],
             ),
      
      ],
    ),
  ),
  ),
  );
}
}

  