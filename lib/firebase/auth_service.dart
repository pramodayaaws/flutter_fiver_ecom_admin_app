

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  late final FirebaseAuth _auth;
  AuthService(this._auth);

  Stream<User?> get authStateChanges => _auth.idTokenChanges();

  Future<String> login(String email, String password) async {
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return 'Logged In';
    }catch(e){
      return 'Login Error';
    }
  }

  Future<String> signUp(String email, String password) async {
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return 'Signed up';
    }catch(e){
      return 'Sign up error';
    }
  }
}