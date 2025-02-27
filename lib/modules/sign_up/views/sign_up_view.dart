import 'package:anantkaal_chat_name/common/widget/app_toasts.dart';
import 'package:anantkaal_chat_name/common/widget/common_dropdown_menu.dart';
import 'package:anantkaal_chat_name/common/widget/common_input_text_field.dart';
import 'package:anantkaal_chat_name/config/theme/app_colors.dart';
import 'package:anantkaal_chat_name/gen/assets.gen.dart';
import 'package:anantkaal_chat_name/gen/fonts.gen.dart';
import 'package:anantkaal_chat_name/modules/google_singin/controller/google_signin_controller.dart';
import 'package:anantkaal_chat_name/modules/sign_up/controller/sign_up_controller.dart';
import 'package:anantkaal_chat_name/utils/base_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textFieldBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey.value,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                24.0.toVSB,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Sign Up',style: TextStyle(fontSize: 40,
                        fontWeight: FontWeight.w700,fontFamily: FontFamily.cherrySwash,color: AppColors.uiColor),),
                    InkWell(
                      onTap: () {
                        final c = Get.find<GoogleSignInController>();
                        c.signOut();
                      },
                        child: Icon(Icons.logout_rounded)),
                  ],
                ),
                Text('Please enter your credentials to proceed ',style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.w400,fontFamily: FontFamily.exo,color: Color(0xff3A4750)),),
                33.0.toVSB,
                hintCommonText(hintText: 'Full Name'),
                8.0.toVSB,
               CommonInputTextField(
                      controller: controller.fullNameController.value,
                      focusNode: controller.fullNameFocusNode,
                      validErr: controller.fullNameValidErr.value,
                      inputType: TextInputType.name,
                      validator: (value) =>
                          controller.validFullName(fullName: value ?? ''),
                    ),
                24.0.toVSB,
                hintCommonText(hintText: 'Phone'),
                8.0.toVSB,
                CommonInputTextField(
                    controller: controller.phoneController.value,
                    focusNode: controller.phoneFocusNode,
                    validErr: controller.phoneValidErr.value,
                    inputType: TextInputType.number,
                    maxLength: 10,
                    counterText: '',
                    prefix: Container(
                      width: 58,
                      margin: EdgeInsets.only(left: 14),
                      child: Row(
                        children: [
                          SvgPicture.asset(Assets.icons.icFlagIndia),
                          8.0.toHSB,
                          Text('+91',style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: FontFamily.openSans,
                              color: AppColors.uiColor),),
                          8.0.toHSB,
                        ],
                      ),
                    ),
                    validator: (value) => controller.phoneValidationField(value ?? ''),
                  ),
                24.0.toVSB,
                hintCommonText(hintText: 'Email address'),
                8.0.toVSB,
                CommonInputTextField(
                    controller: controller.emailController.value,
                    focusNode: controller.emailFocusNode,
                    validErr: controller.emailValidErr.value,
                    validator: (value) => controller.validateEmail(email: value ?? ''),
                  ),
                24.0.toVSB,
                hintCommonText(hintText: 'Password'),
                8.0.toVSB,
                CommonInputTextField(
                    controller: controller.passwordController.value,
                    focusNode: controller.passwordFocusNode,
                    validErr: controller.passValidErr.value,
                    validator: (value) => controller.validatePassword(password: value ?? ''),
                  ),
                24.0.toVSB,
                hintCommonText(hintText: 'Address:'),
                8.0.toVSB,
               CommonInputTextField(
                    maxLines: 4,
                    isHeight: 48,
                    controller: controller.addressController.value,
                    focusNode: controller.addressFocusNode,
                    validErr: controller.addressValidErr.value,
                    validator: (value) => controller.validAddress(address: value ?? ''),
                  ),
                24.0.toVSB,
                hintCommonText(hintText: 'Country'),
                8.0.toVSB,
                Obx(() => CommonDropdownMenu(
                    initialValue: controller.selectCountry?.value,
                    dropdownMenuEntry: controller.countryList,
                    onSelected: (String? newValue) {
                      controller.selectCountry?.value = newValue ?? '';
                      controller.selectCountryError.value = false;
                    },
                    validErr: controller.selectCountryError.value,
                    errorText: 'Please select country',
                  ),
                ),
                24.0.toVSB,
                hintCommonText(hintText: 'State'),
                8.0.toVSB,
                Obx(() => CommonDropdownMenu(
                    initialValue: controller.selectState?.value,
                    dropdownMenuEntry: controller.stateList,
                    onSelected: (String? newValue) {
                      controller.selectState?.value = newValue ?? '';
                      controller.selectStateError.value = false;
                    },
                    validErr: controller.selectStateError.value,
                    errorText: 'Please select state',
                  ),
                ),
                24.0.toVSB,
                hintCommonText(hintText: 'City'),
                8.0.toVSB,
                Obx(() => CommonDropdownMenu(
                    initialValue: controller.selectCity?.value,
                    dropdownMenuEntry: controller.cityList,
                    onSelected: (String? newValue) {
                      controller.selectCity?.value = newValue ?? '';
                      controller.selectCityError.value = false;
                    },
                    validErr: controller.selectCityError.value,
                    errorText: 'Please select city',
                  ),
                ),
                24.0.toVSB,
                hintCommonText(hintText: 'Postal Code'),
                8.0.toVSB,
                Obx(() => CommonInputTextField(
                    controller: controller.postalCodeController.value,
                    focusNode: controller.postalCodeFocusNode,
                    validErr: controller.postalCodeValidErr.value,
                    inputType: TextInputType.number,
                    validator: (value) => controller.postalCodeValid(postalCode: value ?? ''),
                  ),
                ),
                24.0.toVSB,
                hintCommonText(hintText: 'My date of birth:'),
                8.0.toVSB,
                CommonInputTextField(
                    readOnly: true,
                    controller: controller.dateOfBirthController.value,
                    focusNode: controller.dateOfBirthFocusNode,
                    suffixIcon: Assets.icons.icDateOfB,
                    inputType: TextInputType.name,
                    hint: 'Select',
                    validErr: controller.dateOfBValidErr.value,
                    validator: (value) => controller.validDateOfB(dob: value ?? ''),
                    textFieldOnTap: () async {
                      final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1947),
                          lastDate: DateTime.now());
                      if (pickedDate != null) {
                        final formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
                        controller.dateOfBirthController.value.text = formattedDate;
                        final dobFormatted = DateFormat('yyyy/MM/dd').format(pickedDate);
                        controller.dateOfBrith.value = dobFormatted;
                      }
                    },
                  ),
                24.0.toVSB,
                hintCommonText(hintText: 'Gender'),
                8.0.toVSB,
                buildGenderSelect(context),
                50.0.toVSB,
                Center(
                  child: GestureDetector(
                    onTap: () {
                      controller.selectCountryError.value = controller.validateDropDown(controller.selectCountry?.value ?? '');
                      controller.selectCityError.value = controller.validateDropDown(controller.selectCity?.value ?? '');
                      controller.selectStateError.value = controller.validateDropDown(controller.selectState?.value ?? '');

                      if(controller.formKey.value.currentState!.validate()) {
                        if(controller.selectedGender.value == Gender.noGender) {
                          AppToasts.showError('please select gender');
                        } else {
                          controller.signUpUser();
                        }
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: AppColors.uiColor,
                      ),
                      child:  Text('Create Account'.toUpperCase(),textAlign: TextAlign.center,style: TextStyle(
                          color: AppColors.appWhiteColor,
                          fontFamily: FontFamily.openSans,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),),
                    ),
                  ),
                ),
                117.0.toVSB,
               ],
            ).paddingSymmetric(horizontal: 20),
          ),
        ),
      ),
    );
  }


  Widget hintCommonText({String? hintText,Color? color,FontWeight? fontWeight,double? fontSize}){
    return Text(hintText ?? '',style: TextStyle(color: AppColors.uiColorHint ?? color,fontSize: 14 ?? fontSize,
        fontWeight: FontWeight.w600 ?? fontWeight,fontFamily: FontFamily.exo),);
  }

  Widget buildGenderSelect(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() =>
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      controller.selectedGender.value = Gender.male;
                    },
                    child: Row(
                      children: [
                        Radio<Gender>(
                          value: Gender.male,
                          visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity),
                          materialTapTargetSize: MaterialTapTargetSize
                              .shrinkWrap,
                          activeColor: AppColors.uiColor,
                          groupValue: controller.selectedGender.value,
                          onChanged: (Gender? value) {
                            controller.selectedGender.value = value ?? Gender.male;
                          },
                        ),
                        10.0.toHSB,
                        Text('Male',style: TextStyle(
                          color: Color(0xff344054),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.selectedGender.value = Gender.female;
                    },
                    child: Row(
                      children: [
                        Radio<Gender>(
                          value: Gender.female,
                          visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity),
                          materialTapTargetSize: MaterialTapTargetSize
                              .shrinkWrap,
                          activeColor: AppColors.uiColor,
                          groupValue: controller.selectedGender.value,
                          onChanged: (Gender? value) {
                            controller.selectedGender.value = value ?? Gender.male;
                          },
                        ),
                        10.0.toHSB,
                        Text('Female',style: TextStyle(
                          color: Color(0xff344054),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.selectedGender.value = Gender.other;
                    },
                    child: Row(
                      children: [
                        Radio<Gender>(
                          value: Gender.other,
                          visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity),
                          materialTapTargetSize: MaterialTapTargetSize
                              .shrinkWrap,
                          activeColor: AppColors.uiColor,
                          groupValue: controller.selectedGender.value,
                          onChanged: (Gender? value) {
                            controller.selectedGender.value = value ?? Gender.other;
                          },
                        ),
                        10.0.toHSB,
                        Text('Prefer not to say',style: TextStyle(
                          color: Color(0xff344054),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),),
                      ],
                    ),
                  ),
                ],
              ),
        ),
      ],
    );
  }

}
