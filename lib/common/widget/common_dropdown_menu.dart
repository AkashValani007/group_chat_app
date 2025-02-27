import 'package:anantkaal_chat_name/config/theme/app_colors.dart';
import 'package:anantkaal_chat_name/gen/assets.gen.dart';
import 'package:anantkaal_chat_name/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonDropdownMenu extends StatelessWidget {
  const CommonDropdownMenu({
    super.key,
    this.dropdownMenuEntry,
    this.hintText,
    this.onSelected,
    this.leadingIcon,
    this.leadingIconDMenu,
    this.errorText = '',
    this.validErr = false,
    this.initialValue,
    this.height,
    this.textStyle,
  });

  final String? hintText;
  final List<String>? dropdownMenuEntry;
  final void Function(String?)? onSelected;
  final Widget? leadingIcon;
  final Widget? leadingIconDMenu;
  final bool validErr;
  final String errorText;
  final String? initialValue;
  final double? height;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          height: height ?? 48,
          child: DropdownMenu(
            expandedInsets: EdgeInsets.zero,
            menuHeight: 200,
            selectedTrailingIcon: SvgPicture.asset(Assets.icons.icArrowUp,color: AppColors.uiColor,height: 8,width: 8,),
            inputDecorationTheme: InputDecorationTheme(
              isCollapsed: true,
              isDense: true,
              errorMaxLines: 2,
              contentPadding: const EdgeInsets.only(left: 16),
              hintStyle: TextStyle(fontFamily: FontFamily.exo,
                fontSize: 14,
                fontWeight: FontWeight.w400,color: AppColors.hintText),
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(
                    color: validErr == true ?
                    AppColors.textFieldBorder.withOpacity(0.25) : AppColors.textFieldBorder.withOpacity(0.25),
                    width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(
                    color: validErr == true ?
                    AppColors.textFieldBorder.withOpacity(0.25) : AppColors.textFieldBorder.withOpacity(0.25),
                    width: 1),
              ),
              errorStyle: TextStyle(
                  fontFamily: FontFamily.exo,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: AppColors.errorColor,
                  overflow: TextOverflow.visible),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(
                    color: validErr == true ?
                    AppColors.textFieldBorder.withOpacity(0.25) : AppColors.textFieldBorder.withOpacity(0.25),
                    width: 1),
              ),
            ),
            hintText: hintText ?? 'Select',
            textStyle: textStyle ?? TextStyle(fontFamily: FontFamily.exo,
              fontSize: 14,
              fontWeight: FontWeight.w400,color: AppColors.textHintDrop),
            trailingIcon: SvgPicture.asset(Assets.icons.icArrowDown),
            leadingIcon: leadingIcon,
            enabled: true,
            dropdownMenuEntries: dropdownMenuEntry!
                    .map<DropdownMenuEntry<String>>((String item) {
                    return DropdownMenuEntry<String>(
                      value: item,
                      label: item,
                      leadingIcon: leadingIconDMenu,
                    );
                  }).toList(),
            onSelected: onSelected,
            menuStyle: MenuStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.only(left: 0)),
              alignment: Alignment.bottomLeft,
              visualDensity: VisualDensity.standard,
              backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  return AppColors.appWhiteColor;
                },
              ),
              elevation: MaterialStateProperty.resolveWith<double?>(
                (Set<MaterialState> states) {
                  return 3;
                },
              ),
              shadowColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  return AppColors.primaryColor;
                },
              ),
            ),
            initialSelection: initialValue,
          ),
        ),
        validErr == true
            ? Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                  errorText,
                  style: TextStyle(
                      fontFamily: FontFamily.exo,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: AppColors.errorColor,
                      overflow: TextOverflow.visible),
                ),
            )
            : const SizedBox.shrink(),
      ],
    );
  }
}
