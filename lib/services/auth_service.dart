import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

/// Classe que representa uma exceção de autenticação.
class AuthException implements Exception {
  String message;
  AuthException(this.message);
}

/// Classe responsável por gerenciar a autenticação do usuário.
class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Logger _logger = Logger();

  User? usuario;
  bool isLoading = true;

  /// Construtor da classe AuthService.
  AuthService() {
    _authCheck();
  }

  /// Verifica o estado de autenticação do usuário.
  void _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      _logger.d("Estado de autenticação mudou: $user");
      usuario = user;
      isLoading = false;
      notifyListeners();
    });
  }

  /// Obtém o usuário atualmente autenticado.
  void _getUser() {
    usuario = _auth.currentUser;
    notifyListeners();
  }

  /// Realiza o login do usuário.
  ///
  /// Lança uma [AuthException] se ocorrer algum erro durante o login.
  Future<void> login(String email, String senha) async {
    try {
      _logger.d("Tentando fazer login...");
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
      _getUser();
      _logger.d("Login bem-sucedido: ${_auth.currentUser}");
    } on FirebaseAuthException catch (e) {
      _logger.e("Erro ao fazer login: ${e.code}");
      if (e.code == 'user-not-found') {
        throw AuthException('Email não encontrado. Cadastre-se.');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Senha incorreta. Tente novamente');
      } else {
        throw AuthException('Erro ao fazer login: ${e.message}');
      }
    } catch (e) {
      _logger.e("Erro desconhecido ao fazer login: $e");
      throw AuthException('Erro desconhecido ao fazer login');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /// Registra um novo usuário.
  ///
  /// Lança uma [AuthException] se ocorrer algum erro durante o registro.
  Future<void> registrar(String email, String senha) async {
    try {
      _logger.d("Tentando registrar usuário...");
      await _auth.createUserWithEmailAndPassword(email: email, password: senha);
      _getUser();
      _logger.d("Registro bem-sucedido: ${_auth.currentUser}");
    } on FirebaseAuthException catch (e) {
      _logger.e("Erro ao registrar usuário: ${e.code}");
      if (e.code == 'weak-password') {
        throw AuthException('A senha é muito fraca!');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('Este email já está cadastrado');
      } else {
        throw AuthException('Erro ao registrar: ${e.message}');
      }
    } catch (e) {
      _logger.e("Erro desconhecido ao registrar usuário: $e");
      throw AuthException('Erro desconhecido ao registrar usuário');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /// Realiza o logout do usuário.
  Future<void> logout() async {
    try {
      _logger.d("Fazendo logout...");
      await _auth.signOut();
      _getUser(); // Atualiza o usuário após o logout
      _logger.d("Logout bem-sucedido");
    } catch (e) {
      _logger.e("Erro ao fazer logout: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
