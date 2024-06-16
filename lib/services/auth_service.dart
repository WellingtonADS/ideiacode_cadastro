import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Logger _logger = Logger();

  // Método para criar usuário com email e senha
  Future<UserCredential?> createUserWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      _logger.e("Failed to create user: ${e.message}");
      return null;
    }
  }

  // Método para login com email e senha
  Future<UserCredential?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      _logger.e("Failed to sign in: ${e.message}");
      return null;
    }
  }

  // Método para logout
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Método para recuperar senha
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      _logger.i("Password reset email sent");
    } on FirebaseAuthException catch (e) {
      _logger.e("Failed to send password reset email: ${e.message}");
    }
  }

  // Getter para o usuário atual
  User? get currentUser => _auth.currentUser;
}
