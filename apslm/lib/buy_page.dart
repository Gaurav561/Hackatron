// import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';

class buy_page extends StatefulWidget {
  const buy_page({Key? key}) : super(key: key);

  @override
  _buy_pageState createState() => _buy_pageState();
}

class _buy_pageState extends State<buy_page> {

Future getdata() async {
  List items = [];
  final CollectionReference data = FirebaseFirestore.instance.collection('data');

  await data.get().then((querySnapshot){
    querySnapshot.docs.forEach((element){
      items.add(element.data);
    });
  });
  return items;
}



@override
  Widget build(BuildContext context) {






    List itemlist = [];
    List l = [];
    Future<List> gd() async{
      List itemlist1 = [];
      await FirebaseFirestore.instance.collection("data").get().then((querySnapshot) {
        querySnapshot.docs.forEach((result) {
          // setState(() {
          itemlist1.add(result.data().values);
          // });

          print(result.data().values);
        });
      });
      return itemlist1;
    }

    // dynamic itemlist = gd();
    // // l = itemlist;
    // print("______________------------------------_______________________---------------");
    // print(itemlist.length);
    // print("______________------------------------_______________________---------------");
/////////////////////////////////////////////////////////////////////////////////////////////
    void get_data() async{
      dynamic items = await getdata();
      setState(() {
        itemlist = items;
      });
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      print(itemlist[0]['price']);
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    }
//////////////////////////////////////////////////////////////////////////////////////////////

    // final Stream<QuerySnapshot> users = await FirebaseFirestore.instance.collection('data').snapshots();
    // get_data();

    // Future getDocs() async {
    //   QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("collection").get();
    //   for (int i = 0; i < querySnapshot.docs.length; i++) {
    //     var a = querySnapshot.docs[i];
    //     print(a);
    //   }
    // }
    // getDocs();

    CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('data');

    Future<void> getData() async {
      // Get docs from collection reference
      QuerySnapshot querySnapshot = await _collectionRef.get();

      // Get data from docs and convert map to List
      final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      print(allData);
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
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
      body:StreamBuilder(
        stream: FirebaseFirestore.instance.collection('data').snapshots(),
        builder: <QuerySnapshot>(context,snapshot) {

          if(snapshot.hasData) {
            var data;
            return ListView(
              children: [
                for(data in snapshot.data.docs) Container(
                  height: 100,

                  margin: const EdgeInsets.only(top: 20,right: 20,left: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.only(topEnd: Radius.circular(30),bottomEnd: Radius.circular(30)),
                    gradient: LinearGradient(
                      colors: [
                        Colors.white70,
                        Colors.lime.shade600
                      ]
                    )
                  ),
                  child: Row(
                    children: [
                      Container(
                          height: 100,
                          width: 100,

                          child: CircleAvatar(
                            backgroundImage: NetworkImage(data['url']),
                            radius: 100,
                          ),
                      ),
                      SizedBox(width: 20,),// Image.network(data['url'])),
                      Column(
                        children: [

                          Text(data['type'],style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
                          Text("INR "+data['price']+" /quintal",style: TextStyle(fontSize: 20),),
                          Text("Moisture : "+data['Moisture']+"%"),
                          Text("Location : "+data['Location']),
                          Text("Contact No : "+data['contact']),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            );
            // for (data in snapshot.data.docs) {
            //   return ListView(
            //     children: [
            //       for (data in snapshot.data.docs) Text(data['type']),
            //     ],
            //   );Text(data['type']);
            //   // snapshot.data.docs[index]['type']
            // }
          }
          return Text("Error");
        },
      ),
    );
  }
}
