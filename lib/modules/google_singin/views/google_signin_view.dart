import 'package:anantkaal_chat_name/config/theme/app_colors.dart';
import 'package:anantkaal_chat_name/gen/assets.gen.dart';
import 'package:anantkaal_chat_name/gen/fonts.gen.dart';
import 'package:anantkaal_chat_name/modules/google_singin/controller/google_signin_controller.dart';
import 'package:anantkaal_chat_name/utils/base_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class GoogleSignInView extends GetView<GoogleSignInController> {
   GoogleSignInView({super.key});

  @override
  final controller = Get.put<GoogleSignInController>(GoogleSignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
          child: Stack(
            children: [
              Image.asset(
                Assets.images.imgSplashOne.path,
              ),
              Center(child: GestureDetector(
                onTap: () async {
                  await controller.signInWithGoogle();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: AppColors.uiColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Assets.icons.icGoogle),
                      10.0.toHSB,
                      Text('Sign In with Google',style: TextStyle(
                          color: AppColors.appWhiteColor,
                          fontFamily: FontFamily.openSans,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),),
                    ],
                  ),
                ),
              ),),
            ],
          ),
        ),
    );
  }
}
