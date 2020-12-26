
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
    bool _c1= false ,_c2= false ,_c3= false, _c4= false, _c5= false, _c6=false, _c7=false, _c8=false, _c9=false, _c10=false, _c11=false, _c12=false, _c13=false, _c14=false, _c15=false, _c16=false, _c17=false, _c18 =false, _c19=false  , _c20=false, 
    _c21=false, _c22=false, _c23=false, _c24=false, _c25=false, _c26=false, _c27=false, _c28=false, _c29=false, _c30=false, _c31=false, _c32=false, _c33=false, _c34=false, _c35=false, _c36=false, _c37=false, _c38=false, _c39=false, _c40=false,
    _c41=false , _c42=false, _c43=false, _c44=false, _c45=false, _c46=false, _c47=false ;
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
  Reference storageReference = FirebaseStorage.instance.ref().child('Images/image1');        
  UploadTask uploadTask = storageReference.putFile(_image);   
   var  imageUrl= await (await uploadTask).ref.getDownloadURL();
   print(imageUrl);
   _photo = imageUrl;
   print(_photo);
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
                          c1: _c1 ,
                          c2: _c2,
                          c3: _c3,
                          c4 : _c4,
                          c5 : _c5,
                          c6 : _c6,
                          c7 : _c7 ,
                          c8 : _c8,
                          c9 : _c9,
                          c10 : _c10,
                          c11 : _c11,
                          c12 : _c12,
                          c13 : _c13,
                          c14 : _c14,
                          c15 : _c15,
                          c16 : _c16,
                          c17 : _c17,
                          c18 : _c18,
                          c19:  _c19,
                          c20:  _c20,
                          c21:  _c21,
                          c22 : _c22,
                          c23 : _c23,
                          c24 : _c24,
                          c25 : _c25,
                          c26 : _c26,
                          c27 : _c27,
                          c28 : _c28,
                          c29 : _c29,
                          c30 : _c30,
                          c31 : _c31,
                          c32 : _c32,
                          c33 : _c33,
                          c34 : _c34,
                          c35 : _c35,
                          c36 : _c36,
                          c37:  _c37,
                          c38 : _c38,
                          c39 : _c39,
                          c40 : _c40,
                          c41 : _c41,
                          c42 : _c42,
                          c43 : _c43,
                          c44 : _c44,
                          c45 : _c45,
                          c46 : _c46,
                          c47 : _c47,
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

  