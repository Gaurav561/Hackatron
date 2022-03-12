// import 'package:apslm/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'buy_page.dart';
import 'sell_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class info {

  String email = " ";
  String name = " ";
  String number = " ";
}

late String email;


var i = info();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final FirebaseAuth _auth = FirebaseAuth.instance;

    return MaterialApp(
      home: login_page(),
    );
  }
}


class register_page extends StatefulWidget {
  const register_page({Key? key}) : super(key: key);



  @override
  _register_pageState createState() => _register_pageState();
}

class _register_pageState extends State<register_page> {

  final pnor_controller = TextEditingController();
  final passr_controller = TextEditingController();

  final name_controller = TextEditingController();
  final no_controller = TextEditingController();
  // final email_controller = TextEditingController();



  // final AuthenticationServices _auth = AuthenticationServices();

  @override
  Widget build(BuildContext context) {

    void addata(){


      Map<String,dynamic> data = {"Name" : name_controller.text,
        "Number" : no_controller.text,
        "Email" : pnor_controller.text};
      print(data);
      String name = pnor_controller.text;
      CollectionReference cr = FirebaseFirestore.instance.collection(name);
      cr.add(data);
    }
    email  = pnor_controller.text;
    print(email);
    i.name = name_controller.text;
    i.number = no_controller.text;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade900,
        title: Row(
          children: [
            Text("APSLM"),
            Icon(Icons.agriculture_rounded,size: 50,),
            // SizedBox(width: MediaQuery.of(context).size.width-210),
            // Icon(Icons.account_circle,size: 35,)
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   colors: [
          //     Colors.white,Colors.
          //   ]
          // )
          color: Colors.white,
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 80,right: 30,left: 30),
          child: Column(
            children: [
              Text("New User",style: TextStyle(fontSize: 30),),
              // Text("Get an Account"),
              SizedBox(height: 20,),
              TextField(
              controller: name_controller,
              decoration: InputDecoration(
                labelText: 'Full Name',
              ),
              ),
              TextField(
                controller: no_controller,
                decoration: InputDecoration(
                  labelText: 'Mobile No.',
                ),
              ),
              TextField(
                controller: pnor_controller,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),

              ),
              TextField(
                obscureText: true,
                controller: passr_controller,
                decoration: InputDecoration(
                  labelText: 'Create a Password',
                ),
              ),
              SizedBox(height: 25,),
              RaisedButton(
                onPressed: () async{
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(email: pnor_controller.text, password: passr_controller.text);
                  // await _auth.createuser(pnor_controller.text, passr_controller.text);
                  print("Registered");
                  addata();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const login_page()),
                  );
                },
                child: Text("Submit"),
                color: Colors.green.shade900,
                textColor: Colors.white,
              )

            ],
          ),
        ),
      ),
    );
  }
}




class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  _login_pageState createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {

  final pno_controller = TextEditingController();
  final pass_controller = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Row(
      //     children: [
      //       Text("APSLM"),
      //       Icon(Icons.agriculture_rounded,size: 50,),
      //       SizedBox(width: MediaQuery.of(context).size.width-190),
      //       // Icon(Icons.account_circle,size: 35,)
      //     ],
      //   ),
      // ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.lightBlue.shade50,Colors.lightBlue.shade500
              ]
          ),
        ),
        child: Center(
          child: Container(

            margin: const EdgeInsets.only(top: 150,right: 70,left: 70),
            child: Column(
              children: [

                Center(
                  child: Row(
                    children: [
                      SizedBox(width: 50,),
                      Text("APSLM",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      Icon(Icons.agriculture_rounded,size: 80,),
                    ],
                  ),
                ),
                TextField(
                  controller: pno_controller,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),

                ),
                TextField(
                  obscureText: true,
                  controller: pass_controller,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                SizedBox(height: 40,),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    RaisedButton(
                      onPressed: () async{
                        email = pno_controller.text;
                        if(await FirebaseAuth.instance.signInWithEmailAndPassword(email: pno_controller.text, password: pass_controller.text)!=null){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const home_page()),
                          );
                        }
                        else{
                          pno_controller.clear();
                          pass_controller.clear();
                        }
                      },
                      child: Text("Login"),
                      color: Colors.black,
                      textColor: Colors.white,
                    ),
                    SizedBox(width: 20,),
                    RaisedButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const register_page()),
                        );
                      },
                      child: Text("Sign Up"),
                      color: Colors.black,
                      textColor: Colors.white,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      )

    );
  }
}



