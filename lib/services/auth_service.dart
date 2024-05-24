import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthService {
  final GoogleSignIn _googleSignIn;
  final FirebaseAuth _firebaseAuth;

  User? get _firebaseAuthUser => _firebaseAuth.currentUser;

  AuthorizationCredentialAppleID? _appleCredentials;

  GoogleSignInAccount? get _googleSignInAccount => _googleSignIn.currentUser;

  AuthService(this._googleSignIn, this._firebaseAuth);

  bool get isLoggedIn => _firebaseAuthUser != null;

  /// Not safe to be called when login or app startup could be pending
  String get uid => _firebaseAuthUser!.uid;

  /// Safe to be called at any time
  Future<String> getUidAsync() async {
    if (isLoggedIn) {
      return uid;
    }

    late final StreamSubscription s;
    final uidCompleter = Completer<String>();

    s = _firebaseAuth.authStateChanges().listen((user) {
      if (user != null) {
        uidCompleter.complete(user.uid);
        s.cancel();
      }
    });

    return uidCompleter.future;
  }

  Future<void> logout() {
    return Future.wait([
      if (_googleSignInAccount != null) _googleSignIn.signOut(),
      _firebaseAuth.signOut(),
    ]);
  }

  Future<void> loginWithGoogle() async {
    await _googleSignIn.signIn();

    if (_googleSignInAccount != null) {
      await firebaseLoginViaGoogle();
    }
  }

  Future<void> loginInWithApple() async {
    _appleCredentials = await SignInWithApple.getAppleIDCredential(
      scopes: [],
    );

    if (_appleCredentials != null) {
      await firebaseLoginViaApple(_appleCredentials!);
    }
  }

  Future<void> firebaseLoginViaGoogle() async {
    final googleAuth = await _googleSignIn.currentUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await _firebaseAuth.signInWithCredential(credential);
  }

  Future<void> firebaseLoginViaApple(
      AuthorizationCredentialAppleID appleCredentials) async {
    final oAuthProvider = OAuthProvider('apple.com');

    final credential = oAuthProvider.credential(
      idToken: appleCredentials.identityToken!,
      accessToken: appleCredentials.authorizationCode,
    );

    await _firebaseAuth.signInWithCredential(credential);
  }
}

class AuthException {
  final String message;

  AuthException(this.message);
}
