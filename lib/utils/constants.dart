import 'dart:developer';
import 'package:flutter/foundation.dart';

class Constants {

 /// server Live
 static const String baseUrl = 'https://spell.theanantkaal.com/api/';

 /// Auth
 static const String signUp = 'createglobaluser';
 static const String chat = 'showglobalchat';
 static const String createChat = 'createglobalchat';
 static const String image = 'save-Multipart-Image';
}

void appPrint(dynamic object) {
  if (kDebugMode) {
    log('$object');
  }
  // if (kReleaseMode) {
  //   log('$object');
  // }
}
