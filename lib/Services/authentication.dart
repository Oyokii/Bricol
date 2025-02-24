import 'package:bricol/Models/Users.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AppUser? _userFromFirebaseUser(User user){
    return user != null ? AppUser(uid: user.uid) : null;
  }

  Stream<AppUser> get user{
    return _auth.authStateChanges().map(_userFromFirebaseUser(user as User) as AppUser Function(User? event));
  }

  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    }catch(exception){
      print(exception.toString());
      return null;
    }
  }

  Future RegisterWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    }catch(exception){
      print(exception.toString());
      return null;
    }
  }

  Future SignOut() async{
    try{
      return _auth.signOut();
    }catch(exception){
      print(exception.toString());
      return null;
    }
  }
}