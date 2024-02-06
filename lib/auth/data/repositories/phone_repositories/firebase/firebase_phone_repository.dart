import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import '/auth/domain/repositories/auth_repository.dart';

class FirebasePhoneAuth extends AuthRepository {
  final FirebaseAuth firebase;
  FirebasePhoneAuth({required super.userController, super.kodController})
      : firebase = FirebaseAuth.instance;
  @override
  Future<void> signIn({
    String? phone,
    String? name,
    String? email,
    String? password,
  }) async {
    await firebase.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await firebase.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        log(e.message ?? 'error');
      },
      codeSent: codeSent,
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> codeSent(String verificationId, int? resendToken) async {
    try {
      kodController?.stream.listen((event) async {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: event);
        await firebase.signInWithCredential(credential);
        userController.add({'userId': credential.verificationId});
        log('send user');
      });
    } catch (e) {
      // здесь будет обработка исключений firebase, для экономии времени не реализую
      log(e.toString());
    }
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(
      {String? phone, String? name, String? email, String? password}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
