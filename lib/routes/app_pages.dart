import 'package:anantkaal_chat_name/common/widget/buttons/bindings/app_bindings.dart';
import 'package:anantkaal_chat_name/modules/google_singin/views/google_signin_view.dart';
import 'package:anantkaal_chat_name/modules/group_chat/view/group_chat_view.dart';
import 'package:anantkaal_chat_name/modules/sign_up/views/sign_up_view.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {

  static const INITIAL = Routes.GOOGLE_SIGNIN_VIEW;

  static final routes = [
    GetPage(
      name: _Paths.GOOGLE_SIGNIN_VIEW,
      page: () => GoogleSignInView(),
      binding: GoogleSignInBinding(),

    ),
    GetPage(
      name: _Paths.SIGNUP_VIEW,
      page: () => const SignUpView(),
      binding: SignUpBinding(),

    ),
    GetPage(
      name: _Paths.GROUP_CHAT,
      page: () => GroupChatView(),
      binding: GroupChatBinding(),
    ),
  ];
}