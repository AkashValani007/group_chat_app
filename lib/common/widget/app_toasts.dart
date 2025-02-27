import 'package:anantkaal_chat_name/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppToasts {
  static showSuccess(String text) async {
    Get.snackbar(text, '',
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        snackStyle: SnackStyle.GROUNDED,
        margin: EdgeInsets.zero,
        backgroundColor: AppColors.success,
        borderRadius: 0);
  }

  static showError(String text) {
    Get.snackbar(text, '',
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        snackStyle: SnackStyle.GROUNDED,
        margin: EdgeInsets.zero,
        backgroundColor: AppColors.errorColor,
        borderRadius: 0);
  }
}






