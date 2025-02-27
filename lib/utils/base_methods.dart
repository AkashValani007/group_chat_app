import 'package:anantkaal_chat_name/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';


dynamic progressIndicator(BuildContext context) {
  Get.dialog(
      const PopScope(
        canPop: false,
        child: Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          insetPadding: EdgeInsets.zero,
          child: Center(
            child: LoadingDialog(),
          ),
        ),
      ),
      barrierDismissible: false);
}

void hideProgressIndicator() {
    Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
}

class LoadingDialog extends StatefulWidget {
  const LoadingDialog({super.key});

  @override
  LoadingDialogState createState() => LoadingDialogState();
}

class LoadingDialogState extends State<LoadingDialog> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose(); // Properly dispose of animation
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: EdgeInsets.zero,
      child: Center(
        child: LottieBuilder.asset(
          Assets.lottie.loginagCommon,
          controller: _controller, // Assign controller
          onLoaded: (composition) {
            _controller..duration = composition.duration..repeat();
          },
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}

