import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:apslm/AuthenticationService.dart';

class register_page extends StatefulWidget {
  const register_page({Key? key}) : super(key: key);



  @override
  _register_pageState createState() => _register_pageState();
}

class _register_pageState extends State<register_page> {

  final pnor_controller = TextEditingController();
  final passr_controller = TextEditingController();



  final AuthenticationServices _auth = AuthenticationServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        child: Column(
          children: [
            TextField(
              controller: pnor_controller,
              decoration: InputDecoration(
                labelText: 'Email',
              ),

            ),
            TextField(
              controller: passr_controller,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),

            RaisedButton(
              onPressed: () async{
                FirebaseAuth.instance.createUserWithEmailAndPassword(email: pnor_controller.text, password: passr_controller.text);
                // await _auth.createuser(pnor_controller.text, passr_controller.text);
                print("Registered");
              },
              child: Text("Register"),
              color: Colors.lime[800],
            )

          ],
        ),
      ),
    );
  }
}
