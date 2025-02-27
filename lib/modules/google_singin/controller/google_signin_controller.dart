import 'dart:async';
import 'package:anantkaal_chat_name/routes/app_pages.dart';
import 'package:anantkaal_chat_name/utils/app_preferences.dart';
import 'package:anantkaal_chat_name/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';

class GoogleSignInController extends GetxController {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  String userName = '';
  Rxn<PigeonUserDetails> userDetails = Rxn<PigeonUserDetails>();

  @override
  void onInit() {
    _auth.authStateChanges().listen((User? firebaseUser) {
      if (firebaseUser != null) {
        userDetails.value = PigeonUserDetails(
          uid: firebaseUser.uid,
          email: firebaseUser.email ?? "",
          name: firebaseUser.displayName ?? "",
        );
        Get.toNamed(Routes.SIGNUP_VIEW);
      }
    });
    super.onInit();
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await _auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        userDetails.value = PigeonUserDetails(
          uid: userCredential.user?.uid ?? '',
          email: userCredential.user?.email ?? '',
          name: userCredential.user?.displayName ?? '',
        );
        Get.offAllNamed(Routes.SIGNUP_VIEW);
      }
    } catch (e) {
      appPrint('Error:: ${e.toString()}');
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
    userDetails.value = null;
    await AppPreference.clearSharedPreferences();
    await(Get.offAllNamed(Routes.GOOGLE_SIGNIN_VIEW));
  }
}


class PigeonUserDetails {
  final String uid;
  final String email;
  final String name;

  PigeonUserDetails({required this.uid, required this.email, required this.name});

  factory PigeonUserDetails.fromJson(Map<String, dynamic> json) {
    return PigeonUserDetails(
      uid: json['uid'] ?? "",
      email: json['email'] ?? "",
      name: json['name'] ?? "",
    );
  }
}
