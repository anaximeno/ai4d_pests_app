import 'dart:io';

import 'package:ai4d_pests_app/ui/components/basic_alert_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class ClassificationController extends GetxController {
  final _file = Rxn<File>();

  ClassificationController();

  File? get file => _file.value;

  set file(File? value) => _file.value = value;

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      allowedExtensions: ["jpg"],
    );

    if (result != null && result.files.single.extension == 'jpg') {
      file = File(result.files.single.path!);
    } else {
      Get.dialog(
        BasicAlertDialog(
          title: "Attention!",
          description: "Please select valid '.jpg' image file.",
          onOk: Get.back,
        ),
      );
    }
  }
}
