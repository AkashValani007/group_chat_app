import 'package:anantkaal_chat_name/common/widget/common_input_text_field.dart';
import 'package:anantkaal_chat_name/config/theme/app_colors.dart';
import 'package:anantkaal_chat_name/gen/assets.gen.dart';
import 'package:anantkaal_chat_name/gen/fonts.gen.dart';
import 'package:anantkaal_chat_name/modules/google_singin/controller/google_signin_controller.dart';
import 'package:anantkaal_chat_name/modules/group_chat/controller/group_chat_controller.dart';
import 'package:anantkaal_chat_name/utils/base_extensions.dart';
import 'package:anantkaal_chat_name/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class GroupChatView extends GetView<GroupChatController> {
  GroupChatView({super.key});

  final profileController = Get.put<GroupChatController>(GroupChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textFieldBgColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.uiColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Group Chat',style: TextStyle(fontSize: 30,
                          fontWeight: FontWeight.w700,fontFamily: FontFamily.cherrySwash,color: Color(0xffFDFFFF)),),
                      Text('Hi ${controller.name}',style: TextStyle(fontSize: 14,
                          fontWeight: FontWeight.w400,fontFamily: FontFamily.exo,color: AppColors.appWhiteColor),),
                    ],
                  ).paddingSymmetric(vertical: 10,horizontal: 22),
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () {
                            final c = Get.put(GoogleSignInController());
                            c.signOut();
                          },
                          child: Icon(Icons.logout_rounded,color: AppColors.appWhiteColor,size: 25,)),
                    ],
                  ).paddingSymmetric(horizontal: 22)),
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  reverse: true,
                  padding: EdgeInsets.all(10),
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    final chat = controller.messages[index];
                    bool isMe = chat.userDetails.email == controller.loggedInUserEmail;
                    appPrint('userDetails:: ${chat.userDetails.email}');
                    appPrint('loggedInUserEmail:: ${controller.loggedInUserEmail}');
                    DateTime messageTime = DateTime.parse(chat.chatDetails.createdAt ?? "");
                    String formattedTime = DateFormat('hh:mm a').format(messageTime);

                    return Align(
                      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: SizedBox(
                          width: isMe ? MediaQuery.of(context).size.width * 0.4 : MediaQuery.of(context).size.width * 0.7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(isMe ? 'You'  : chat.userDetails.name ?? '',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.uiColor,
                                          fontFamily: FontFamily.exo,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Align(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: isMe ? 10 : 10),
                                      child: Text(
                                        formattedTime,
                                        style: TextStyle(fontSize: 12,
                                            color: Color(0xff667085),
                                            fontFamily: FontFamily.exo,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              2.0.toVSB,
                              Align(
                                alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                                child: Container(
                                  width: isMe ? MediaQuery.of(context).size.width * 0.4 : MediaQuery.of(context).size.width * 0.7,
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Color(0xffDDEFF0),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: isMe ? Radius.circular(0) : Radius.circular(12),
                                      bottomLeft: isMe ? Radius.circular(12) : Radius.circular(0),
                                      bottomRight: Radius.circular(12),
                                    ),
                                  ),
                                  child: Text(
                                    chat.chatDetails.message ?? "",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              16.0.toVSB,
                              Align(
                                alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                                child: Column(
                                  children: [
                                    if (chat.chatDetails.image != null &&
                                        chat.chatDetails.image!.isNotEmpty &&
                                        isMe)
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('You',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: AppColors.uiColor,
                                                    fontFamily: FontFamily.exo,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                              Align(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: isMe ? 10 : 10),
                                                  child: Text(
                                                    formattedTime,
                                                    style: TextStyle(fontSize: 12,
                                                        color: Color(0xff667085),
                                                        fontFamily: FontFamily.exo,
                                                        fontWeight: FontWeight.w400),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 8.0),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(8),
                                              child: Image.network(
                                                "${'https://spell.theanantkaal.com/'}/${chat.chatDetails.image}",
                                                width: 150,
                                                height: 150,
                                                fit: BoxFit.cover,
                                                loadingBuilder: (context, child, loadingProgress) {
                                                  if (loadingProgress == null) {
                                                    return child; // Image has loaded
                                                  }
                                                  return Center(
                                                    child: CircularProgressIndicator(
                                                      color: AppColors.uiColor,
                                                      strokeWidth: 1,
                                                      value: loadingProgress.expectedTotalBytes != null
                                                          ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                                          : null,
                                                    ),
                                                  );
                                                },
                                                errorBuilder: (context, error, stackTrace) =>
                                                    Icon(Icons.error, size: 50),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            _buildMessageInput(onTap: () {
              controller.selectImage();
            },),
            29.0.toVSB,
          ],
        ),
      ),
    );
  }


  Widget _buildMessageInput({void Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: CommonInputTextField(
              isFilled: true,
              isBackGroundColorShow: true,
              controller: controller.messageController.value,
              focusNode: controller.messageFocusNode,
              inputType: TextInputType.name,
              prefix: Padding(
                padding: const EdgeInsets.all(14),
                child: SvgPicture.asset(Assets.icons.icSmiley),
              ),
              suffix: GestureDetector(
                onTap: onTap,
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: SvgPicture.asset(Assets.icons.icImageAdd),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              controller.sendMessage();
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.uiColor,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 14),
              child: Center(
                  child: SvgPicture.asset(Assets.icons.icMsgSent)),
            ),
          ),
        ],
      ),
    );
  }
}
