import 'package:firebase_auth/firebase_auth.dart';
class Auth{
  final FirebaseAuth _fireBaseAuth=FirebaseAuth.instance;
  User? get currentuser => _fireBaseAuth.currentUser;
  Stream<User?> get authStateChanges=> _fireBaseAuth.authStateChanges();
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
}) async{
    await _fireBaseAuth.signInWithEmailAndPassword(email: email,password: password);
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async{
    await _fireBaseAuth.createUserWithEmailAndPassword(email: email,password: password);
  }
  Future<void> signout() async{
    await _fireBaseAuth.signOut();
  }

}