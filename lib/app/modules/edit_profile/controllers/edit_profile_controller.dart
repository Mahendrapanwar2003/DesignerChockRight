import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_designer_chowk/app/apis/constant/constant_uris.dart';

class EditProfileController extends GetxController {
  final count = 0.obs;

  // ignore: non_constant_identifier_names
  final full_name = ''.obs;
  final name = TextEditingController();
  final emailE = TextEditingController();
  final mobileN = TextEditingController();

  // ignore: non_constant_identifier_names
  final user_profile = ''.obs;
  final mobile = ''.obs;
  final email = ''.obs;
  String? token = '';
  final img = Rxn<File?>();

  @override
  void onInit() {
    super.onInit();
    callApi();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  callApi() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    token = sp.getString('token') as String;
    http.Response res = await http.get(
        Uri.parse(ConstantUris.endpointGetUserProfile),
        headers: {'Authorization': token!});
    if (res.statusCode == 200) {
      Map map = jsonDecode(res.body);
      Map<String, dynamic> data = map['user_profile'];
      full_name.value = data['full_name'] ?? "";
      email.value = data['email'] ?? "";
      mobile.value = data['mobile'] ?? "";
      user_profile.value = data['user_profile'] ?? '';
      name.text = full_name.value;
      emailE.text = email.value;
      mobileN.text = "+91 ${mobile.value}";
    } else if (res.statusCode == 401) {
      print("401Unauthorized");
    } else if (res.statusCode == 400) {
      print("400Bad Request");
    }
  }

  Future<void> updateProfile(BuildContext context) async {
    http.Response res;
    if (img.value != null) {
      var request =
      http.MultipartRequest("POST", Uri.parse(ConstantUris.endpointUpdateUserProfile));
      request.fields['full_name'] = name.text;
      request.fields['email'] = emailE.text;
      request.headers['Authorization'] = token!;
      if (img.value!= null)
      request.files.add(getUserProfileImageFile());
      http.StreamedResponse response = await request.send();
      res = await http.Response.fromStream(response);
    } else {
      res = await http.post(
        Uri.parse(ConstantUris.endpointUpdateUserProfile),
        body: {
          "full_name": name.text,
          "email": emailE.text,
        },
        headers: {"Authorization": token!},
      );
    }
    if (res.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(res.body);
      Get.back();
    }else {
      print('Error.................');
    }
  }

  clickCamera(BuildContext context) {
    openDialog(context);
  }

  void openDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: const Text("Select Image"),
      content: Text("Choose image from the options below.",
          style: Theme.of(context).textTheme.button?.copyWith(
              color: Theme.of(context).textTheme.headline1?.color,
              fontSize: 15,
              fontWeight: FontWeight.w100)),
      actions: [
        TextButton(
          onPressed: () => pickImage(ImageSource.gallery,context),
          child: const Text(
            'GALLERY',
            style: TextStyle(color: Colors.purple, letterSpacing: 1),
          ),
        ),
        TextButton(
          onPressed: () => pickImage(ImageSource.camera,context),
          child: const Text(
            'CAMERA',
            style: TextStyle(color: Colors.purple, letterSpacing: 1),
          ),
        ),
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  pickImage(ImageSource imageSource,BuildContext context) async {
    Get.back();
    XFile? imagePicker = await ImagePicker().pickImage(source: imageSource);
    if (imagePicker != null) {
      img.value = File(imagePicker.path);
      imageCropper(context);
    }
  }

  Future<void> imageCropper(BuildContext context) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: img.value!.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      compressQuality: 30,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            statusBarColor: Theme.of(context).colorScheme.secondary,
            toolbarColor: Theme.of(context).colorScheme.secondary,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    if (croppedFile != null) {
      img.value = File(croppedFile.path);
    }
  }

  http.MultipartFile getUserProfileImageFile() {
    return http.MultipartFile.fromBytes(
        'user_profile', img.value!.readAsBytesSync(),
        filename: img.value!.uri.pathSegments.last);
  }
}
