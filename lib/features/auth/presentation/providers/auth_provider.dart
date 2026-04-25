import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  User? _user;
  bool _isLoading = true;
  StreamSubscription<User?>? _subscription;

  User? get user => _user;
  bool get isLoading => _isLoading;

  AuthProvider() {
    _subscription = FirebaseAuth.instance.authStateChanges().listen((user) {
      _user = user;
      _isLoading = false;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
