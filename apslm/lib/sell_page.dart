import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:apslm/buy_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'home_page.dart';
import 'main.dart';

class sell_page extends StatefulWidget {
  const sell_page({Key? key}) : super(key: key);

  @override
  _sell_pageState createState() => _sell_pageState();
}

class _sell_pageState extends State<sell_page> {

  final type_controller = TextEditingController();
  final price_controller = TextEditingController();
  final moisture_controller = TextEditingController();
  final location_controller = TextEditingController();
  final number_controller = TextEditingController();

  var Imageurl;
  addata(){

    Map<String,dynamic> data = {"type" : type_controller.text,
                                "Moisture" : moisture_controller.text,
                                "Location" : location_controller.text,
                                "price" : price_controller.text,
                                "url" : Imageurl,
                                "contact" : number_controller.text};
    print(data);
    CollectionReference cr = FirebaseFirestore.instance.collection('data');
    cr.add(data);
  }
  @override
  Widget build(BuildContext context) {

    // var Imageurl;

    uploadImage() async {
      final _picker = ImagePicker();

      PickedFile? image;

      // await Permission.photos.request();
      // var ps = await Permission.photos.status;
      // import 'dart:math';

      String generateRandomString(int len) {
        var r = Random();
        const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
        return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
      }
      // if(ps.isGranted){
      image = await _picker.getImage(source: ImageSource.gallery);
      if(image!=null){

        var file = File(image.path);
        String a = generateRandomString(10);
        var snapshot = await FirebaseStorage.instance.ref().child('images/$a').putFile(file);
        var d  = await snapshot.ref.getDownloadURL();
        print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");


        setState(() {
          Imageurl = d;
        });
        print(Imageurl);
        print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");

        // return imgurl;

      }

    }



    return Scaffold(
        appBar: AppBar(
        title: Row(
        children: [
        Text("APSLM"),
        Icon(Icons.agriculture_rounded,size: 50,),
        SizedBox(width: MediaQuery.of(context).size.width-250),
        Icon(Icons.account_circle,size: 35,)
        ],
        ),
        backgroundColor: Colors.lime[600],
        ),
        body: Container(
          margin: const EdgeInsets.only(right: 20,left: 20,top: 30),
          child: Column(
            children: [
              TextField(
                controller: type_controller ,
                decoration: InputDecoration(
                  labelText: 'Type',
                ),
              ),
              TextField(
                controller: moisture_controller ,
                decoration: InputDecoration(
                  labelText: 'Moisture(%)',
                ),
              ),
              TextField(
                controller: location_controller ,
                decoration: InputDecoration(
                  labelText: 'Location',
                ),

              ),
              TextField(
                controller: price_controller ,
                decoration: InputDecoration(
                  labelText: 'Price (INR)',
                ),
              ),
              TextField(
                controller: number_controller ,
                decoration: InputDecoration(
                  labelText: 'Contact No.',
                ),
              ),
              RaisedButton(
                  onPressed: (){
                    uploadImage();
                    // print(Imageurl);
                  },
                  child: Text("Upload Image"),
                  color: Colors.blueAccent,
                  ),

              SizedBox(
                width: MediaQuery.of(context).size.width-20,
                child: RaisedButton(

                  onPressed: (){
                    addata();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const home_page()),
                    );
                  },
                  child: Text("Submit"),
                  color: Colors.blueAccent,
                ),
              ),
              // Image.network(Imageurl),
            ],
          ),
        ),
        );
  }
}

// uploadImage(String imgurl) async {
//   final _picker = ImagePicker();
//
//   PickedFile? image;
//
//   // await Permission.photos.request();
//   // var ps = await Permission.photos.status;
//
//   // if(ps.isGranted){
//   image = await _picker.getImage(source: ImageSource.gallery);
//   if(image!=null){
//
//     var file = File(image.path);
//
//     var snapshot = await FirebaseStorage.instance.ref().child('images/g').putFile(file);
//     imgurl  = await snapshot.ref.getDownloadURL();
//
//
//     // return imgurl;
//
//     }
//
//   }
