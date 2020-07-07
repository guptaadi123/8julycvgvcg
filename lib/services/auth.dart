import 'package:firebase_auth/firebase_auth.dart';
import 'package:finalproject/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
 //create user obj
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }
  // auth change user stram
  Stream<User> get user{
    return _auth.onAuthStateChanged
    .map(_userFromFirebaseUser);
  }

  // sign in anon
//  Future signinAnon() async{
//    try{
//      AuthResult result = await _auth.signInAnonymously();
//      FirebaseUser user = result.user;
//      return _userFromFirebaseUser(user);
//    } catch(e) {
//      print(e.toString());
//      return null;
//    }
//
//  }


// sign in with email and pass
  Future signInWithEmailAndPassword(String email,String password) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;

    }
  }

Future getCurrentUser() async {
    return await _auth.currentUser();
}

//register with email & pass & name
  Future registerWithEmailAndPassword(String email,String password,String name) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      var userUpdateInfo = UserUpdateInfo();
      userUpdateInfo.displayName = name;
      await result.user.updateProfile(userUpdateInfo);
      await result.user.reload();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);

    } catch(e){
      print(e.toString());
      return null;

    }

  }

  Future sendPasswordResetEmail(String email) async {
    return _auth.sendPasswordResetEmail(email: email);
  }



// sign out
Future signout() async{
    try{
      return await _auth.signOut();

    } catch(e){
      print(e.toString());
      return null;
    }
}


}