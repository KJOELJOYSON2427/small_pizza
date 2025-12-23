import 'package:firebase_auth/firebase_auth.dart';
import 'auth_remote_data_source.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FacebookAuth _facebookAuth;

  AuthRemoteDataSourceImpl(
    this._firebaseAuth,
    this._googleSignIn,
    this._facebookAuth,
  );

  @override
  Future<UserCredential> loginWithEmail(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // ================= GOOGLE LOGIN =================

  @override
  Future<UserCredential> loginWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();

    if (googleUser == null) {
      throw FirebaseAuthException(
        code: 'GOOGLE_SIGN_IN_ABORTED',
        message: 'Google sign in aborted',
      );
    }

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await _firebaseAuth.signInWithCredential(credential);
  }

  // ================= FACEBOOK LOGIN =================
  @override
  Future<UserCredential> loginWithFacebook() async {
    print("came");
    final LoginResult result = await _facebookAuth.login();
    print(result);
    if (result.status != LoginStatus.success) {
      throw FirebaseAuthException(
        code: 'FACEBOOK_SIGN_IN_FAILED',
        message: result.message,
      );
    }

    final OAuthCredential credential = FacebookAuthProvider.credential(
      result.accessToken!.tokenString,
    );

    return await _firebaseAuth.signInWithCredential(credential);
  }

  // ================= LOGOUT =================
  @override
  Future<void> logout() async {
    await _googleSignIn.signOut();
    await _facebookAuth.logOut();
    await _firebaseAuth.signOut();
  }

  @override
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
}
