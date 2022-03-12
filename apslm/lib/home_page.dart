import 'package:apslm/buy_page.dart';
import 'package:apslm/sell_page.dart';
import "package:flutter/material.dart";

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lime[50],
      appBar: AppBar(
        title: Row(
          children: [
            Text("APSLM"),
            Icon(Icons.agriculture_rounded,size: 50,),
            SizedBox(width: MediaQuery.of(context).size.width-240),
            Icon(Icons.account_circle,size: 35,)
          ],
        ),
        backgroundColor: Colors.lime[600],

      ),
      body: SingleChildScrollView(child:Column(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 20, left: 20,top: 40),
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
              // color: Colors.lime[200],
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.lime.shade50,
                    Colors.lime.shade300

                  ]),
                boxShadow: [
                  BoxShadow(color: Colors.lime, spreadRadius: 3)
                ],
                borderRadius: BorderRadius.only(topRight: Radius.circular(50),bottomLeft: Radius.circular(50)),
            ),
            child: Container(
              child: Column(
                children: [
                  Icon(Icons.account_circle_rounded,size: 100,color: Colors.white,),
                  Text("Not this Page",style: TextStyle(fontSize: 30,color: Colors.lime[900]),)
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 40,left: 20,right: 20),
            width: MediaQuery.of(context).size.width,
            height: 150,
            // color: Colors.lime[100],
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.lime.shade50,
                  Colors.lime.shade300

                ]
              ),
              borderRadius: BorderRadius.all(Radius.circular(50))

    ),
            child: Column(

              children: [
                SizedBox(height: 20,),
                Text("Wallet Balance",style: TextStyle(fontSize: 28,color: Colors.lime[900]),),
                SizedBox(height: 10,),
                Text("INR 20,000",style: TextStyle(fontSize: 25,color: Colors.green[800],fontWeight: FontWeight.bold))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20,left: 80),
            // alignment: Alignment.center,
            child: Row(
              children: [
                RaisedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const sell_page()),
                    );
                  },
                  child: Text("Sell"),
                  color: Colors.lime[600],
                ),
                SizedBox(width:20),
                RaisedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const buy_page()),
                      );
                    },
                    child: Text("Buy"),
                    color: Colors.lime[600],
                    )
              ],
            ),
          ),
          
        ],
      ),
      )
    );
  }
}
