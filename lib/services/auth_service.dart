import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = true;

  AuthService() {
    _authCheck();
  }

  // Verifica o estado de autenticação inicial
  void _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      usuario = user;
      isLoading = false;
      notifyListeners();
    });
  }

  // Obtém o usuário atual
  void _getUser() {
    usuario = _auth.currentUser;
    notifyListeners();
  }

  // Registra um novo usuário
  Future<void> registrar(String email, String senha) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: senha);
      _getUser(); // Atualiza o usuário após o registro
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException('A senha é muito fraca!');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('Este email já está cadastrado');
      } else {
        throw AuthException('Erro ao registrar: ${e.message}');
      }
    }
  }

  // Faz login com email e senha
  Future<void> login(String email, String senha) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
      _getUser(); // Atualiza o usuário após o login
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException('Email não encontrado. Cadastre-se.');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Senha incorreta. Tente novamente');
      } else {
        throw AuthException('Erro ao fazer login: ${e.message}');
      }
    }
  }

  // Faz logout
  Future<void> logout() async {
    await _auth.signOut();
    _getUser(); // Atualiza o usuário após o logout
  }
}
