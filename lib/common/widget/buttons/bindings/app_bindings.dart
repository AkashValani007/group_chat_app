import 'package:anantkaal_chat_name/modules/google_singin/controller/google_signin_controller.dart';
import 'package:anantkaal_chat_name/modules/group_chat/controller/group_chat_controller.dart';
import 'package:anantkaal_chat_name/modules/sign_up/controller/sign_up_controller.dart';
import 'package:get/get.dart';


class GoogleSignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GoogleSignInController>(
      GoogleSignInController.new,
    );
  }
}
class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(
      SignUpController.new,
    );
  }
}

class GroupChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupChatController>(
      GroupChatController.new,
    );
  }
}

