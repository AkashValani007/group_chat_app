  import 'package:anantkaal_chat_name/config/theme/app_colors.dart';
  import 'package:anantkaal_chat_name/gen/fonts.gen.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter/services.dart';
  import 'package:flutter_svg/flutter_svg.dart';
  import 'package:get/get.dart';

  class CommonInputTextField extends StatefulWidget {
    const CommonInputTextField({
      super.key,
      this.hint,
      this.isPassword = false,
      required this.controller,
      this.validator,
      this.hintToLabel = false,
      this.moreInstructions,
      this.autofocus = false,
      this.errorText,
      this.validErr,
      this.focusNode,
      this.onChanged,
      this.prefix,
      this.suffix,
      this.isFilled = false,
      this.prefixIcon,
      this.suffixIcon,
      this.suffixIconTap,
      this.textStyle,
      this.inputType = TextInputType.text,
      this.validateErrorField,
      this.isHeight,
      this.minLine,
      this.edgeInsetsMarginPrefix,
      this.maxLines,
      this.maxLength,
      this.counterText,
      this.isCounting = false,
      this.suffixIconConstraints,
      this.hintStyle,
      this.textInputAction,
      this.readOnly = false,
      this.onFieldSubmitted,
      this.inputFormatters,
      this.textFieldOnTap,
      this.isBackGroundColorShow = false,
    });

    final String? hint;
    final bool hintToLabel;
    final bool isPassword;
    final bool autofocus;
    final TextEditingController controller;
    final List<String>? moreInstructions;
    final Rx<String?>? errorText;
    final bool? validErr;
    final String? Function(String?)? validator;
    final FocusNode? focusNode;
    final TextStyle? textStyle;
    final Widget? suffix;
    final Widget? prefix;
    final String? prefixIcon;
    final String? suffixIcon;
    final bool? validateErrorField;
    final bool isFilled;
    final TextInputType inputType;
    final int? minLine;
    final double? isHeight;
    final EdgeInsetsGeometry? edgeInsetsMarginPrefix;
    final int? maxLines;
    final int? maxLength;
    final String? counterText;
    final bool isCounting;
    final BoxConstraints? suffixIconConstraints;
    final TextStyle? hintStyle;
    final TextInputAction? textInputAction;
    final bool readOnly;
    final bool isBackGroundColorShow;
    final List<TextInputFormatter>? inputFormatters;
    final void Function(String)? onFieldSubmitted;

    final void Function(String)? onChanged;
    final void Function()? suffixIconTap;
    final void Function()? textFieldOnTap;

    @override
    State<CommonInputTextField> createState() => _TextInputLoginState();
  }

  class _TextInputLoginState extends State<CommonInputTextField> {
    final RxBool _isFocused = false.obs;
    RxBool isPasswordVisible = false.obs; // Added property
    @override
    void initState() {
      super.initState();
      if (widget.focusNode != null) {
        widget.focusNode!.addListener(_onFocusChange);
      }
    }

    void _onFocusChange() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (widget.focusNode!.hasFocus) {
          _isFocused.value = true;
        } else {
          _isFocused.value = false;
        }
      });
    }

    @override
    void dispose() {
      widget.focusNode?.removeListener(_onFocusChange);
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      return Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                padding:  widget.isBackGroundColorShow ? null: EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                decoration: BoxDecoration(
                  color: _isFocused.value ? AppColors.textFieldShadowColor : null,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: TextFormField(
                  onFieldSubmitted: widget.onFieldSubmitted,
                  readOnly: widget.readOnly,
                  maxLength: widget.maxLength,
                  expands: checkIsPassword() ? false : false,
                  maxLines: checkIsPassword() ? 1 : widget.maxLines ?? 1,
                  minLines: widget.minLine,
                  textInputAction: widget.textInputAction ?? TextInputAction.next,
                  textAlignVertical: TextAlignVertical.top,
                  keyboardType: widget.inputType,
                  inputFormatters: widget.inputFormatters,
                  cursorColor: Color(0Xff356169),
                  controller: widget.controller,
                  autofocus: widget.autofocus,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: widget.validator,
                  style:_isFocused.value ?  TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamily.exo,
                      color: AppColors.uiColor)
                      : TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamily.exo,
                      color: Color(0xff303841)),
                  obscureText: checkIsPassword() ? !isPasswordVisible.value : false,
                  obscuringCharacter: '*',
                  cursorErrorColor: Color(0Xff356169),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 13.5,horizontal: 10),
                    errorStyle: TextStyle(
                        color: AppColors.errorColor,
                        fontFamily: FontFamily.exo,
                        fontSize: _isFocused.value ? 0 : 11,
                        fontWeight: FontWeight.w500,overflow: TextOverflow.visible),
                    counterText: widget.counterText,
                    errorMaxLines: 3,
                    hintText: widget.hint ?? '',
                    hintStyle: widget.hintStyle ??
                        TextStyle(
                          color: AppColors.hintText,
                        ),
                    suffixIconConstraints: widget.suffixIconConstraints,
                    suffixIcon: widget.suffix ??
                        (widget.suffixIcon != null
                            ? InkWell(
                          onTap: widget.suffixIconTap,
                          child: SizedBox(
                            child: SvgPicture.asset(
                              widget.suffixIcon!,
                              color: _isFocused.value ? AppColors.black : AppColors.uiColor,
                            ).paddingAll(14),
                          ),
                        )
                            : null),
                    prefixIcon: widget.prefix ??
                        (widget.prefixIcon != null
                            ? Padding(
                          padding: widget.edgeInsetsMarginPrefix ?? const EdgeInsets.only(bottom: 0),
                          child: SvgPicture.asset(
                            widget.prefixIcon!,
                            color: _isFocused.value ? AppColors.black : AppColors.uiColor,
                          ).paddingAll(14),
                        )
                            : null),
                    filled: true,
                    fillColor: widget.isFilled ?Color(0XFFDDEFF0) : _isFocused.value ? Color(0XFFDDEFF0) : Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(
                        color: _isFocused.value ? AppColors.uiColor : AppColors.textFieldBorder.withOpacity(0.25),
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(
                        color: _isFocused.value ? AppColors.uiColor : AppColors.textFieldBorder.withOpacity(0.25),
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(
                        color: _isFocused.value ? AppColors.uiColor : AppColors.textFieldBorder.withOpacity(0.25),
                        width: 1,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(
                        color: widget.validErr == true ? AppColors.textFieldBorder.withOpacity(0.25) : AppColors.textFieldBorder.withOpacity(0.25),
                        width: 1,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(
                        color: _isFocused.value ? AppColors.uiColor : AppColors.textFieldBorder.withOpacity(0.25),
                        width: 1,
                      ),
                    ),
                  ),
                  onChanged: widget.onChanged,
                  onTap: () {
                    if (widget.focusNode != null) {
                      FocusScope.of(context).requestFocus(widget.focusNode);
                    }
                    widget.textFieldOnTap?.call();
                  },
                  focusNode: widget.focusNode,
                ),
              ),
            ],
          ),
      );
    }

    bool checkIsPassword() {
      if (widget.isPassword) {
        return true;
      }
      return false;
    }
  }
