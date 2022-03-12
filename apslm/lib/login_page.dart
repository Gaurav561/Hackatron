import 'package:flutter/material.dart';
import 'register_page.dart';

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
      //     title: Row(
      //       children: [
      //         Text("APSLM"),
      //         Icon(Icons.agriculture_rounded,size: 50,),
      //         SizedBox(width: MediaQuery.of(context).size.width-190),
      //         // Icon(Icons.account_circle,size: 35,)
      //       ],
      //     ),
      // ),
      body: Container(
        margin: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            TextField(
              controller: pno_controller,
              decoration: InputDecoration(
                labelText: 'Email',
              ),

            ),
            TextField(
              controller: pass_controller,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            Row(
              children: [
                RaisedButton(
                    onPressed: (){},
                  child: Text("Login"),
                  color: Colors.lime[800],
                    ),
                RaisedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const register_page()),
                    );
                  },
                  child: Text("Not a User"),
                  color: Colors.lime[800],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
