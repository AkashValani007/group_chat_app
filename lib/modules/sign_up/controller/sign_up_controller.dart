import 'dart:async';
import 'package:anantkaal_chat_name/api_services/api_services.dart';
import 'package:anantkaal_chat_name/common/widget/app_toasts.dart';
import 'package:anantkaal_chat_name/routes/app_pages.dart';
import 'package:anantkaal_chat_name/utils/app_preferences.dart';
import 'package:anantkaal_chat_name/utils/base_methods.dart';
import 'package:anantkaal_chat_name/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {

  @override
  void onInit() {
    super.onInit();
  }

  final formKey = GlobalKey<FormState>().obs;
  static final ApiService apiService = ApiService.create();

  Rx<TextEditingController> fullNameController = TextEditingController().obs;
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> addressController = TextEditingController().obs;
  Rx<TextEditingController> postalCodeController = TextEditingController().obs;
  Rx<TextEditingController> dateOfBirthController = TextEditingController().obs;

  Rx<Gender> selectedGender = Gender.noGender.obs;

  FocusNode fullNameFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode addressFocusNode = FocusNode();
  FocusNode postalCodeFocusNode = FocusNode();
  FocusNode dateOfBirthFocusNode = FocusNode();

  Rx<bool> fullNameValidErr = false.obs;
  Rx<bool> phoneValidErr = false.obs;
  Rx<bool> emailValidErr = false.obs;
  Rx<bool> passValidErr = false.obs;
  Rx<bool> addressValidErr = false.obs;
  Rx<bool> postalCodeValidErr = false.obs;
  Rx<bool> dateOfBValidErr = false.obs;

  Rx<String?> dateOfBrith = Rx<String?>(null);

  RxList<String> countryList = <String>['India','China','United States','Switzerland'].obs;
  RxList<String> stateList = <String>['Gujarat','Kerala','Haryana'].obs;
  RxList<String> cityList = <String>['Ahmedabad','Surat','Vadodara'].obs;

  RxnString? selectCountry = RxnString();
  RxnString? selectState = RxnString();
  RxnString? selectCity = RxnString();

  RxBool selectCountryError = false.obs;
  RxBool selectStateError = false.obs;
  RxBool selectCityError = false.obs;


  Future<dynamic> signUpUser() async {
  progressIndicator(Get.context!);
    try {
      final signUpCred = {
        "name": fullNameController.value.text,
        "email": emailController.value.text.trim(),
        "phone_number": phoneController.value.text.trim(),
        "gender": selectedGender.value.name.trim(),
        "address": addressController.value.text,
        "city": selectCity?.value,
        "state": selectState?.value,
        "date_of_birth": dateOfBrith.value,
      };
      final response = await apiService.signUpPost(signUpCred);
        if(response['status'] == 'true') {
          hideProgressIndicator();
          appPrint('${response['status']}');
          AppToasts.showSuccess(response['message']);
          appPrint('${response['message']}');
          Get.toNamed(Routes.GROUP_CHAT,arguments: {
            'email': emailController.value.text,
            'name': fullNameController.value.text,
          });
          await AppPreference().addStringToSF('token',response['token']!.toString());
          var name = fullNameController.value.text;
          await AppPreference().addStringToSF('user_Name',name);

        } else {
          appPrint('else${response['message']}');
          appPrint('else${response['status']}');
          hideProgressIndicator();
          AppToasts.showError(response['message']);
        }

    } on DioException catch (onError) {
     hideProgressIndicator();
      final res = onError.response;
      appPrint('Error:: ${res.toString()}');
    }
  }


  String? validFullName({required String fullName}) {
    if (fullName.isEmpty) {
      fullNameValidErr.value = true;
      return 'Please enter your full name';
    }
    fullNameValidErr.value = false;
    return null;
  }

  String? phoneValidationField(String phone) {
    if (phone.trim().isEmpty) {
      phoneValidErr.value = true;
      return 'Please enter your phone number';
    } else if (phone.trim().length < 10) {
      phoneValidErr.value = true;
      return 'Please enter valid mobile number!';
    }
    phoneValidErr.value = false;
    return null;
  }

  String? validateEmail({required String email}) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (email.isEmpty) {
      emailValidErr.value = true;
      return 'Please enter your email';
    } else if (email.isNotEmpty && emailRegex.hasMatch(email)) {
      emailValidErr.value = false;
      return null;
    } else if (email.isNotEmpty && !emailRegex.hasMatch(email)) {
      emailValidErr.value = true;
      return 'Invalid Email';
    }
    return null;
  }

  String? validatePassword({required String password}) {
    final pswRegex = RegExp(r'^.*(?=.{8,255})((?=.*[!@#$%^&*_,]))(?=.*\d)((?=.*[A-Z]))((?=.*[a-z])).*$');
    if (password.isEmpty) {
      passValidErr.value = true;
      return 'Please enter password';
    } else if (password.isNotEmpty && pswRegex.hasMatch(password)) {
      passValidErr.value = false;
      return null;
    } else if (password.isNotEmpty && !pswRegex.hasMatch(password)) {
      passValidErr.value = true;
      return r'Password length should be 8 character & must contain capital letter, small letter, number & an special character [!,@,#,$,%,^,&,*,_]';
    }
    return null;
  }

  String? validAddress({required String address}) {
    if (address.isEmpty) {
      addressValidErr.value = true;
      return 'Please enter your address';
    }
    addressValidErr.value = false;
    return null;
  }

  String? postalCodeValid({required String postalCode}) {
    if (postalCode.trim().isEmpty) {
      phoneValidErr.value = true;
      return 'Please enter your postal code';
    } else if (postalCode.trim().length < 6) {
      phoneValidErr.value = true;
      return 'Please enter valid postal code!(minimum 6 digit)';
    }
    phoneValidErr.value = false;
    return null;
  }

  String? validDateOfB({required String dob}) {
    if (dob.isEmpty) {
      dateOfBValidErr.value = true;
      return 'Please select your date of birth';
    }
    dateOfBValidErr.value = false;
    return null;
  }

  bool validateDropDown(String selectValue) {
      if (selectValue.isEmpty) {
        return true;
      } else {
        return false;
      }
  }

}

enum Gender { male, female, other, noGender }