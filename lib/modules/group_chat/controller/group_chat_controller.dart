import 'package:anantkaal_chat_name/api_services/api_services.dart';
import 'package:anantkaal_chat_name/common/widget/app_toasts.dart';
import 'package:anantkaal_chat_name/modules/group_chat/model/group_chat_model.dart';
import 'package:anantkaal_chat_name/utils/base_methods.dart';
import 'package:anantkaal_chat_name/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:image_picker/image_picker.dart';

class GroupChatController extends GetxController {

  static final ApiService apiService = ApiService.create();
  RxList<ChatData> messages = <ChatData>[].obs;
  Rx<TextEditingController> messageController = TextEditingController().obs;
  FocusNode messageFocusNode = FocusNode();
  Rx<bool> messageValidErr = false.obs;
  String loggedInUserEmail = '';
  String name = '';
  dynamic arguments = Get.arguments;

  dio.MultipartFile? file;
  Rxn<XFile> profileImage = Rxn<XFile>();
  final ImagePicker _picker = ImagePicker();
  RxString imagePick = RxString('');
  RxString userNameE = RxString('');
  RxString userEmail = RxString('');

  @override
  void onInit() {
    loggedInUserEmail = arguments['email'];
    name = arguments['name'];
    fetchAllMessages();
    super.onInit();
  }

  Future<void> selectImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    profileImage.value = image;
    if(profileImage.value != null) {
      appPrint('${profileImage.value?.path}');
      uploadImage();
    } else {
      AppToasts.showError('image not select');
    }
    update();
  }


  Future<dynamic> fetchAllMessages() async {
    try {
      final response = await apiService.getAllChat('1');
      if(response.status == 'true') {
        messages.assignAll(response.data);
        if (response.status == "true") {
          for (var chatData in response.data) {
            appPrint("Message: ${chatData.chatDetails.message}");
          }
        }
      }
    } on DioException catch (onError) {
      final res = onError.response;
      appPrint('Error:: ${res.toString()}');
    }
  }

  Future<void> sendMessage() async {
    try {
      final response = await apiService.postSendMessage({
        'message': messageController.value.text,
        'image': imagePick.value,
      });
      if (response['status'] == 'true') {
        fetchAllMessages();
        messageController.value.clear();
        imagePick.value = '';
      }
    } on DioException catch (e) {
      Get.snackbar("Error", "Failed to send message: ${e.response}");
    }
  }

  Future<void> uploadImage() async {
    progressIndicator(Get.context!);
    if (profileImage.value?.path != null) {
      file = await dio.MultipartFile.fromFile(profileImage.value?.path ?? '');
    }
    try {
      final formData = dio.FormData.fromMap({
        'file': file,
      });
      final response = await apiService.postImagesSent(formData);
      if (response['half_url'] != null) {
        hideProgressIndicator();
        appPrint('image url:: ${response['half_url']}');
        imagePick.value = response['half_url'];
      } else {
        hideProgressIndicator();
      }
    } on DioException catch (e) {
      hideProgressIndicator();
      Get.snackbar("Error","Failed to send image: ${e.response}");
    }
  }
}