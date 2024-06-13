import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signIn(String email, String password,
      {required String role}) async {
    try {
      // Determine the Firestore collection based on the user's role
      CollectionReference usersCollection = role == 'client'
          ? _firestore.collection('clients')
          : _firestore.collection('counselors');

      // Query Firestore to retrieve the user's credentials
      QuerySnapshot querySnapshot =
          await usersCollection.where('email', isEqualTo: email).limit(1).get();

      if (querySnapshot.docs.isNotEmpty) {
        // Retrieve the stored password
        String storedPassword = querySnapshot.docs.first.get('password');

        // Compare the stored password with the provided password
        if (password == storedPassword) {
          // Sign in the user
          await _auth.signInWithEmailAndPassword(
              email: email, password: password);
        } else {
          // Password does not match
          throw Exception('Invalid password');
        }
      } else {
        // User not found
        throw Exception('User not found');
      }
    } catch (e) {
      print('Error signing in: $e');
      throw e;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Error signing out: $e');
      throw e;
    }
  }
}
