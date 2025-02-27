part of 'app_pages.dart';

abstract class Routes {
  static const GOOGLE_SIGNIN_VIEW = _Paths.GOOGLE_SIGNIN_VIEW;
  static const SIGNUP_VIEW = _Paths.SIGNUP_VIEW;
  static const GROUP_CHAT = _Paths.GROUP_CHAT;

}

abstract class _Paths {
  static const GOOGLE_SIGNIN_VIEW = '/google_signIn_view';
  static const SIGNUP_VIEW = '/signup_view';
  static const GROUP_CHAT = '/group_chat_view';
}