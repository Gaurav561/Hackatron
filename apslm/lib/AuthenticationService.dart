import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';


class AuthenticationServices{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future createuser(String email,String password) async{

    await _auth.createUserWithEmailAndPassword(email: email, password: password);
    // UserCredential result =
    // User? user = result.user;
    // await user!.updateProfile(displayName: "Gaurav");
    // await user.reload();

  }
}