class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {

  void test(){
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    print(i.name);
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    test();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lime[50],
        appBar: AppBar(
          title: Row(
            children: [
              Text("APSLM"),
              Icon(Icons.agriculture_rounded,size: 50,),
              SizedBox(width: MediaQuery.of(context).size.width-255),
              IconButton(
                onPressed: () async{
                  await FirebaseAuth.instance.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const login_page()),
                  );
                },
                icon: Icon(Icons.logout),
              ),


              // Icon(Icons.account_circle,size: 35,)
            ],
          ),
          backgroundColor: Colors.red[600],

        ),
        body: StreamBuilder<Object>(
          stream: FirebaseFirestore.instance.collection(email).snapshots(),
          builder: <QuerySnapshot>(context, snapshot) {

            if(snapshot.hasData) {
              return SingleChildScrollView(child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20, left: 20, top: 20),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 200,
                    decoration: BoxDecoration(
                      // color: Colors.lime[200],
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white,
                            Colors.red.shade600

                          ]),
                      boxShadow: [
                        BoxShadow(color: Colors.red, spreadRadius: 3)
                      ],
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50)),
                    ),
                    child: Container(
                      child: Column(
                        children: [
                          Icon(Icons.account_circle_rounded, size: 100,
                            color: Colors.white,),


                          Text(snapshot.data.docs[0]['Name'], style: TextStyle(
                              fontSize: 30, color: Colors.blue[900]),),
                          RaisedButton(onPressed: (){},
                          child: Text("Update Profile Info"),
                            color: Colors.lime.shade500,


                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 150,
                    // color: Colors.lime[100],
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.white,
                              Colors.red.shade600

                            ]
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(color: Colors.red, spreadRadius: 3)
                      ],

                    ),
                    child: Column(

                      children: [
                        SizedBox(height: 20,),
                        Text("Profile Info", style: TextStyle(fontSize: 28,
                            color: Colors.green.shade900),),
                        SizedBox(height: 10,),
                        Text("      "+"Mail : "+snapshot.data.docs[0]['Email'], style: TextStyle(fontSize: 18,
                            color: Colors.blue[900],
                            )),
                        SizedBox(height: 10,),
                        Text("Contact No : "+snapshot.data.docs[0]['Number'], style: TextStyle(fontSize: 18,
                          color: Colors.blue[900],
                        ))
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 100,
                    // color: Colors.lime[100],
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.white,
                              Colors.red.shade600

                            ]
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        boxShadow: [
                        BoxShadow(color: Colors.red, spreadRadius: 3)
                        ],
                    ),
                    child: Column(

                      children: [
                        SizedBox(height: 10,),
                        Text("Wallet Balance", style: TextStyle(fontSize: 28,
                            color: Colors.lime[900]),),
                        SizedBox(height: 10,),
                        Text("INR 20,000", style: TextStyle(fontSize: 25,
                            color: Colors.green[800],
                            fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 80),
                    // alignment: Alignment.center,
                    child: Row(
                      children: [
                        RaisedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const sell_page()),
                            );
                          },
                          child: Text("Sell"),
                          color: Colors.lime[600],
                        ),
                        SizedBox(width: 20),
                        RaisedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const buy_page()),
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

              );
            }
            else{
              return Text("Error");
            }
          }
        )
    );
  }
}


class getinfo extends StatefulWidget {
  const getinfo({Key? key}) : super(key: key);

  @override
  _getinfoState createState() => _getinfoState();
}

class _getinfoState extends State<getinfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('data').snapshots(),
        builder: <QuerySnapshot>( context, snapshot) {
          if(snapshot.hasData){
            i.email = snapshot.data.docs[0]['Email'];
            i.name = snapshot.data.docs[0]['Name'];
            i.number = snapshot.data.docs[0]['Number'];
            return Text("jkj");
          }
          else{
            return Text("dvd");
          }
          }


      ),
    );
  }
}

